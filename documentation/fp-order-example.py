import numpy as np 
test = np.random.random(100)


def sim(l):
    forward = 0
    backward = 0 
    for i in range(len(l)):
        forward += l[i] 
    
    for i in range(len(l)):
        backward += l[len(l) - i - 1]
    return forward - backward 
print(test)
print(sim(test))
