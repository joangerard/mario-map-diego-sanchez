import queue
from enum import Enum
from GoalTester import GoalTester
from PathValidator import PathValidator
from MapCreator import MapCreator
class PipeFinder(object):
    def FindPipe(self):
        actions = queue.Queue()  # Actions Queue
        actions.put("")          # Initializing empty queue
        path = ""                # First path in map
        mario_map = MapCreator().CreateMarioMap3()  # Creating the map
        moves = ["L", "R", "U", "D"]
        while not GoalTester().findEnd(mario_map, path):         # == False:
            path = actions.get()                    # Set of moves Ex. LLURU
            for move in moves:
                posible_path = path + move
                if PathValidator().Valid(mario_map, posible_path):  # Validates if a path is posible
                    actions.put(posible_path)