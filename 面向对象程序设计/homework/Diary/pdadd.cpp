#include "diary.h"
#include "diarylist.h"
#include <fstream>
const string diary_path = ".\\diary.txt";
int main(int argc, char** argv){
  string date,str;
  vector<string> new_content;
  Diarylist list = Diarylist(diary_path);
  getline(cin,date); // get new date
  while(getline(cin,str)){//get new content
    if(str == ".")
      break;
    new_content.push_back(str);
  }
  list.add_diary(date,new_content);
  cout << "a diary has been added." << endl;
  list.write_list(diary_path);
  return 0;
}
