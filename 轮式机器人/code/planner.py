import numpy as np
import random as rd

class AStarPlanner:
    def __init__(self, dt=0.2, radius=1.5):
        self.dt = dt
        self.radius = radius
        self.path = []

    def nearest(self, point):
        arr = np.array(self.path)
        dis = np.hypot(arr[:,0]-point[0], arr[:,1]-point[1])
        mini = min(dis)
        miniindex = np.argwhere(dis - mini < 0.0000001)
        return miniindex[0][0]

    def steer(self, here, ran, step):
        dx = ran[0] - here[0]
        dy = ran[1] - here[1]
        cos = dx/((dx*dx+dy*dy)**0.5)
        sin = dy/((dx*dx+dy*dy)**0.5)
        dx = step*cos
        dy = step*sin
        return [here[0]+dx, here[1]+dy]

    def inobs(self, obs0, obs1, point):
        dis = np.hypot(obs0-point[0], obs1-point[1])
        if min(dis)<self.radius:
            return 1
        else:
            return 0
    
    
    def planning(self, obs0, obs1, start0, start1, target0, target1, minx, miny, maxx, maxy):
        step = (maxx-minx)/100
        self.path = [[start0, start1, 0]]
        here = [0,0]
        index = 0
        ran = [0,0]
        for i in range(100000):
            ran[0] = rd.random()*(maxx-minx)-((maxx-minx)/2)
            ran[1] = rd.random()*(maxy-miny)-((maxy-miny)/2)
            # self.path.append([ran[0], ran[1], len(self.path)-1])
            index = self.nearest(ran)
            here = self.path[index]
            new = self.steer(here, ran, step)
            if(self.inobs(obs0, obs1, new)):
                continue
            self.path.append([new[0], new[1], index])
            if((new[0]-target0)**2+(new[1]-target1)**2 < 0.1):
                break
        
        
        index = len(self.path)-1
        px = []
        py = []
        while 1:
            px.append(self.path[index][0])
            py.append(self.path[index][1])
            index = self.path[index][2]
            if index == 0:
                break
        print([obs0, obs1])
        return (px, py)


class RRTPlanner:
    def __init__(self, dt=0.2, radius=1.5):
        self.dt = 0.2
        self.radius = 1.5
    
    def planning(self, obs0, obs1, start0, start1, target0, target1, minx, miny, maxx, maxy):
        print("---trytrytrytrytry", obs0, obs1, start0, start1, target0, target1, minx, miny, maxx, maxy)
        return (np.asarray([1,2,3,4,5]), np.asarray([1,2,3,4,5]))

if __name__ == "__main__":
    x = AStarPlanner()
    x.path=[
        [1, 2, 0],
        [2, 3, 0],
        [4, 7, 0],
        [3, 9, 2],
        [5, 7, 1]
    ]
    a = np.array([1,2,3])
    b = np.array([2,3,4])