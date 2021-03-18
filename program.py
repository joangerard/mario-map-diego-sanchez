from PipeFinder import PipeFinder
from MapCreator import MapCreator
from Box import Box

import queue
from enum import Enum
from GoalTester import GoalTester
from PathValidator import PathValidator

exit = False
while(not exit):
    print("Choose a Map for Mario")
    print("1) Easy Map")
    print("2) Medium Map")
    print("3) Hard Map")
    print("9) Exit")

    option = input('Enter your selection:')

    if option == "1":
        PipeFinder().FindPipe()
        input("Press any key to continue...")
    elif option == "2":
        PipeFinder().FindPipe()
        input("Press any key to continue...")
    elif option == "3":
        PipeFinder().FindPipe()
        input("Press any key to continue...")
    elif option == "9":
        exit = True