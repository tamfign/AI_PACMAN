# myTeam.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


from captureAgents import CaptureAgent
import random, time, util
from game import Directions
from util import nearestPoint
import game
import sys
sys.path.append('teams/PACMAN/')

#################
# Team creation #
#################

def createTeam(firstIndex, secondIndex, isRed,
               first = 'OffensiveAgent', second = 'DefensiveAgent'):
  """
  This function should return a list of two agents that will form the
  team, initialized using firstIndex and secondIndex as their agent
  index numbers.  isRed is True if the red team is being created, and
  will be False if the blue team is being created.

  As a potentially helpful development aid, this function can take
  additional string-valued keyword arguments ("first" and "second" are
  such arguments in the case of this function), which will come from
  the --redOpts and --blueOpts command-line arguments to capture.py.
  For the nightly contest, however, your team will be created without
  any extra arguments, so you should make sure that the default
  behavior is what you want for the nightly contest.
  """

  # The following line is an example only; feel free to change it.
  return [eval(first)(firstIndex), eval(second)(secondIndex)]

##########
# Agents #
##########

class ReflexCaptureAgent(CaptureAgent):

    def getSuccessor(self, gameState, action):
        successor = gameState.generateSuccessor(self.index, action)

        pos = successor.getAgentState(self.index).getPosition()
        if pos != nearestPoint(pos):
            successor = successor.generateSuccessor(self.index, action)

        return successor

    def evaluate(self, gameState, action):
        features = self.getFeatures(gameState, action)
        weights = self.getWeights(gameState, action)
        return features * weights

    def getFeatures(self, gameState, action):
        ret = util.Counter()

        successor = self.getSuccessor(gameState, action)
        features['score'] = self.getScore(successor)
        return ret

    def getWeights(self, gameState, action):
        return { 'score': 1.0 }


class OffensiveAgent(ReflexCaptureAgent):

    def __init__(self, index):
        CaptureAgent.__init__(self, index)
        self.numEnemyFood = "+inf"
        self.inactiveTime = 0

    def registerInitialState(self, gameState):
        CaptureAgent.registerInitialState(self, gameState)
        # self.distancer.getMazeDistances()

    def chooseAction(self, gameState):
        self.updateInactiveTime(gameState)

        # If it can only choose action can lead to some where in future 5 stpes
        actions = gameState.getLegalActions(self.index)
        actions.remove(Directions.STOP)
        next = []
        for action in actions:
            if not self.toDeadEnd(gameState, action, 5):
                next.append(action)
        if len(next) == 0:
            next = actions

        values = []
        for action in next:
            successor = gameState.generateSuccessor(self.index, action)
            value = 0
            # randomly pick 30 movie with their value of following 10 steps
            for i in range(1, 31):
                value += self.randomValue(successor, 10)
            values.append(value)

        best = max(values)
        ties = filter(lambda x: x[0] == best, zip(values, next))
        return random.choice(ties)[1]

    def updateInactiveTime(self, gameState):
        # Check whether its in active
        foodCount = len(self.getFood(gameState).asList())
        if self.numEnemyFood != foodCount:
            self.numEnemyFood = foodCount
            self.inactiveTime = 0
        else:
            self.inactiveTime += 1
        if gameState.getInitialAgentPosition(self.index) == gameState.getAgentState(self.index).getPosition():
            self.inactiveTime = 0

    def toDeadEnd(self, gameState, action, depth):
        if depth == 0:
            return False;

        old = self.getScore(gameState)
        successor = gameState.generateSuccessor(self.index, action)
        score = self.getScore(successor)
        if old < score:
            return False;

        actions = self.getForwardActions(successor)
        if len(actions) == 0:
            return True;
        for action in actions:
            if not self.toDeadEnd(successor, action, depth - 1):
                return False
        return True

    def randomValue(self, gameState, depth):
        state = gameState.deepCopy()
        while depth > 0:
            actions = self.getForwardActions(state)
            action = random.choice(actions)
            state = state.generateSuccessor(self.index, action)
            depth -= 1
        return self.evaluate(state, Directions.STOP)

    def getForwardActions(self, gameState):
        actions = gameState.getLegalActions(self.index)
        actions.remove(Directions.STOP)
        reversed = Directions.REVERSE[gameState.getAgentState(self.index).configuration.direction]
        if reversed in actions and len(actions) > 1:
            actions.remove(reversed)

        return actions

    def getFeatures(self, gameState, action):
        ret = util.Counter()
        successor = self.getSuccessor(gameState, action)

        nextPos = successor.getAgentState(self.index).getPosition()
        ret['score'] = self.getScore(successor)

        foodList = self.getFood(successor).asList()
        if len(foodList) > 0:
            ret['toFood'] = min([self.getMazeDistance(nextPos, food) for food in foodList])

        enemies = [successor.getAgentState(i) for i in self.getOpponents(successor)]
        inRange = filter(lambda x: not x.isPacman and x.getPosition() != None, enemies)
        if len(inRange) > 0:
            positions = [agent.getPosition() for agent in inRange]
            closest = min(positions, key=lambda x: self.getMazeDistance(nextPos, x))
            distance = self.getMazeDistance(nextPos, closest)
            if distance <= 5:
                ret['toGhost'] = distance

        ret['isPacman'] = 0
        if successor.getAgentState(self.index).isPacman:
            ret['isPacman'] = 1

        return ret

    def getWeights(self, gameState, action):
        if self.inactiveTime > 80:
            return {'score': 200, 'toFood': -5, 'toGhost': 2, 'isPacman':  1000}

        successor = self.getSuccessor(gameState, action)
        current = successor.getAgentState(self.index).getPosition()

        enemies = [successor.getAgentState(i) for i in self.getOpponents(successor)]
        inRange = filter(lambda x: not x.isPacman and x.getPosition() != None, enemies)
        if len(inRange) > 0:
            positions = [agent.getPosition() for agent in inRange]
            closest = min(positions, key=lambda x: self.getMazeDistance(current, x))
            distance = self.getMazeDistance(current, closest)

            closeEnemy = filter(lambda x: x[0] == closest, zip(positions, inRange))
            for agent in closeEnemy:
                if agent[1].scaredTimer > 0:
                    return {'score': 200, 'toFood': -5, 'toGhost': 0, 'isPacman': 0}
        return {'score': 200, 'toFood': -5, 'toGhost': 2, 'isPacman': 0}


class DefensiveAgent(ReflexCaptureAgent):

    def __init__(self, index):
        CaptureAgent.__init__(self, index)
        self.target = None
        self.lastFoods = None
        self.guardSpots = []

    def registerInitialState(self, gameState):
        CaptureAgent.registerInitialState(self, gameState)
        self.distancer.getMazeDistances()
        if self.red:
            centralX = (gameState.data.layout.width - 2) / 2
        else:
            centralX = ((gameState.data.layout.width - 2) / 2) + 1

        # no wall = entry
        for i in range(1, gameState.data.layout.height - 1):
            if not gameState.hasWall(centralX, i):
                self.guardSpots.append((centralX, i))

        #if more than half are entries, get rid of the first and last?
        if len(self.guardSpots) > (gameState.data.layout.height - 2) / 2:
            self.guardSpots.pop(0)
            self.guardSpots.pop(len(self.guardSpots) - 1)

    def chooseAction(self, gameState):

        # caught the target
        enemies = [gameState.getAgentState(i) for i in self.getOpponents(gameState)]
        invaders = filter(lambda x: x.isPacman and x.getPosition() != None, enemies)

	self.target = selectTarget(invaders)
        self.lastFoods = self.getFoodYouAreDefending(gameState).asList()

        actions = gameState.getLegalActions(self.index)
        next = []
        fvalues = []
        for action in actions:
            successor = gameState.generateSuccessor(self.index, action)
            if not successor.getAgentState(self.index).isPacman and not action == Directions.STOP:
                pos = successor.getAgentPosition(self.index)
                next.append(action)
                fvalues.append(self.getMazeDistance(pos, self.target))
        best = min(fvalues)
        ties = filter(lambda x: x[0] == best, zip(fvalues, next))
        return random.choice(ties)[1]

    def selectTarget(self, invaders):
	ret = None

        pos = gameState.getAgentPosition(self.index)
        if pos == self.target:
            ret = None

        # catch the closest invader
        if len(invaders) > 0:
            positions = [agent.getPosition() for agent in invaders]
            ret = min(positions, key=lambda x: self.getMazeDistance(pos, x))
        elif self.lastFoods != None:
            eaten = set(self.lastFoods) - set(self.getFoodYouAreDefending(gameState).asList())
            if len(eaten) > 0:
                ret = eaten.pop()

        if ret == None:
            ret = random.choice(self.guardSpots)

        return ret
