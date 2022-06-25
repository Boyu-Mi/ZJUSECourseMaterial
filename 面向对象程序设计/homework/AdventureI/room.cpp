//
// Created by lenovo on 2022/4/1.
//

#include "room.h"
#include <iostream>
#include <map>
#include <vector>
using namespace  std;
Room::Room(string name, bool monster, bool princess) : room_name(name), ismonster(monster), isprincess(princess){}
void Room::set_adj(int posi, Room* room) {
    /*add a adjacent relation with another room*/
    string position;
    switch (posi) {
        case 1: position = "east"; break;
        case 2: position = "west"; break;
        case 3: position = "south"; break;
        case 4: position = "north"; break;
        case 5: position = "up"; break;
        case 6: position = "down"; break;
        default: cout << "the position is wrong!" << endl; return;
    }
    room_adj_room.insert({ position, room });
}
string Room::get_room_name() {
    return room_name;
}

Room * Room::findroom(int direction) {
    string dir;
    switch (direction) {
        case 1:dir = "east"; break;
        case 2:dir = "west"; break;
        case 3:dir = "south"; break;
        case 4:dir = "north"; break;
        case 5:dir = "up"; break;
        case 6:dir = "down"; break;
        default: return NULL;
    }
    if (room_adj_room.find(dir) != room_adj_room.end())
        return room_adj_room[dir];
    else
        return NULL;
}

void Room::print_info() {
    cout << "Welcome to the " << room_name << ". There are " << room_adj_room.size() << " exits: ";
    map<string, Room*>::iterator iter;
    int i;
    for (i = 0, iter = room_adj_room.begin(); iter != room_adj_room.end(); iter++, i++) {
        if (i == room_adj_room.size() - 1) {
            cout << " and " << iter->first << "." << endl;
        }
        else if (i == room_adj_room.size() - 2){
            cout << iter->first;
        }
        else {
            cout << iter->first << ", ";
        }
    }
}

bool Room::get_is_has_princess() {
    return isprincess;
}

bool Room::get_is_has_monster() {
    return ismonster;
}

