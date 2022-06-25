#include "diary.h"
#include "diarylist.h"
const string diary_path = ".\\diary.txt";
int main(int argc, char** argv){
  string begin_date,end_date;
  vector<string> new_content;
  Diarylist list = Diarylist(diary_path);
  vector<Diary>::iterator iter = list.diary_list.begin();
  if(argc == 1){//list all diaries
    while(iter != list.diary_list.end()){
      iter->display();
      iter++;
    }
  }else if (argc == 3){
  	//begin date and end date are given
    begin_date = argv[1];
    end_date = argv[2];
    while(iter != list.diary_list.end() && end_date >= iter->get_date()){
      if(begin_date <= iter->get_date())
        iter->display();
      iter++;
    }
  }
}
