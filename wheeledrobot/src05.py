import threading
import time
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import math
import random
import copy

# TODO
from AStarPlanner import AStarPlanner

plt.rcParams["figure.figsize"] = [8.0, 8.0]
plt.rcParams["figure.autolayout"] = True
plt.rcParams['keymap.save'].remove('s')


def transformation_matrix(x, y, theta):
    return np.array([
        [np.cos(theta), -np.sin(theta), x],
        [np.sin(theta), np.cos(theta), y],
        [0, 0, 1]
    ])


# class Node(object):
#     def __init__(self, x, y):
#         self.x = x
#         self.y = y
#         self.parent = None

# class AStarPlanner:
#     def __init__(self, dt, r):
#         self.dt = dt
#         self.r = r
#         self.openlst = []
#         self.closelst = []

#     def grid_map(self,ldx, ldy, rux, ruy,planning_obs_x, planning_obs_y):
#         self.planning_obs_x = planning_obs_x
#         self.planning_obs_y = planning_obs_y
#         self.grid = np.arange(int((rux-ldx)/r * (ruy-ldy) /r)).reshape(-1, int((rux-ldx)/r))
#         for i in range(ldx, rux, self.r):
#             for j in range(ldy, ruy, self.r):
#                 for k in range(len(self.planning_obs_x)):
#                     if math.sqrt(np.hypot(i - self.planning_obs_x[k], j-self.planning_obs_y[k])) <= self.r:
#                         grid[i][j] = 1
#                     else:
#                         grid[i][j] = 0


#     def inblock(self,x,y,i,j):
#         return x >= i*r and x <= (i+1)*r and y >= j*r and y<= (j+1)*r


#     def dis2tar(self,n,planning_target_x, planning_target_y):
#         cur_x = n.x
#         cur_y = n.y
#         return np.hypot(n.x - planning_target_x,n.y - planning_target_y)

#     def planning(self, planning_obs_x, planning_obs_y, planning_start_x, planning_start_y, planning_target_x, planning_target_y, ldx, ldy, rux, ruy):
#         self.startnode = Node(planning_start_x, planning_start_y)
#         self.tarnode = Node(planning_target_x, planning_target_y)
#         self.planning_obs_x = planning_obs_x
#         self.planning_obs_y = planning_obs_y
#         self.path = [self.startnode]
#         self.lstx = []
#         self.lsty = []
#         self.dist = np.arange(int((rux-ldx)/r * (ruy-ldy) /r)).reshape(-1, int((rux-ldx)/r))
#         for i in range(ldx, rux, self.r):
#             for j in range(ldy, ruy, self.r):
#                     if self.inblock(planning_start_x, planning_start_y, i, j):
#                         dist[i][j] = 0
#                     else:
#                         dist[i][j] = 0x3f3f3f3f
        

#         while self.openlst:
            
#             if np.hypot(new_node.x - self.tarnode.x, new_node.y - self.tarnode.y) < 0.1:
#                 break


#         last_index = len(self.nodelst) - 1
#         node = self.nodelst[last_index]


#         while node is not None:
#             self.lstx.append(node.x)
#             self.lsty.append(node.y)
#             node = node.parent

#         return self.lstx, self.lsty







# class RRTPlanner:
#     def __init__(self, dt, r):
#         self.dt = dt
#         self.r = r

#     def random_node(self, ldx, ldy, rux, ruy):
#         nodex = random.uniform(ldx, rux)
#         nodey = random.uniform(ldy, ruy)
#         newnode = Node(nodex, nodey)
#         return newnode

#     def iscollision(self, node):
#         if len(self.planning_obs_x) == 0:
#             return False
#         for i in range(len(self.planning_obs_x)):
#             if np.hypot(node.x - self.planning_obs_x[i], node.y-self.planning_obs_y[i]) <= self.r:
#                 return True
#         return False

#     def pick_nearest_node(self, node):
#         d_list = [np.hypot(mynode.x - node.x, mynode.y - node.y)
#                   for mynode in self.nodelst]
#         return self.nodelst[d_list.index(min(d_list))]

#     def planning(self, planning_obs_x, planning_obs_y, planning_start_x, planning_start_y, planning_target_x, planning_target_y, ldx, ldy, rux, ruy):
#         self.startnode = Node(planning_start_x, planning_start_y)
#         self.tarnode = Node(planning_target_x, planning_target_y)
#         self.planning_obs_x = planning_obs_x
#         self.planning_obs_y = planning_obs_y
#         self.nodelst = [self.startnode]
#         self.lstx = []
#         self.lsty = []
#         while 1:
#             newnode = self.random_node(ldx, ldy, rux, ruy)
#             nearest_node = self.pick_nearest_node(newnode)
#             # theta = math.atan2(newnode.y - nearest_node.y,
#             #                    newnode.x - nearest_node.x)

#             new_node = copy.deepcopy(nearest_node)
#             # dis = math.sqrt((newnode.y - nearest_node.y)**2 + (newnode.x - nearest_node.x)**2)
#             dis = self.dt
#             new_node.x += dis * (newnode.x - nearest_node.x) / np.hypot(newnode.y - nearest_node.y,newnode.x - nearest_node.x)
#             new_node.y += dis * (newnode.y - nearest_node.y) / np.hypot(newnode.y - nearest_node.y,newnode.x - nearest_node.x)
#             if self.iscollision(new_node):
#                 # print('collison!')
#                 continue
#             else:
#                 new_node.parent = nearest_node
#             self.nodelst.append(new_node)
#             # print("find new node")
#             if np.hypot(new_node.x - self.tarnode.x, new_node.y - self.tarnode.y) < 0.1:
#                 break
#         last_index = len(self.nodelst) - 1
#         node = self.nodelst[last_index]
#         while node is not None:

#             # path.append([node.x, node.y])
#             self.lstx.append(node.x)
#             self.lsty.append(node.y)
#             node = node.parent

#         return self.lstx, self.lsty


class Playground:
    def __init__(self, planner=None):
        self.dt = 0.2

        self.fig, self.ax = plt.subplots()

        self.fig.canvas.mpl_connect('button_press_event', self.on_mousepress)
        self.fig.canvas.mpl_connect('key_press_event', self.on_press)
        self.fig.canvas.mpl_connect('motion_notify_event', self.on_mousemove)
        self.NEED_EXIT = False

        ############################################

        self.planning_obs = np.empty(shape=(0, 2))
        self.planning_obs_radius = 1.0
        self.planning_path = np.empty(shape=(0, 2))

        self.planning_start = np.array([0.0, 0.0])
        self.planning_target = None

        self.planner = planner

        #####################################
        self.temp_obs = [0, 0]

    def run(self):
        while True:
            if self.NEED_EXIT:
                plt.close("all")
                break
            plt.cla()
            self.__draw()

    def add_obs(self, x, y):
        self.planning_obs = np.append(self.planning_obs, [[x, y]], axis=0)

    def add_obss(self, xs, ys):
        self.planning_obs = np.append(
            self.planning_obs, np.vstack([xs, ys]).T, axis=0)

    def __draw(self):
        assert(self.planning_path.shape[1] == 2,
               "the shape of planning path should be '[x,2]', please check your algorithm.")
        assert(self.planning_obs.shape[1] == 2,
               "the shape of self.planning_obs(obstacles) should be '[x,2]', please check your algorithm.")

        self.ax.plot(
            self.planning_start[0], self.planning_start[1], "k>", markersize=12)
        if self.planning_target is not None:
            self.ax.plot(
                self.planning_target[0], self.planning_target[1], "r*", markersize=20)

        self.ax.plot(self.planning_path[:, 0], self.planning_path[:, 1], 'b--')
        for obs in self.planning_obs:
            self.ax.add_artist(plt.Circle(
                (obs[0], obs[1]), self.planning_obs_radius, fill=False))

        self.ax.set_xlim(-10, 10)
        self.ax.set_ylim(-10, 10)

        plt.pause(self.dt)

    def on_mousepress(self, event):
        if not event.dblclick:
            if event.button == 1:
                self.planning_start = np.array([event.xdata, event.ydata])
            if event.button == 3:
                self.planning_target = np.array([event.xdata, event.ydata])
            if event.button == 2:
                self.add_obs(event.xdata, event.ydata)
                self.temp_obs = [event.xdata, event.ydata]

    def on_mousemove(self, event):
        if hasattr(event, "button") and event.button == 2:
            dx = event.xdata-self.temp_obs[0]
            dy = event.ydata-self.temp_obs[1]
            if np.hypot(dx, dy) > self.planning_obs_radius*0.8:
                self.temp_obs = [event.xdata, event.ydata]
                self.add_obs(*self.temp_obs)

    def on_press(self, event):
        if(event.key == 'escape'):
            self.set_exit()
        if(event.key == ' '):
            print("---------------------------------\ndo planning...")
            print("obstacles : ", self.planning_obs)
            print("plan start : ", self.planning_start)
            print("plan target : ", self.planning_target)
            if self.planning_target is not None and self.planner is not None:
                # TODO
                px, py = planner.planning(self.planning_obs[:, 0], self.planning_obs[:, 1], self.planning_start[0],
                                          self.planning_start[1], self.planning_target[0], self.planning_target[1], -10, -10, 10, 10)
                self.planning_path = np.vstack([px, py]).T
                print("plan path : ", self.planning_path)
            else:
                print("planner or target is None, please check again.")

    def set_exit(self):
        self.NEED_EXIT = True


if __name__ == "__main__":
    planner = None
    planner = AStarPlanner(0.2, 1.5)
    pg = Playground(planner)
    pg.run()
# rux = ruy = 10
# ldx = ldy = -10
# r = 0.2
# grid = np.arange(int((rux-ldx)/r * (ruy-ldy) /r)).reshape(-1, int((rux-ldx)/r))
# print(grid)    