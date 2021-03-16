from BoxMatrix import BoxMatrix
from queue import Queue
from enum import Enum
import numpy as np
from Box import *
from PipeFinder import *
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


# CONSTANTS
emptyState = 0                  # Empty space
blockedState = 1                # Walls
goalState = 2                   # Pipes
initialState = graph[1]         # Starting point


# BFS SOLUTION
state = initialState  # Setting up the state
actions = []  # Setting up Actions                           (NOT DONE YET!!)

PipeFinder.PipeBfs(state, goalState, actions)
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
