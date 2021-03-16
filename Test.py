import numpy as np

mario_map = np.array([
    [2, 5],
    [3, 4],
    [4, 31],
    [5, 2]])


result = np.where(mario_map == 3)

print(result)

print(mario_map[result])

print(mario_map[result[0]+1, result[1]])  # downwards element
print(mario_map[result[0]-1, result[1]])  # upwards element
print(mario_map[result[0], result[1]+1])  # left2 element
