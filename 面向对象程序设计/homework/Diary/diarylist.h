#ifndef _DIARYLIST_H
#define _DIARYLIST_H
#include "diary.h"
#include <fstream>
using namespace std;
class Diarylist {
public:
  vector<Diary> diary_list;
  Diarylist(string f_path);
  void write_list(string f_path);
  void add_diary(string date, vector<string> new_content);
  void display_diary(string date);
};
#endif
