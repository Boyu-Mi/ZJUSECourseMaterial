//
// Created by lenovo on 2022/4/12.
//
#include "diary.h"
#include <iostream>
#include <string>
#include <vector>
using namespace std;

string Diary::get_date() {
  return date;
}

vector<string> Diary::get_content() {
  return content;
}
void Diary::set_date(string new_date) {
  date = new_date;
}

void Diary::set_content(vector<string> new_content){
  content.assign(new_content.begin(),new_content.end());
}

void Diary::remove() {
  content.clear();
}
//print the date and content of a diary
void Diary::display() {
  cout << date << endl;
  for(int i = 0;i < content.size(); i++){
    cout << content[i] << endl;
  }
}
