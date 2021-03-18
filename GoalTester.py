import queue
from enum import Enum
from BoxKind import BKind

class GoalTester:
    def findEnd(self, mario_map, moves):
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
