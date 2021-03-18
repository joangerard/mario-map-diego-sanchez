from enum import Enum
#BOX KIND
class BKind(Enum):
    block = "#" #0
    empty = " " #1
    pipe = "X"  #2
    start = "O"
    path = "+"
