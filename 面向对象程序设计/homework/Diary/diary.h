#ifndef _DIARY_H
#define _DIARY_H
#include <iostream>
#include <string>
#include <vector>
using namespace std;
class Diary{
private:
  string date;
  vector<string> content;
public:
  string get_date();
  vector<string> get_content();
  void set_date(string new_date);
  void set_content(vector<string> new_content);
  void remove();
  void display();
};

#endif
