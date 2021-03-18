from Box import Box
from BoxKind import BKind
class MapCreator:
    def __init__(self):
        self.mariomap = []
    @classmethod
    def CreateMarioMap1(self):
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
    @classmethod
    def CreateMarioMap2(self):
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
    @classmethod
    def CreateMarioMap3(self):
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
