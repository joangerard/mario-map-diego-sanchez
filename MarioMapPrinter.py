from BoxKind import BKind

class MarioMapPrinter:
    def printMap(self, mario_map, path=""):
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