from captureAgents import CaptureAgent

# the aim of this qlearning strategy is to deal with the situation that the pacman is caught by ghost when reversing
class qLearning_strategy(object):
    def __init__(self,numTraining=100, epsilon=0.5, alpha=0.5, gamma=1):
        self.__numTraining = numTraining
        self.__epsilon = epsilon
        self.__alpha = alpha
        self.__gamma = gamma
        self.__preState = None
        self.__curState = None
        self.__qTable = {}
        #CaptureAgent.__init__(self,**args)

    def get_qtable(self):
        return self.__qTable
    # because there might no pandas library on server, the format of q table change from dataframe
    # to dictionary {state:{left: qValue, right: qvalue, ahead: qvalue, reverse: qvalue}}
    def init_table(self,state):
        tableValue = {'left': 0.0, 'right': 0.0, 'ahead': 0.0, 'reverse': 0.0}
        if not state in self.__qTable.keys():
            self.__qTable[str(state)] = tableValue

    def update_qvalue(self, state, action):
        self.init_table(state)
        value = self.get_qvalue()
        if action == 'reverse':
            pass

    def get_qvalue(self, state , action):
        try:
            value = self.__qTable[state][action]
        except KeyError:
            value = 0.0
        value = value + self.__alpha* self.__epsilon*20
        self.__qTable[state][action] = value
        return value

