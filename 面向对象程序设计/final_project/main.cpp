#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <set>
#include "SerializeBin.h"
#include "SerializeXML.h"

struct UserDefinedType {
    std::string name;
    int idx;
    std::vector<int> data;
    UserDefinedType(){}
    void Print(){
        std::cout << idx << std::endl;
        std::cout << name << std::endl;
        for(auto i : data)
            std::cout << i << std::endl;
    }
};

int n0, n1;
float f0, f1;
bool b0, b1;
char c0, c1;
std::string s0, s1;
std::vector<int>v0, v1;
std::list<int> l0, l1;
std::map<int, char>m0, m1;
std::pair<int, float>p0, p1;
std::set<int> set0, set1;
UserDefinedType t1, t2;

void Init(){
    /*initialize all parameters*/
    srand((unsigned int)time(NULL));
    n0 = rand();
    f0 = rand() / 1000.0;
    b0 = true;
    c0 = 'c';
    s0 = "test_for_serialization";
    std::string s = "test_vector";
    for(int i = 0; i < 5; ++i){
        v0.push_back(i);
        l0.push_front(i);
        set0.insert(i);
    }
    for(int i = 0; i < 26; ++i){
        m0[i] = (char)(i + 'a');
    }
    p0 = std::make_pair(123, 456.789);

    t1.name = "test_for_UserDefinedType";
    t1.idx = 34483;
    for(auto i = 0; i < 15; ++i){
        t1.data.push_back(i + 5);
    }
}

int main() {
    Init();
    std::cout << "test for binary serialization and deserialization" << std::endl;
    //test serialization and deserialization of int
    std::cout << "n0 = " << n0 << endl;
    serializebin::Serialize(n0, "int.bin");
    serializebin::Deserialize(n1, "int.bin");
    std::cout << "n1 = " << n1 << endl;
    std::cout << "n0 == n1: " << ((n0 == n1) ? "true" : "false") << std::endl;

    //test serialization and deserialization of float
    std::cout << "f0 = " << f0 << endl;
    serializebin::Serialize(f0, "float.bin");
    serializebin::Deserialize(f1, "float.bin");
    std::cout << "f1 = " << f1 << endl;
    std::cout << "f0 == f1: " << ((f0 - f1 < 1e-6) ? "true" : "false") << std::endl;

    //test serialization and deserialization of bool
    std::cout << "b0 = " << b0 << endl;
    serializebin::Serialize(b0, "bool.bin");
    serializebin::Deserialize(b1, "bool.bin");
    std::cout << "b1 = " << b1 << endl;
    std::cout << "b0 == b1: " << ((b0 == b1) ? "true" : "false") << std::endl;

    //test serialization and deserialization of char
    std::cout << "c0 = " << c0 << endl;
    serializebin::Serialize(c0, "char.bin");
    serializebin::Deserialize(c1, "char.bin");
    std::cout << "c1 = " << c1 << endl;
    std::cout << "c0 == c1: " << ((c0 == c1) ? "true" : "false") << std::endl;

    //test serialization and deserialization of vector
    std::cout << "v0 = {";
    for(auto item : v0){
        std::cout << item << " ";
    }
    std::cout << "}" << std::endl;
    serializebin::Serialize(v0, "vector.bin");
    serializebin::Deserialize(v1, "vector.bin");
    std::cout << "v1 = {";
    for(auto item : v1){
        std::cout << item << " ";
    }
    std::cout << "}" << std::endl;

    //test serialization and deserialization of list
    std::cout << "l0 = {";
    for(auto item : l0){
        std::cout << item << " ";
    }

    std::cout << "}" << std::endl;
    serializebin::Serialize(l0, "list.bin");
    serializebin::Deserialize(l1, "list.bin");
    std::cout << "l1 = {";
    for(auto item : l1){
        std::cout << item << " ";
    }
    std::cout << "}" << std::endl;


    //test serialization and deserialization of set
    std::cout << "set0 = {";
    for(auto item : set0){
        std::cout << item << " ";
    }

    std::cout << "}" << std::endl;
    serializebin::Serialize(set0, "set.bin");
    serializebin::Deserialize(set1, "set.bin");
    std::cout << "set1 = {";
    for(auto item : set1){
        std::cout << item << " ";
    }

    //test serialization and deserialization of map
    std::cout << "}" << std::endl;
    std::cout << "m0 = {" << std::endl;
    for(auto item : m0){
        std::cout << item.first << ": " << item.second << std::endl;
    }
    std::cout << "}" << std::endl;
    serializebin::Serialize(m0, "map.bin");
    serializebin::Deserialize(m1, "map.bin");
    std::cout << "m1 = {";
    for(auto item : m1){
        std::cout << item.first << ": " << item.second << std::endl;
    }
    std::cout << "}" << std::endl;

    //test serialization and deserialization of pair
    std::cout << "p0 = {";
    std::cout << p0.first << ", " << p0.second;
    std::cout << "}" << std::endl;
    serializebin::Serialize(p0, "pair.bin");
    serializebin::Deserialize(p1, "pair.bin");
    std::cout << "p1 = {";
    std::cout << p0.first << ": " << p1.second;
    std::cout << "}" << std::endl;

    //test serialization and deserialization of user_defined type
    std::cout << "t1:" << std::endl;
    t1.Print();
    std::cout << std::endl;
    serializebin::SerializeUserDefinedType("user_defined_type.bin", t1.idx, t1.name, t1.data);
    serializebin::DeserializeUserDefinedType("user_defined_type.bin", t2.idx, t2.name, t2.data);
    std::cout << "t2:" << std::endl;
    t2.Print();
    std::cout << std::endl;

    std::cout << "test for XML serialization and deserialization" << std::endl;

    std::cout << "n0 = " << n0 << endl;
    serializexml::serialize_xml(n0, "std_int", "int.xml");
    serializexml::deserialize_xml(n1, "std_int", "int.xml");
    std::cout << "n1 = " << n1 << endl;
    std::cout << "n0 == n1: " << ((n0 == n1) ? "true" : "false") << std::endl;

    std::cout << "f0 = " << f0 << endl;
    serializexml::serialize_xml(f0, "std_float", "float.xml");
    serializexml::deserialize_xml(f1, "std_float", "float.xml");
    std::cout << "f1 = " << f1 << endl;
    std::cout << "f0 == f1: " << ((f0 - f1 < 1e-6) ? "true" : "false") << std::endl;

    std::cout << "b0 = " << b0 << endl;
    serializexml::serialize_xml(b0, "std_bool", "bool.xml");
    serializexml::deserialize_xml(b1, "std_bool", "bool.xml");
    std::cout << "b1 = " << b1 << endl;
    std::cout << "b0 == b1: " << ((b0 == b1) ? "true" : "false") << std::endl;

    std::cout << "c0 = " << c0 << endl;
    serializexml::serialize_xml(c0, "std_char", "char.xml");
    serializexml::deserialize_xml(c1, "std_char", "char.xml");
    std::cout << "c1 = " << c1 << endl;
    std::cout << "c0 == c1: " << ((c0 == c1) ? "true" : "false") << std::endl;

    std::cout << "v0 = {";
    for(auto item : v0){
        std::cout << item << " ";
    }
    std::cout << "}" << std::endl;
    serializexml::serialize_xml(v0, "std_vector", "vector.xml");
    serializexml::deserialize_xml(v1, "std_vector", "vector.xml");
    std::cout << "v1 = {";
    for(auto item : v1){
        std::cout << item << " ";
    }
    std::cout << "}" << std::endl;


    std::cout << "l0 = {";
    for(auto item : l0){
        std::cout << item << " ";
    }
    std::cout << "}" << std::endl;
    serializexml::serialize_xml(l0, "std_list", "list.xml");
    serializexml::deserialize_xml(l1, "std_list", "list.xml");
    std::cout << "l1 = {";
    for(auto item : l1){
        std::cout << item << " ";
    }
    std::cout << "}" << std::endl;

    std::cout << "set0 = {";
    for(auto item : set0){
        std::cout << item << " ";
    }
    std::cout << "}" << std::endl;
    serializexml::serialize_xml(set0, "std_set", "set.xml");
    serializexml::deserialize_xml(set1, "std_set", "set.xml");
    std::cout << "set1 = {";
    for(auto item : set1){
        std::cout << item << " ";
    }
    std::cout << "}" << std::endl;

    std::cout << "m0 = {" << std::endl;
    for(auto item : m0){
        std::cout << item.first << ": " << item.second << std::endl;
    }
    std::cout << "}" << std::endl;
    serializexml::serialize_xml(m0, "std_map", "map.xml");
    serializexml::deserialize_xml(m1, "std_map", "map.xml");
    std::cout << "m1 = {";
    for(auto item : m1){
        std::cout << item.first << ": " << item.second << std::endl;
    }
    std::cout << "}" << std::endl;

    std::cout << "p0 = {";
    std::cout << p0.first << ", " << p0.second;
    std::cout << "}" << std::endl;
    serializexml::serialize_xml(p0, "std_pair", "pair.xml");
    serializexml::deserialize_xml(p1, "std_pair", "pair.xml");
    std::cout << "p1 = {";
    std::cout << p0.first << ": " << p1.second;
    std::cout << "}" << std::endl;

    std::cout << "t1:" << std::endl;
    t1.Print();
    std::cout << std::endl;
    serializexml::UserDefinedTypeToXML("user_defined_type", "user_defined_type.xml", t1.idx, t1.name, t1.data);
    std::cout << "serialize t1 into user_defined_type.xml";

    serializexml::XMLtoBase64("user_defined_type.xml", "base64_1.bin");
    return 0;
}
