import queue
from enum import Enum
import time
#import numpy

"""
def CreateMarioMap():
    mariomap = numpy.array(
        ["#", "#", "#", "#", "#", "O", "#"],
        ["#", " ", " ", " ", "#", " ", "#"],
        ["#", " ", "#", " ", "#", " ", "#"],
        ["#", " ", "#", " ", " ", " ", "#"],
        ["#", " ", "#", "#", "#", " ", "#"],
        ["#", " ", " ", " ", "#", " ", "#"],
        ["#", "#", "#", "X", "#", "#", "#"]
    )
    return mariomap
"""


def CreateMarioMap2():
    mariomap = []
    mariomap.append(["#", "#", "#", "#", "#", "O", "#", "#", "#"])
    mariomap.append(["#", " ", " ", " ", " ", " ", " ", " ", "#"])
    mariomap.append(["#", " ", "#", "#", " ", "#", "#", " ", "#"])
    mariomap.append(["#", " ", "#", "#", " ", " ", "#", " ", "#"])
    mariomap.append(["#", " ", "#", "#", "#", " ", "#", " ", "#"])
    mariomap.append(["#", " ", "#", "#", "#", " ", "#", " ", "#"])
    mariomap.append(["#", " ", "#", "#", "#", " ", "#", "#", "#"])
    mariomap.append(["#", " ", " ", " ", " ", " ", " ", " ", "#"])
    mariomap.append(["#", "#", "X", "#", "#", "#", "#", "#", "#"])
    return mariomap

#BOX KIND
class BKind(Enum):
    block = "#" #0
    empty = " " #1
    pipe = "X"  #2
    start = "O"
    path = "+"

#MAP CELLS / BOXES
class Box:
    def __init__(self, kind=BKind.empty, cost=-1):
        self.kind = kind
        self.cost = cost


def CreateMarioMap3():
    mariomap = []
    mariomap.append([Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.start), Box(BKind.block), Box(BKind.block), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.empty), Box(BKind.block), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.block), Box(BKind.pipe), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.block)])
    return mariomap

def printMap(mario_map, path=""):
    for x, pos in enumerate(mario_map[0]):
        if pos.kind.name == BKind.start.name:
            start = x

    i = start
    j = 0
    pos = set()
    #print(pos)
    for move in path:
        if move == "L":
            i -= 1

        elif move == "R":
            i += 1

        elif move == "U":
            j -= 1

        elif move == "D":
            j += 1
        pos.add((j, i))

    for j, row in enumerate(mario_map):
        for i, col in enumerate(row):
            if (j, i) in pos:
                print(BKind.path.value + " ", end="")
            else:
                print(col.kind.value + " ", end="")
        print()


def Valid(mario_map, moves):
    for x, pos in enumerate(mario_map[0]):
        if pos.kind.name == BKind.start.name:
            start = x

    i = start
    j = 0
    for move in moves:
        if move == "L":
            i -= 1

        elif move == "R":
            i += 1

        elif move == "U":
            j -= 1

        elif move == "D":
            j += 1

        if not(0 <= i < len(mario_map[0]) and 0 <= j < len(mario_map)):
            return False
        elif (mario_map[j][i].kind == BKind.block):
            return False

    return True


def findEnd(mario_map, moves):
    start = 0
    for x, pos in enumerate(mario_map[0]):
        if pos.kind.name == BKind.start.name:
            start = x
    #print(pos.kind.name)
    i = start
    j = 0
    for move in moves:
        if move == "L":
            i -= 1

        elif move == "R":
            i += 1

        elif move == "U":
            j -= 1

        elif move == "D":
            j += 1

    if mario_map[j][i].kind == BKind.pipe:
        print("Found: " + moves)
        printMap(mario_map, moves)
        return True

    return False




nums = queue.Queue()  # Actions Queue
nums.put("")          # Initializing empty queue
path = ""  # First path in map
mario_map = CreateMarioMap3()  # Creating the map
moves = ["L", "R", "U", "D"]
while not findEnd(mario_map, path):# == False:
    path = nums.get()  # Set of moves Ex. LLURU
    ##print(path)
    #time.sleep(5)
    for move in moves:
        posible_path = path + move
        #print(posible_path)
        if Valid(mario_map, posible_path):  # Validates if a path is posible
            nums.put(posible_path)

