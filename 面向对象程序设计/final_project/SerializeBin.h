#ifndef OBJECT_SERIALIZATION_SERIALIZEBIN_H
#define OBJECT_SERIALIZATION_SERIALIZEBIN_H

#include <iostream>
#include <fstream>
#include <cstring>
#include <vector>
#include <map>
#include <list>
#include <set>
using namespace std;
namespace serializebin {
    //write: write an item to out file stream
    template <class T>
    void write(ofstream &f, T item){
        char *buf;
        buf = reinterpret_cast<char *> (&item);
        f.write(buf, sizeof(T));
    }
    void write(ofstream &f, string s){
        int size = s.size();
        f.write(reinterpret_cast<char *>(&size), sizeof(int));
        f.write(s.c_str(), size);
    }

    //read: read into an item from in file stream
    template <class T>
    void read(ifstream &f, T &item){
        if(f.eof()) return;
        char *buf = new char[sizeof(T) + 1];
        f.read(buf, sizeof(T));
        T* tmp = reinterpret_cast<T *>(buf);
        item = *tmp;
    }

    void read(ifstream &f, string& s){
        if(f.eof()) return;
        s = "";
        char *buf = new char[sizeof(int)];
        f.read(buf, sizeof(int));
        int size = *reinterpret_cast<int *>(buf);
        for(auto i = 0; i < size; i++){
            f.read(buf, 1);
            s += *buf;
        }
    }

    //for arithmetic types
    template<typename T>
    uint32_t SerializeTo(T item, ofstream& out_stream){
        write(out_stream, item);
        return 1;
    }

    template<typename T>
    void DeserializeFrom(T &item, ifstream& in_stream){
        if(!in_stream.eof())
            read(in_stream, item);
    }

    //for string
    uint32_t SerializeTo(string str, ofstream& out_stream){
        auto size = str.length();
        write(out_stream, str);
        return size;
    }
    void DeserializeFrom(string &str, ifstream& in_stream){
        read(in_stream, str);
    }

    //for vector, set, list, serialize items of it one by one
    //for set
    template<class T>
    uint32_t SerializeTo(set<T> s, ofstream& out_stream){
        for(auto &i : s){
            write(out_stream, i);
        }
        return 1;
    }

    template<class T>
    void DeserializeFrom(set<T>& s, ifstream& in_stream){
        T item;
        while(!in_stream.eof()){
            DeserializeFrom(item, in_stream);
            if(!in_stream.eof())
              s.insert(item);
        }
    }

    //for map, serialize every pair
    template <class key, class value>
    uint32_t SerializeTo(map<key, value>& map, ofstream &out_stream){
        for (auto& i : map){
            key first = i.first;
            value second = i.second;
            write(out_stream, first);
            write(out_stream, second);
        }
        return (sizeof(key) + sizeof(value)) * map.size();
    }

    template <class key, class value>
    void DeserializeFrom(map<key, value>& map, ifstream& in_stream){
        key first;
        value second;
        char *buf = new char[sizeof(int)];
        while(!in_stream.eof()){
            DeserializeFrom(first, in_stream);
            if(!in_stream.eof()){
                DeserializeFrom(second, in_stream);
                map.insert({first, second});
            }
        }
    }

    //for vector
    template<class T>
    uint32_t SerializeTo(vector<T> v, ofstream& out_stream){
        for(auto &i : v){
            write(out_stream, i);
        }
        return 1;
    }

    template<class T>
    void DeserializeFrom(vector<T>& v, ifstream& in_stream){
        T item;
        while(!in_stream.eof()){
            DeserializeFrom(item, in_stream);
            if(!in_stream.eof())
                v.push_back(item);
        }
    }

    //for list
    template<class T>
    uint32_t SerializeTo(list<T> v, ofstream& out_stream){
        for(auto &i : v){
            write(out_stream, i);
        }
        return 1;
    }

    template<class T>
    void DeserializeFrom(list<T>& v, ifstream& in_stream){
        T item;
        while(!in_stream.eof()){
            DeserializeFrom(item, in_stream);
            if(!in_stream.eof())
                v.push_back(item);
        }
    }

    //for user_designed class
    uint32_t userDefinedType2Bin(ofstream& out_stream){
        return 1;
    }

    //serialize user defined type recursively
    template<class H, class ...Args>
    uint32_t userDefinedType2Bin(ofstream& out_stream, H head_class, Args... rest_class){
        SerializeTo(head_class, out_stream);
        userDefinedType2Bin(out_stream, rest_class...);
        return 1;
    }

    void Bin2UserDefinedType(ifstream& in_stream){
        return;
    }

    //deserialize user defined type
    template<class H, class ...Args>
    void Bin2UserDefinedType(ifstream& in_stream, H& head_class, Args&... rest_class){
        H item;
        while(!in_stream.eof()){
            DeserializeFrom(head_class, in_stream);
            if(!in_stream.eof())
                Bin2UserDefinedType(in_stream, rest_class...);
        }
    }

    //for pair
    template <class first, class second>
    uint32_t SerializeTo(pair<first, second>& pair, ofstream &out_stream){
        first first_ = pair.first;
        second second_ = pair.second;
        write(out_stream, first_);
        write(out_stream, second_);
        return 1;
    }

    template <class first, class second>
    void DeserializeFrom(pair<first, second>& pair, ifstream& in_stream){
        first first_;
        second second_;
        DeserializeFrom(first_, in_stream);
        DeserializeFrom(second_, in_stream);
        pair = make_pair(first_, second_);
    }

    //interface of serialization to the file
    template <typename T>
    uint32_t Serialize(T object, std::string file_name){
        ofstream out_file;
        out_file.open(file_name);
        SerializeTo(object, out_file);
        out_file.flush();
        out_file.close();
        return 1;
    }

    template<class ...Args>
    void SerializeUserDefinedType(std::string file_name, Args... args){
        ofstream out_file;
        out_file.open(file_name);
        userDefinedType2Bin(out_file, args...);
        out_file.flush();
        out_file.close();
    }

    void SerializeUserDefinedType(std::string file_name){
        return;
    }

    //interface of deserialization from the file
    template <typename T>
    void Deserialize(T& object, std::string file_name){
        ifstream in_file;
        in_file.open(file_name);
        DeserializeFrom(object, in_file);
        in_file.close();
    }

    template<class ...Args>
    void DeserializeUserDefinedType(std::string file_name, Args&... args){
        ifstream in_file;
        in_file.open(file_name);
        Bin2UserDefinedType(in_file, args...);
        in_file.close();
    }

    //end of recursion
    void DeserializeFrom(std::string file_name){
        return;
    }


}
#endif
