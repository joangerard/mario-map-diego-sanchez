class TransitionObtainer:

    @staticmethod
    def GetTransitionNodes(self, mario_map, state):
        transitions = []
        actualIndex = np.where(mario_map == state)
        # Left up corner box
        if actualIndex[0] == 0 & & actualIndex[1] == 0:
            x
        # Left box
        if actualIndex[0] == 0:
            x
        # Left down corner Box
        if actualIndex[0] == 0 & & actualIndex[1] == actualIndex[1].shape:
            x
        # Down box
        if actualIndex[1] == 0 & & actualIndex[0] != 0 & & actualIndex[0] == actualIndex[0].shape:
            x
        # Right down corner box
        # Right box
        # Right up corner Box
        # Up box

        # UPelement
        transitions.append(mario_map[actualIndex[0]+1, actualIndex[1]])
        # DOWNelement
        transitions.append(mario_map[actualIndex[0]-1, actualIndex[1]])
        # LEFTelement
        transitions.append(mario_map[actualIndex[0], actualIndex[1]-1])
        # RIGHTelement
        transitions.append(mario_map[actualIndex[0], actualIndex[1]-1])
