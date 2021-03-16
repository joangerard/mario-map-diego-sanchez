from queue import Queue
from enum import Enum
import numpy as np
# SEARCH STATES


class SearchState(Enum):
    success = 0
    cutoff = 1
    failure = 2


class PipeFinder:

    # ----------METHODS------------------
    # NULL CONTROL NOT DONE!!!!
    @staticmethod
    def GetTransitionNodes(self, mario_map, state):
        transitions = []
        actualIndex = np.where(mario_map == state)
        # UPelement
        transitions.append(mario_map[actualIndex[0]+1, actualIndex[1]])
        # DOWNelement
        transitions.append(mario_map[actualIndex[0]-1, actualIndex[1]])
        # LEFTelement
        transitions.append(mario_map[actualIndex[0], actualIndex[1]-1])
        # RIGHTelement
        transitions.append(mario_map[actualIndex[0], actualIndex[1]-1])

    def TransitionFunction(self, map, state, actions):
        # obtiene las cajas que estan arriba, der, izq y abajo. en lista:
        transitions = state.GetTransitionNodes()
        for transition in transitions:
            if transition != None:
                actions.append(transition)
        return actions

    def PushSuccesors(self, succesors, queue):
        for succesor in succesors:
            queue.put(succesor)  # enqueue

    def PipeBfs(self, state, goalState, actions):
        # Initializing open queue with initial state/node
        openQueue = Queue(maxsize=0)  # 0 is an infinite queue
        while (openQueue.qsize() != 0):
            # Actual state will be the first queue element (that we also pop out off the queue)
            state = openQueue.get()  # dequeue
            if (state == goalState):  # Goal Test
                return SearchState.success
            else:
                # Obtaining all succesor states/nodes
                succesors = TransitionFunction(state, actions)
                # Enqueueing or adding the succesors to the queue
                PushSuccesors(succesors, openQueue)
        return SearchState.failure
