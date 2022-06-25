//
// Created by lenovo on 2022/4/1.
//

#include "castle.h"
#include "room.h"
#include <vector>
#include <string>
#include <map>
#include <ctime>
Castle::Castle() {
    Room lobby("Lobby");// the initial room
    srand((int)time(0));
    roomlist.push_back(lobby);
    is_has_monster = is_has_princess = is_take_princess = false;
    princess_position = (rand() % 5) + 1;
    do {
        monster_position = (rand() % 5) + 1;
    } while (princess_position == monster_position);//generate positions of princess and monster, make sure they're not same.
    //add 5 rooms and their relations
    addroom("Dam");
    addroom("Dam Base");
    addroom("Reservoir");
    addroom("Deep Canyon");
    addroom("Maintenance Room");
    connect_room("Lobby", 13, { "Maintenance Room" ,"Dam", "Maintenance Room" });
    connect_room("Maintenance Room", 6, { "Lobby" ,"Lobby" });
    connect_room("Dam", 47, { "Dam Base","Reservoir" ,"Deep Canyon","Lobby","Dam Base" });
    connect_room("Reservoir", 5, { "Dam","Deep Canyon" });
    connect_room("Deep Canyon", 9, { "Dam","Reservoir" });
    connect_room("Dam Base", 24, { "Dam","Dam" });
    this->now = find_room("Lobby");// the player is in lobby at the beginning
}
Castle::~Castle(){}
void Castle::addroom(string name) {
    //add a room into the castle, generate princess and monster randomly
    if (roomlist.size() == princess_position) {
        Room newroom_princess(name, true, false);
        is_has_princess = true;
        roomlist.push_back(newroom_princess);
        return;
    }
    if (roomlist.size() == monster_position) {
        Room newroom_monster(name, false, true);
        is_has_monster = true;
        roomlist.push_back(newroom_monster);
        return;
    }
    Room newroom(name, false, false);
    roomlist.push_back(newroom);
}

void Castle::connect_room(string room, int adjacent, vector<string> adjroom) {
    /* connect a room with a list of rooms
     * if (adjacent >> 1) & 1 is 1, there is a east exit of this room,
     * if (adjacent >> 2) & 1 is 1, there is a west exit of this room,
     * if (adjacent >> 3) & 1 is 1, there is a south exit of this room,
     * if (adjacent >> 4) & 1 is 1, there is a north exit of this room,
     * if (adjacent >> 5) & 1 is 1, there is a up exit of this room,
     * if (adjacent >> 6) & 1 is 1, there is a down exit of this room.
    */
    Room* tmproom = find_room(room);
    if (!tmproom) {
        cout << "NO ROOM" << endl;
        return;
    }
    int j = 0;
    for (int i = 0; i < 6; i++) {
        if ((adjacent >> i) & 1) {
            Room* tmp = find_room(adjroom[j++]);
            if (tmp) {
                tmproom->set_adj(i + 1, tmp);
            }
        }
    }
}

Room * Castle::find_room(string roomname) {
    //find a room by its name
    vector<Room>::iterator iter;
    for (iter = roomlist.begin(); iter != roomlist.end(); iter++) {
        if (iter->get_room_name() == roomname) {
            return &(*iter);
        }
    }
    return NULL;
}

void Castle::move(int direction) {
    //move to another room
    if (now->findroom(direction))
        now = now->findroom(direction);
    else
        cout << "No such a exit!" << endl;
}

void Castle::game() {
    //begin the game
    bool is_game_over = false;
    cout << "Welcome to Adventure!" << endl;
    string opreation;
    while (!is_game_over) {
        //game over
        now->print_info();
        if (now->get_is_has_monster()) {
            cout << "The monster is in this room!\nGAME OVER" << endl;
            break;
        }
        else if (is_take_princess && now->get_room_name() == "Lobby") {
            cout << "SUCCESS" << endl;
            break;
        }
        else if (now->get_is_has_princess()) {
            cout << "The princess is in this room!\nYou should take her away." << endl;
            is_take_princess = true;
        }
        cout << "Enter your command: " << endl;
        getline(cin, opreation);
        if (opreation == "go east")
            move(1);
        else if (opreation == "go west")
            move(2);
        else if (opreation == "go south")
            move(3);
        else if (opreation == "go north")
            move(4);
        else if (opreation == "go up")
            move(5);
        else if (opreation == "go down")
            move(6);
        else {
            cout << "I cannot understand." << endl;
        }
    }
}