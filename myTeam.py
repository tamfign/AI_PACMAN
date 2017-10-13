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
from qLearning import qLearning_strategy
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

    def __init__(self):
        self.ret = None

    def getSuccessor(self, gameState, action):
        successor = gameState.generateSuccessor(self.index, action)
        #print 'successor: ', successor
        pos = successor.getAgentState(self.index).getPosition()
        if pos != nearestPoint(pos):
            successor = successor.generateSuccessor(self.index, action)
        #print type(gameState)

        return successor

    def get_ret(self):
        return self.ret

    def evaluate(self, gameState, action):
        features = self.getFeatures(gameState, action)
        self.ret = features
        weights = self.getWeights(gameState, action)
        #print 'lala', features * weights


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
        self.ret = {'isPacman': 0}
        self.numEnemyFood = "+inf"
        self.inactiveTime = 0
        # added
        self.__qlearning = qLearning_strategy(self,index)
        self.__actioncount = 0
        self.__actionLst = []
        self.__stateLst = []
        #self.__qtable = self.__qlearning.get_qtable()

    def registerInitialState(self, gameState):
        CaptureAgent.registerInitialState(self, gameState)
        # self.distancer.getMazeDistances()

    def chooseAction(self, gameState):
        self.updateInactiveTime(gameState)

        # If it can only choose action can lead to some where in future 5 stpes
        actions = gameState.getLegalActions(self.index)
        actions.remove(Directions.STOP)
        nextAction = []
        for action in actions:
            if not self.toDeadEnd(gameState, action, 5):
                nextAction.append(action)
        if len(nextAction) == 0:
            print(actions)
            nextAction = actions

        values = []
        #print self.get_ret()
        #try:
        #    if self.get_ret()['toGhost']!=0 and self.get_ret()['isPacman'] == 0 and 'East' in nextAction and self.index == 0:
        #        self.actionPlanBuild(gameState, 'East')
        #        print nextAction
        #        return 'East'

        #   else:
        return self.return_action(nextAction, gameState)
        #except:
        #    print 'here2'
        #    return self.return_action(nextAction, gameState)

    #new added : n:
    # new added : number3
    def randomChoice(self, nextAction, gameState):
        try:
            takeAction = random.choice(nextAction)
        except:
            actions = gameState.getLegalActions(self.index)
            actions.remove(Directions.STOP)
            takeAction = self.return_action(actions,gameState)
        return takeAction

    def return_action(self, nextAction, gameState):
        values = []
        for action in nextAction:
            successor = gameState.generateSuccessor(self.index, action)
            value = 0
            # randomly pick 30 movie with their value of following 10 steps
            for i in range(1, 31):
                value += self.randomValue(successor, 10)
            values.append(value)
        # Qlearning started:
        #self.actionPlanBuild()
        try:
            bestAction = max(values)
            cleanlst = filter(lambda x: x[0] == bestAction, zip(values, nextAction))
            takeAction = random.choice(cleanlst)[1]
        except ValueError:
            takeAction = self.randomChoice(nextAction, gameState)
        if self.actionPlanBuild(gameState, takeAction):
            nextAction.remove(takeAction)
            takeAction = self.randomChoice(nextAction, gameState)
            print takeAction
        #if not self.revActionCheck(self.__actionLst)
        return takeAction
    # new added: number 2
    # @ input : action, state
    # if already have five steps plan, then check if there is reverse happened
    def actionPlanBuild(self, gameState, action):
        self.__stateLst.append(gameState)
        self.__actionLst.append(action)
        self.__actioncount += 1
        result = False
        if self.__actioncount == 5:
            self.__actioncount = 0
            if not self.revActionCheck(self.__actionLst):
                #print self.__actionLst
                #self.__qlearning.init_table(self.__stateLst)
                result = True
            self.__actionLst = []
            self.__stateLst = []
        return result

    def deadLoopCount(self):
        lst = []
        count = 0
        for item in self.__actionLst:
            if not item in lst:
                lst.append(item)
                count+=1
        if count ==2:
            return True
        else:
            return False




    def updateInactiveTime(self, gameState):
        # Check whether its in active
        # If pacman active it is in danger
        foodCount = len(self.getFood(gameState).asList())
        #print 'foodCound: ', gameState
        #print self.numEnemyFood
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
        #print gameState,state
        while depth > 0:
            actions = self.getForwardActions(state)
            action = random.choice(actions)
            #print self.index
            state = state.generateSuccessor(self.index, action)
            depth -= 1
            #print self.evaluate(state, Directions.STOP)
        return self.evaluate(state, Directions.STOP)

    def getForwardActions(self, gameState):
        actions = gameState.getLegalActions(self.index)
        actions.remove(Directions.STOP)
        reversed = Directions.REVERSE[gameState.getAgentState(self.index).configuration.direction]
        #print 'actions: ', reversed
        if reversed in actions and len(actions) > 1:
            actions.remove(reversed)
        elif reversed in actions and len(actions) == 1:
            pass
            #print 'gameStateis ', actions

        return actions

    # new added: number1
    # @ input: list of five posialbe actions
    # @ check if there the reversed action is inclued
    # @ output: boolean
    def revActionCheck(self, actionLst):
        from game import Actions
        result = True
        for index, value in enumerate(actionLst):
            if index +1 != len(actionLst):
                if actionLst[index+1] == Actions.reverseDirection(value) and self.deadLoopCount():
                    result = False
        return result

    def goAttack(self, ret, actLst):
        if ret['isPacman'] == 0:
            #print 'here'
            if self.index == 0 and 'East' in actLst:
                return 'East'
        else:
            if self.index == 0 and 'East' in actLst:
                return 'West'

    def SecondMin(self, lst):
        # return the second min value of a lst
        lst.remove(min(lst))
        return lst

    

    def getFeatures(self, gameState, action):
        ret = util.Counter()
        successor = self.getSuccessor(gameState, action)

        nextPos = successor.getAgentState(self.index).getPosition()
        #print 'nextpos', nextPos
        ret['score'] = self.getScore(successor)

        foodList = self.getFood(successor).asList()
        #print foodList
        if len(foodList) > 0:
            ret['toFood'] = min([self.getMazeDistance(nextPos, food) for food in foodList])
            print  'lst: ',[self.getMazeDistance(nextPos, food) for food in foodList]
            print 'foodList:',foodList
            print 'nextpos: ', nextPos
        #print ret['toFood']

        enemies = [successor.getAgentState(i) for i in self.getOpponents(successor)]
        inRange = filter(lambda x: not x.isPacman and x.getPosition() != None, enemies)
        if len(inRange) > 0:
            positions = [agent.getPosition() for agent in inRange]
            closest = min(positions, key=lambda x: self.getMazeDistance(nextPos, x))
            distance = self.getMazeDistance(nextPos, closest)
            if distance <= 5:
                ret['toGhost'] = distance

        ret['isPacman'] = 0

        #self.goAttack(ret)
        #print type(successor)
        if successor.getAgentState(self.index).isPacman:
            ret['isPacman'] = 1
            #print self.index
        #print ret
        self.ret = ret
        #print ret['isPacman']
        return ret


    def getWeights(self, gameState, action):
        if self.inactiveTime > 80:
            return {'score': 200, 'toFood': -5, 'toGhost': 2, 'isPacman':  1000}

        successor = self.getSuccessor(gameState, action)
        current = successor.getAgentState(self.index).getPosition()

        enemies = [successor.getAgentState(i) for i in self.getOpponents(successor)]
        #print 'current: ', current
        #print 'enemies: ', enemies
        inRange = filter(lambda x: not x.isPacman and x.getPosition() != None, enemies)

        if len(inRange) > 0:
            positions = [agent.getPosition() for agent in inRange]
            closest = min(positions, key=lambda x: self.getMazeDistance(current, x))
            # position
            distance = self.getMazeDistance(current, closest)
            closeEnemy = filter(lambda x: x[0] == closest, zip(positions, inRange))
            #print 'enemy:',closeEnemy
            for agent in closeEnemy:
                #print type(agent[1])
                if agent[1].scaredTimer > 0:

                    return {'score': 200, 'toFood': -5, 'toGhost': 0, 'isPacman': 0}
        if self.ret['isPacman'] == 1:
            return {'score': 200, 'toFood': 1, 'toGhost': 2, 'isPacman': 0}
        return {'score': 200, 'toFood': -5, 'toGhost': 2, 'isPacman': 0}


class DefensiveAgent(ReflexCaptureAgent):

    def __init__(self, index):
        CaptureAgent.__init__(self, index)
        self.target = None
        self.lastFood = None
        self.patrolDict = {}

    def registerInitialState(self, gameState):
        CaptureAgent.registerInitialState(self, gameState)
        self.distancer.getMazeDistances()
        if self.red:
            centralX = (gameState.data.layout.width - 2) / 2
        else:
            centralX = ((gameState.data.layout.width - 2) / 2) + 1

        # no wall = entry
        self.noWallSpots = []
        for i in range(1, gameState.data.layout.height - 1):
            if not gameState.hasWall(centralX, i):
                self.noWallSpots.append((centralX, i))

        #if more than half are entries, get rid of the first and last?
        if len(self.noWallSpots) > (gameState.data.layout.height - 2) / 2:
            self.noWallSpots.pop(0)
            self.noWallSpots.pop(len(self.noWallSpots) - 1)
        self.toPatrol(gameState)

    def chooseAction(self, gameState):
        if self.lastFood and len(self.lastFood) != len(self.getFoodYouAreDefending(gameState).asList()):
            self.toPatrol(gameState)

        # caught the target
        pos = gameState.getAgentPosition(self.index)
        if pos == self.target:
            self.target = None
        opp = self.getOpponents(gameState)
        enemies = [gameState.getAgentState(i) for i in self.getOpponents(gameState)]
        invaders = filter(lambda x: x.isPacman and x.getPosition() != None, enemies)

        # catch the closest invader
        if len(invaders) > 0:
            positions = [agent.getPosition() for agent in invaders]
            self.target = min(positions, key=lambda x: self.getMazeDistance(pos, x))
        elif self.lastFood != None:
            eaten = set(self.lastFood) - set(self.getFoodYouAreDefending(gameState).asList())
            if len(eaten) > 0:
                self.target = eaten.pop()

        self.lastFood = self.getFoodYouAreDefending(gameState).asList()
        if self.target == None and len(self.getFoodYouAreDefending(gameState).asList()) <= 4:
            food = self.getFoodYouAreDefending(gameState).asList() + self.capsules(gameState)
            self.target = random.choice(food)
        elif self.target == None:
            self.target = self.selectTarget()

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

    def toPatrol(self, gameState):
        foods = self.getFoodYouAreDefending(gameState).asList()
        total = 0

        for position in self.noWallSpots:
            closest = "+inf"
            for pos in foods:
                dis = self.getMazeDistance(position, pos)
                if dis < closest:
                    closest = dis

            # cannot multipy by zero
            if closest == 0:
                closest = 1

            self.patrolDict[position] = 1.0 / float(closest)
            total += self.patrolDict[position]

        if total == 0:
            total = 1
        for i in self.patrolDict.keys():
            self.patrolDict[i] = float(self.patrolDict[i]) / float(total)

    # get another random method
    def selectTarget(self):
        rand = random.random()
        sum = 0.0

        for i in self.patrolDict.keys():
            sum += self.patrolDict[i]
            if rand < sum:
                return i
