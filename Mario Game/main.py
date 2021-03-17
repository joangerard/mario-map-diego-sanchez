import queue
from enum import Enum

"""""
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
    return mariomap"""
"""def CreateMarioMap2():
    mariomap = []
    mariomap.append([Box("#"), Box("#"), Box("#"), Box("#"), Box("#"), Box("O"), Box("#"), Box("#"), Box("#")])
    mariomap.append([Box("#"), Box(" "), Box(" "), Box(" "), Box(" "), Box(" "), Box(" "), Box(" "), Box("#")])
    mariomap.append([Box("#"), Box(" "), Box("#"), Box("#"), Box(" "), Box("#"), Box("#"), Box(" "), Box("#")])
    mariomap.append([Box("#"), Box(" "), Box("#"), Box("#"), Box(" "), Box(" "), Box("#"), Box(" "), Box("#")])
    mariomap.append([Box("#"), Box(" "), Box("#"), Box("#"), Box("#"), Box(" "), Box("#"), Box(" "), Box("#")])
    mariomap.append([Box("#"), Box(" "), Box("#"), Box("#"), Box("#"), Box(" "), Box("#"), Box(" "), Box("#")])
    mariomap.append([Box("#"), Box(" "), Box("#"), Box("#"), Box("#"), Box(" "), Box("#"), Box("#"), Box("#")])
    mariomap.append([Box("#"), Box(" "), Box(" "), Box(" "), Box(" "), Box(" "), Box(" "), Box(" "), Box("#")])
    mariomap.append([Box("#"), Box("#"), Box("X"), Box("#"), Box("#"), Box("#"), Box("#"), Box("#"), Box("#")])
    return mariomap"""

#BOX KIND
class BKind(Enum):
    block = "#" #0
    empty = " " #1
    pipe = "O"  #2

#MAP CELLS / BOXES
class Box:
    def __init__(self, kind=BKind.empty, cost=-1):
        self.kind = kind
        self.cost = cost


def CreateMarioMap2():
    mariomap = []
    mariomap.append([Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.pipe), Box(BKind.block), Box(BKind.block), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.empty), Box(BKind.block), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.empty), Box(BKind.block)])
    mariomap.append([Box(BKind.block), Box(BKind.block), Box(BKind.empty), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.block), Box(BKind.block)])
    return mariomap


class SearchState(Enum):
    success = 0
    cutoff = 1
    failure = 2


def GetActionState(state, action):
    next_move = []
    if action == "U":
        next_move = [state[0]+1, state[1]]
    if action == "D":
        next_move = [state[0]-1, state[1]]
    if action == "L":
        next_move = [state[0], state[1]-1]
    if action == "R":
        next_move = [state[0], state[1]+1]
    return next_move


def Valid(state, action, mario_map=CreateMarioMap2()):
    move = GetActionState(state, action)
    #print(move)
    if move[0] < 0:  # Outof bounds up
        return False
    elif move[1] < 0:  # Outof bounds left
        return False
    elif move[0] > len(mario_map)-1:  # Outof bounds down (max rows )
        return False
    elif move[1] > len(mario_map[0])-1:  # Outof bounds right (max columns )
        return False
    elif mario_map[move[0]][move[1]].kind == BKind.block: # Block blocking the move
        return False
    else:
        return True


def TransitionFunction(state, actions):
    succesors = []
    next_move = []
    for action in actions:
        #print(Valid(state, action))
        if Valid(state, action):
            next_move = GetActionState(state, action)
            succesors.append(next_move)
            # print(succesors)
    return succesors


def PipeBfs(initialState, goalState, actions):
    opened = queue.Queue()
    opened.put(initialState)
    path = []   #Queue of lists  saves all moves made
    while (opened.qsize() != 0):
        state = opened.get()  # dequeue                         # Actual state will be the first queue element (that we also pop out off the queue)
        path.append(state)
        if (state == goalState):  # Goal Test
            #print("Found: " + actions)
            #printMaze(marioMap, actions)
            print(path)
            return SearchState.success
        else:
            succesors = []
            succesors = TransitionFunction(state, actions)      # Obtaining / expanding all succesor states/nodes
            # print(succesors)
            for succesor in succesors:                          # Enqueueing or adding the succesors to the queue
                opened.put(succesor)
    return SearchState.failure


move = ""
marioMap = CreateMarioMap2()
startState = [2, 8]  # marioMap[2][8]  # X startpoint
actions = ["L", "R", "U", "D"]
goal = [0, 5]  # marioMap[0][5]  # O startpoint
result = PipeBfs(startState, goal, actions)
print("Result:", result)

# print(len(marioMap[0]))
#print([0, 1] == [1, 1])
# print(enumerate(maze[0]))

#Testing Box cost attribute
#casilla = Box(" ")
#print(casilla.cost)



# TESTING GETTING BOX KIND

#box_type = BKind.pipe
#print(box_type.name)

#move = [0, 5]
#print (marioMap[0][0].kind.name)

