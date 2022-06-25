//
// Created by lenovo on 2022/4/1.
//

#ifndef _ROOM_H
#define _ROOM_H
#include <iostream>
#include <string>
#include <map>
using namespace std;
class Room{
public:
    Room(string name, bool monster = false, bool princess = false);
    ~Room(){}
    void set_adj(int posi, Room* room);//add an adjacent room and its direction
    string get_room_name();
    Room *findroom(int direction);//find an adjacent room and return its pointer
    void print_info();//print the information
    bool get_is_has_princess();
    bool get_is_has_monster();
private:
    bool ismonster;//if monster is in the room
    bool isprincess;//if princess is in the room
    string room_name;//the name of this room
    map<string, Room *> room_adj_room;// the map between the direction and pointers to adjacent rooms
};
#endif
