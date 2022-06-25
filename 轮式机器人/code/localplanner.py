"""
dwaplanner for wheeled robot, ZJU 2022 Spring
Mi Boyu
"""
import numpy as np
import math
from scipy.spatial import distance_matrix


class DWAConfig:
    robot_radius = 0.25

    def __init__(self, obs_radius):
        self.obs_radius = obs_radius
        self.dt = 0.1  # [s] Time tick for motion prediction

        self.max_speed = 2.0  # [m/s]
        self.min_speed = -0.5  # [m/s]
        self.max_accel = 1  # [m/ss]
        self.v_reso = self.max_accel*self.dt/4.0  # [m/s]

        self.max_yawrate = 100.0 * math.pi / 180.0  # [rad/s]
        self.max_dyawrate = 200.0 * math.pi / 180.0  # [rad/ss]
        self.yawrate_reso = self.max_dyawrate*self.dt/10.0  # [rad/s]

        self.predict_time = 2  # [s]

        self.to_goal_cost_gain = 1.0
        self.speed_cost_gain = 0.1
        self.obstacle_cost_gain = 1.0

        self.tracking_dist = self.predict_time*self.max_speed
        self.arrive_dist = 0.1


class dwa:
    def __init__(self):
        # self.obstacle_map = None
        # self.obs_radius = 1.0
        # self.dt = 0.1  # [s] Time tick for motion prediction
        # self.vx = 0
        # self.vw = 0
        # self.x = 0
        # self.y = 0
        # self.theta = 0
        # self.obs_radius = 0.25
        # self.dt = 0.1  # [s] Time tick for motion prediction

        # self.max_speed = 2.0  # [m/s]
        # self.min_speed = -0.5  # [m/s]
        # self.max_accel = 1  # [m/ss]
        # self.v_reso = self.max_accel*self.dt/4.0  # [m/s]

        # self.max_yawrate = 100.0 * math.pi / 180.0  # [rad/s]
        # self.max_dyawrate = 200.0 * math.pi / 180.0  # [rad/ss]
        # self.yawrate_reso = self.max_dyawrate*self.dt/10.0  # [rad/s]

        # self.predict_time = 2  # [s]

        # self.to_goal_cost_gain = 1.0
        # self.speed_cost_gain = 0.1
        # self.obstacle_cost_gain = 1.0

        # self.tracking_dist = self.predict_time*self.max_speed
        # self.arrive_dist = 0.1
        self.vx = 0
        self.vw = 0
        self.best_traj = []
        self.all_traj = []
        self.all_u = []

    def goal_cost(self, path, midpos, config):
        return np.hypot(path[-1][0] - midpos[0], path[-1][1] - midpos[1]) * (config.to_goal_cost_gain)

    def obs_cost(self, path, obs, config):
        # mincost = 1e9
        # for i in range(len(path)):
        #     for j in range(len(obs[:, 0])):
        #         tmp = np.hypot(path[i][0] - obs[j][0], path[i][1] - obs[j][1])
        #         if tmp <= self.obs_radius + 0.25:
        #             return 1e8
        #         elif tmp < mincost:
        #             mincost = tmp
        # return 1.0 / mincost  # 1.0 / tmp
        min_dist = float("inf")
        if path == [] or obs == []:
            return min_dist
        dis_mat = distance_matrix(np.array(path).T[0:2].T, obs)
        if not(dis_mat == [[]]):
            min_dist = np.array(dis_mat).min()
        return config.obstacle_cost_gain/min_dist

    def vel_cost(self, path, config):
        return config.speed_cost_gain * (config.max_speed-path[-1, 3])
    def cal_path(self, param, v, w, config):
        x = np.array(param)
        time = 0
        path = np.array(x)
        while time <= config.predict_time:
            time += config.dt
            x = self.motion(x, v, w, config.dt)
            path = np.vstack((path, x))
        return path

    def motion(self, param, v, w, dt):
        param[0] += v*math.cos(param[2])*dt
        param[1] += v*math.sin(param[2])*dt
        param[2] += w*dt
        param[3] = v
        param[4] = w
        return param
    # def cal_path(self, init_pos, v, vw):
    #     path = np.array(init_pos)
    #     t = 0
    #     tmp = init_pos
    #     while t <= dwaconfig.predict_time:
    #         tmp[0] += v * np.cos(tmp[2])*self.dt
    #         tmp[1] += v * np.sin(tmp[2])*self.dt
    #         tmp[2] += vw * self.dt
    #         tmp[3] = v
    #         tmp[4] = vw
    #         tmp = np.array(tmp)
    #         # print("add",tmp[0],)
    #         path = np.vstack((path, tmp))
    #         t += self.dt
    #     return path

    def V_Range(self, v, vw, config):
        vl = max(-0.5, v - config.max_accel*config.dt)
        vu = min(1, v + config.max_accel*config.dt)
        vwl = max(vw - config.max_dyawrate * config.dt, -1 * config.max_yawrate)
        vwu = min(vw + config.max_dyawrate * config.dt, config.max_yawrate)
        return vl, vu, vwl, vwu

    def plan(self, info, dwaconfig, midpos, planning_obs):
        self.x = info[0]
        self.y = info[1]
        self.theta = info[2]
        self.vx = info[3]
        self.vw = info[4]
        self.myinfo = [self.x, self.y, self.theta, self.vx, self.vw]
        vl, vu, vwl, vwu = self.V_Range(self.vx, self.vw, dwaconfig)
        min_score = float("inf")
        best_v, best_vw = 0, 0
        all_traj = []
        all_u = []
        for v in np.arange(vl, vu, dwaconfig.v_reso):
            for vw in np.arange(vwl, vwu, dwaconfig.yawrate_reso):
                tmppath = self.cal_path(
                    [self.x, self.y, self.theta, v, vw], v, vw, dwaconfig)
                all_traj.append(tmppath)
                goal_score = self.goal_cost(tmppath, midpos, dwaconfig)
                vel_score = self.vel_cost(tmppath, dwaconfig)
                obs_score = self.obs_cost(tmppath, planning_obs, dwaconfig)
                score = goal_score + vel_score + obs_score
                all_u.append(score)
                if min_score > score:
                    min_score = score
                    best_vw = vw
                    best_v = v
        return best_v, best_vw
