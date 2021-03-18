from BoxKind import BKind
class Box:
    def __init__(self, kind=BKind.empty, cost=-1):
        self.kind = kind