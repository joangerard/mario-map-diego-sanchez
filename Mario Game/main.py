import queue
from enum import Enum


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
    # print(move)
    if move[0] < 0:  # Outof bounds up
        return False
    elif move[1] < 0:  # Outof bounds left
        return False
    elif move[0] > len(mario_map)-1:  # Outof bounds down (max rows )
        return False
    elif move[1] > len(mario_map[0])-1:  # Outof bounds right (max columns )
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
    while (opened.qsize() != 0):
        # Actual state will be the first queue element (that we also pop out off the queue)
        state = opened.get()  # dequeue
        if (state == goalState):  # Goal Test
            #print("Found: " + actions)
            #printMaze(marioMap, actions)
            return SearchState.success
        else:
            # Obtaining / expanding all succesor states/nodes
            succesors = []
            succesors = TransitionFunction(state, actions)
            # print(succesors)
            # Enqueueing or adding the succesors to the queue
            for succesor in succesors:
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
