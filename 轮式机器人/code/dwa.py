import math
import numpy as np
from scipy.spatial import distance_matrix

class Config():
    def __init__(self):
        self.obs_radius = 0.25
        self.dt = 0.1  # [s] Time tick for motion prediction

        self.max_speed = 0.5  # [m/s]
        self.min_speed = -0.2  # [m/s]
        self.max_accel = 1  # [m/ss]
        self.v_reso = self.max_accel*self.dt/10.0  # [m/s]

        self.max_yawrate = 200.0 * math.pi / 180.0  # [rad/s]
        self.max_dyawrate = 200.0 * math.pi / 180.0  # [rad/ss]
        self.yawrate_reso = self.max_dyawrate*self.dt/10.0  # [rad/s]

        self.predict_time = 2.5  # [s]

        self.to_goal_cost_gain = 1.0
        self.speed_cost_gain = 0.3
        self.obstacle_cost_gain = 2.0

        self.tracking_dist = self.predict_time*self.max_speed
        self.arrive_dist = 0.1

class DWA(object):
    def __init__(self):
        self.vx = 0
        self.vw = 0
        self.best_traj=[]
        self.all_traj=[]
        self.all_u=[]
        pass

    def motion(self,param,v,w,dt):
        param[0] += v * math.cos(param[2])*dt
        param[1] += v * math.sin(param[2])*dt
        param[2] += w*dt
        param[3] = v
        param[4] = w

        return param

    def calc_dynamic_window(self,param,config):
        vs = [config.min_speed,config.max_speed,-config.max_yawrate,config.max_yawrate]
        vd = [param[3]-config.max_accel*config.dt,
              param[3]+config.max_accel*config.dt,
              param[4]-config.max_dyawrate*config.dt,
              param[4]+config.max_dyawrate*config.dt]
        vr = [max(vs[0],vd[0]),min(vs[1],vd[1]),
              max(vs[2],vd[2]),min(vs[3],vd[3])]

        return vr

    def calc_traj(self,param,v,w,config):
        x = np.array(param)
        time = 0
        traj = np.array(x)
        while time <= config.predict_time:
            time += config.dt
            x = self.motion(x,v,w,config.dt)
            traj = np.vstack((traj,x))

        return traj

    def calc_goal_cost(self,traj,goal,config):
        dx = goal[0] - traj[-1,0]
        dy = goal[1] - traj[-1,1]
        dist2goal = math.sqrt(dx**2+dy**2)
        if dist2goal <= config.arrive_dist:
            return float('-inf')
        else:
            return config.to_goal_cost_gain*dist2goal

    def calc_obs_cost(self,traj,obs,config):
        dist_min = float("inf")

        if traj == [] or obs == []:
            return dist_min

        dist_mat =  np.array(distance_matrix(np.array(traj).T[0:2].T,np.array(obs))).min()

        if dist_mat != []:
            dist_min = np.array(dist_mat).min()

        # for i in range(0,len(traj[:,1])):
        #     for j in range(0,len(obs[:,0])):
        #         dx = obs[j,0] - traj[i,0]
        #         dy = obs[j,1] - traj[i,1]
        #         dist = math.sqrt(dx**2+dy**2)
                
        #         if dist <= config.obs_radius:
        #             return float("inf")
        #         if dist_min > dist:
        #             dist_min = dist
        
        return config.obstacle_cost_gain/dist_min

    def calc_final_input(self,param,vr,goal,obs,config):
        min_cost = float("inf")
        min_u = [0.0,0.0]

        for v in np.arange(vr[0],vr[1],config.v_reso):
            for w in np.arange(vr[2],vr[3],config.yawrate_reso):
                traj = self.calc_traj(param,v,w,config)

                self.all_traj.append(traj)
                
                goal_cost = self.calc_goal_cost(traj,goal,config)
                speed_cost = config.speed_cost_gain*math.fabs((config.max_speed-traj[-1,3]))
                obs_cost = self.calc_obs_cost(traj,obs,config)
                final_cost = goal_cost + speed_cost + obs_cost

                self.all_u.append(final_cost)

                if min_cost > final_cost:
                    min_cost = final_cost
                    min_u = [v,w]
                    self.best_traj = traj
        
        return min_u

    def plan(self,param,dwaconfig,midpos,planning_obs):

        self.best_traj=[]
        self.all_traj=[]
        self.all_u=[]

        vr = self.calc_dynamic_window(param,dwaconfig)

        self.vx,self.vw = self.calc_final_input(param,vr,midpos,planning_obs,dwaconfig)

        # print(self.vx,self.vw)
        # return [self.vx,self.vw],self.best_traj,self.all_traj,self.all_u
        
        return [self.vx,self.vw]