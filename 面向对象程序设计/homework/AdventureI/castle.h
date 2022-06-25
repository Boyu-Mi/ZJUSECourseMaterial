//
// Created by lenovo on 2022/4/1.
//

#ifndef _CASTLE_H
#define _CASTLE_H
#include "room.h"
#include <vector>
#include <string>
#include <iostream>
#include <set>

using namespace std;

class Castle {
public:
    Castle();
    ~Castle();
    void addroom(string name);
    void connect_room(string room, int adjacent, vector<string> adjroom);
    Room *find_room(string roomname);
    void move(int direction);
    void game();

private:
    bool is_has_monster;//if the monster has been generated
    bool is_has_princess;//if the princess has been generated
    bool is_take_princess;//if the player has met the princess
    int princess_position;//position of princess
    int monster_position;//position of monster
    Room* now;//the position of player
    set<string> room_name_set;
    vector<Room> roomlist;//list of rooms
};


#endif
