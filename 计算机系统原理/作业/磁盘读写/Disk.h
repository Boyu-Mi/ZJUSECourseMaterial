//dir、copy、del
#ifndef _DISK_H
#define _DISK_H
#include <iostream>
#include <fstream>
#include <vector>
using namespace std;
class Disk{
public:
  int sectorSize = 512;
  int clusterSize = 32;
  int dirNum = 20;
  int clusterNum = 1024;
  std::string filename;
  std::vector<bool> isfree;
  Disk(){
    storage = new char(clusterNum * clusterSize * sectorSize);
  }
  ~Disk(){
    delete[] storage;
  }
  int readInt(char* buf, int ofs){
    char tmp[4];
    for(int i = 0; i < 4; ++i){
      tmp[i] = buf[i + ofs];
    }
    return *(reinterpret_cast<int *>(tmp));
  }

  void writeInt(char* buf, int ofs, int n){
    const char * tmp = reinterpret_cast<char *>(&n);
    for(int i = 0; i < 4; ++i){
      buf[i + ofs] = tmp[i];
    }
  }

  int clusterRead(char* buf , int cid) {
    auto ofs = cid * sectorSize * clusterSize;
    for(int i = 0; i < sectorSize * clusterSize; ++i){
      buf[i] = storage[i + ofs];
    }
    return sectorSize * clusterSize;
  }

  int clusterWrite(char* buf , int cid) {
    auto ofs = cid * sectorSize * clusterSize;
    for(int i = 0; i < sectorSize * clusterSize; ++i){
       storage[i + ofs] = buf[i];
    }
    isfree.at(cid) = false;
    return sectorSize * clusterSize;
  }

  void Init(char* buffer) {
    int num = readInt(buffer , 0);
    this->dirNum = num >= 0 && num <= 255 ? num : 0;
    for (int i = 1; i < clusterNum; i++) {
      if (readInt(buffer , 4 * i) == 0) isfree.push_back(true);
      else isfree.push_back(false);
    }
  }

  int GetFree() {
    for (int i = 1; i < clusterNum; i++) {
      if (isfree.at(i)) return i;
    }
    return 0;
  }

  class fileinfo{
  public:
    int firstclusterid;
    string name;
    string date;
    void Print(){
      printf("|%-10s|%-10s|\n" , name.c_str(), date.c_str());
    }
  };

  vector<fileinfo> dir;
  vector<int> FAT;
  char* storage;
  bool copy(fileinfo src , fileinfo &dest) {
    auto first = src.firstclusterid;
    auto first_new = GetFree();
    dest.name = src.name;
    dest.date = src.date;
    dest.firstclusterid = first_new;
    char * buf = new char[clusterSize * 512];
    while(first != 0){
      clusterRead(buf, first);
      first = FAT[first];
      clusterWrite(buf, first_new);
      auto tmp = GetFree();
      FAT[first_new] = tmp;
      first_new = tmp;
    }
  }

  bool Del(string name){
    int i = 0;
    for(auto iter = dir.begin() ; iter != dir.end(); ++iter, ++i){
      if(iter->name == name){
        dir.erase(iter);
        isfree.at(i) = true;
        return true;
      }
    }
    return false;
  }

  void Dir() {
      for(auto item : dir){
        item.Print();
      }
  }
};
#endif
