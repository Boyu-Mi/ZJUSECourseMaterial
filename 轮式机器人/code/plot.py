import matplotlib.pyplot as plt
import numpy as np
import math
def plot_vehicle(x, y, theta, pause_t):
    plt.clf()
    p1_i = np.array([0.5, 0, 1]).T
    p2_i = np.array([-0.5, 0.25, 1]).T
    p3_i = np.array([-0.5, -0.25, 1]).T

    T = np.array(([math.cos(theta),-math.sin(theta),x],[math.sin(theta),math.cos(theta),y],[0,0,1]))
    p1 = np.matmul(T, p1_i)
    p2 = np.matmul(T, p2_i)
    p3 = np.matmul(T, p3_i)
    plt.plot([p1[0], p2[0]], [p1[1], p2[1]], 'k-')
    plt.plot([p2[0], p3[0]], [p2[1], p3[1]], 'k-')
    plt.plot([p3[0], p1[0]], [p3[1], p1[1]], 'k-')
    plt.plot(x_trac,y_trac,'b--')
    plt.xlim(-10 + x, 10 + x)
    plt.ylim(-10 + y, 10 + y)
    plt.pause(0.2)

x_trac = []
y_trac = []
def transformation_matrix(x, y, theta):
    a = np.asarray([[math.cos(theta),math.sin(pos[theta]),x],[-math.sin(pos[theta]),math.cos(pos[theta]),y],[0,0,1]])
    return a

def calc(pos,vel,dt):
    a = np.asarray([[math.cos(pos["theta"]),math.sin(pos["theta"]),0],[-math.sin(pos["theta"]),math.cos(pos["theta"]),0],[0,0,1]])
    ra = np.linalg.inv(a)
    vr = np.asarray([vel["x"],0,vel["w"]])
    vr = np.reshape(vr, (3,1))
    v = np.matmul(ra,vr)
    pos["x"] += v[0][0]*dt
    pos["y"] += v[1][0]*dt
    pos["theta"] += v[2][0]*dt
    return pos

import threading
import socket
vel = {
    "x": 0.0,
    "w": 0.0
}
pos = {
    "x": 2,
    "y": 2,
    "theta": 0.0
}
_ENDPOINT = ("127.0.0.1", 30001)
def receive():
    global vel
    while True:
        data, addr = sock.recvfrom(65535)
        data = data.decode()
        if data == 'a':
            vel["w"] += 15*math.pi/180
        elif data == 'd':
            vel["w"] -= 15*math.pi/180
        elif data == 'w':
            vel["x"] += 0.1
        elif data =='x':
            vel["x"] -= 0.1

if __name__ == "__main__":
    t = threading.Thread(target=receive)
    t.start()
    dt = 0.2
    while True:
        pos = calc(pos,vel,dt)
        plt.clf()
        #print(pos["x"],pos["y"],pos["theta"])
        x_trac.append(pos["x"])
        y_trac.append(pos["y"])
        plot_vehicle(pos["x"],pos["y"],pos["theta"],1)
        