from BoxMatrix import BoxMatrix
from queue import Queue
from enum import Enum
import numpy as np
from Box import *
# MARIO MAP
graph = {'A': ['B', 'C', 'E'],
         'B': ['A', 'D', 'E'],
         'C': ['A', 'F', 'G'],
         'D': ['B'],
         'E': ['A', 'B', 'D'],
         'F': ['C'],
         'G': ['C']}

mario_map = BoxMatrix(np.array(
    [Box(BoxType.empty)],
    [Box(BoxType.empty)],
    [Box(BoxType.empty)],
    [Box(BoxType.pipe)]))


# SEARCH STATES
class SearchState(Enum):
    success = 0
    cutoff = 1
    failure = 2


# CONSTANTS
emptyState = 0                  # Empty space
blockedState = 1                # Walls
goalState = 2                   # Pipes
initialState = graph[1]         # Starting point


# BFS SOLUTION
state = initialState  # Setting up the state
actions = []  # Setting up Actions                           (NOT DONE YET!!)


def PipeBfs(state, goalState, actions):
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


def TransitionFunction(state, actions):
    # obtiene las cajas que estan arriba, der, izq y abajo. en lista:
    transitions = state.GetTransitionNodes()  # (NOT DONE YET!!)
    for transition in transitions:
        if transition != None:
            actions.append(transition)
    return actions


def PushSuccesors(succesors, queue):
    for succesor in succesors:
        queue.put(succesor)  # enqueue


# JUST TESTING BFS
"""def bfs(graph, initial):

    visited = []

    queue = [initial]

    while queue:

        node = queue.pop(0)
        if node not in visited:

            visited.append(node)
            neighbours = graph[node]

            for neighbour in neighbours:
                queue.append(neighbour)
    return visited


print(bfs(graph, 'A'))"""
