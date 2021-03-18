from BoxKind import BKind

class PathValidator(object):
    def Valid(self, mario_map, moves):
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

            if not(0 <= i < len(mario_map[0]) and 0 <= j < len(mario_map)): #Out of bounds control
                return False
            elif (mario_map[j][i].kind == BKind.block): #Blocked Box controll
                return False

        return True
