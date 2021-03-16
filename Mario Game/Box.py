from enum import Enum


class BoxType(Enum):
    empty = 0
    wall = 1
    pipe = 2


class Box:
    def __init__(self, kind):
        self.kind = kind
