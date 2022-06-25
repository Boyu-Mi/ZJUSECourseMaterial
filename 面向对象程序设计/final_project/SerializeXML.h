#ifndef OBJECT_SERIALIZATION_SERIALIZEXML_H
#define OBJECT_SERIALIZATION_SERIALIZEXML_H
#include "SerializeBin.h"
#include "tinyxml2.h"
#include <string>
namespace serializexml{
    //for serialize one item to XML
    class SerializationXML{
    public:
        std::string file_name = "test.xml";
        std::string type_name;
        tinyxml2::XMLDocument document;
        tinyxml2::XMLElement* root;

    public:
        //constructor, create a declaration and add a root
        SerializationXML(std::string type_name, std::string file_name) : type_name(type_name), file_name(file_name){
            document.Clear();
            tinyxml2::XMLDeclaration* declaration = document.NewDeclaration("xml version=\"1.0\" encoding=\"UTF-8\"");
            document.InsertFirstChild(declaration);
            root = document.NewElement("Serialization");
        }

        //add end child to the root and save file
        ~SerializationXML(){
            document.InsertEndChild(root);
            document.SaveFile(file_name.c_str());
        }

        //to_string_: convert int, char, bool, float, string into const char *
        inline const char * to_string_(const int & n){
            return std::to_string(n).c_str();
        }

        inline const char * to_string_(const char & n){
            return std::string(1, n).c_str();
        }
        inline const char * to_string_(const float & n){
            return std::to_string(n).c_str();
        }

        inline const char * to_string_(const bool & n){
            return ((n == true) ? "true" : "false");
        }

        inline const char * to_string_(const std::string & n){
            return n.c_str();
        }

        //serialize a string to the root
        //change the object into string
        void SerializeToXML(const string& object, tinyxml2::XMLElement* root_){
            tinyxml2::XMLElement* element = document.NewElement("std_string");
            element->SetAttribute("val", object.c_str());
            root_->InsertEndChild(element);
        }

        void SerializeToXML(const bool& object, tinyxml2::XMLElement* root_){
            tinyxml2::XMLElement* element = document.NewElement("std_bool");
            element->SetAttribute("val", (object) ? "true" : "false");
            root_->InsertEndChild(element);
        }

        void SerializeToXML(char& object, tinyxml2::XMLElement* root_){
            tinyxml2::XMLElement* element = document.NewElement("std_char");
            element->SetAttribute("val", std::string(1, object).c_str());
            root_->InsertEndChild(element);
        }

        void SerializeToXML(const int& object, tinyxml2::XMLElement* root_){
            tinyxml2::XMLElement* element = document.NewElement("std_int");
            element->SetAttribute("val", std::to_string(object).c_str());
            root_->InsertEndChild(element);
        }

        void SerializeToXML(const float& object, tinyxml2::XMLElement* root_){
            tinyxml2::XMLElement* element = document.NewElement("std_float");
            element->SetAttribute("val", std::to_string(object).c_str());
            root_->InsertEndChild(element);
        }

        /*
         * vector, list and set:
         * firstly create element of the type
         * secondly set an attribute of size
         * then serialize every item
         * */
        template<typename T>
        void SerializeToXML(const std::vector<T> vec, tinyxml2::XMLElement* root_){
            tinyxml2::XMLElement* element = document.NewElement("std_vector");
            element->SetAttribute("size", vec.size());
            root_->InsertEndChild(element);
            for (auto item : vec){
                SerializeToXML(item, element);
            }
        }

        template<typename T>
        void SerializeToXML(const std::list<T> lst, tinyxml2::XMLElement* root_){
            tinyxml2::XMLElement* element = document.NewElement("std_list");
            element->SetAttribute("size", lst.size());
            root_->InsertEndChild(element);
            for (auto item : lst){
                SerializeToXML(item, element);
            }
        }

        template<typename T>
        void SerializeToXML(const std::set<T> set, tinyxml2::XMLElement* root_){
            tinyxml2::XMLElement* element = document.NewElement("std_set");
            element->SetAttribute("size", set.size());
            root_->InsertEndChild(element);
            for (auto item : set){
                SerializeToXML(item, element);
            }
        }

        template<typename First, typename Second>
        void SerializeToXML(const std::pair<First, Second> pair, tinyxml2::XMLElement* root_){
            tinyxml2::XMLElement* element = document.NewElement("std_pair");//create element
            root_->InsertEndChild(element);
            //serialize First and Second
            tinyxml2::XMLElement* first_element = document.NewElement("First");
            first_element->SetAttribute("val", to_string_(pair.first));
            element->InsertEndChild(first_element);
            tinyxml2::XMLElement* second_element = document.NewElement("Second");
            second_element->SetAttribute("val", to_string_(pair.second));
            element->InsertEndChild(second_element);
        }

        template<typename Key, typename Value>
        void SerializeToXML(const std::map<Key, Value> &map, tinyxml2::XMLElement* root_){
            tinyxml2::XMLElement* element = document.NewElement("std_map");//create element
            element->SetAttribute("size", map.size());//add size
            root_->InsertEndChild(element);
            auto iter = map.begin();
            for(; iter != map.end(); iter++){
                //serialize every pair of the map
                tinyxml2::XMLElement* pair_ = document.NewElement("std_pair");
                element->InsertEndChild(pair_);
                tinyxml2::XMLElement* first_element = document.NewElement("Key");
                pair_->InsertEndChild(first_element);
                SerializeToXML(iter->first, first_element);
                tinyxml2::XMLElement* second_element = document.NewElement("Value");
                pair_->InsertEndChild(second_element);
                SerializeToXML(iter->second, second_element);
            }
        }

        //serialize attributes recursively
        template <class H, class ...Args>
        void userDefinedType2XML (tinyxml2::XMLElement* root_, H head, Args... rest) {
            SerializeToXML(head, root_);
            userDefinedType2XML(root_, rest...);
        }
        //end of recursion
        inline void userDefinedType2XML (tinyxml2::XMLElement* root_){}
    };

    class DeserializationXML {
    public:
        std::string file_name;
        std::string type_name;
        tinyxml2::XMLDocument document;
        tinyxml2::XMLElement* root;
        const char * element;
    public:
        DeserializationXML(std::string type_id, std::string file_name) : type_name(type_id), file_name(file_name){
            document.Clear();
            if(document.LoadFile(file_name.c_str()) != 0){
                throw "Load fail";
            }else {
                root = document.FirstChildElement("Serialization");
            }
        }

        /*deserialize std_int, std_char, std_float, std_bool and std_string from XML
         * get the value from the string attribute.
         * */
        inline void DeserializeFromXML(int& obj, tinyxml2::XMLElement* root_){
            auto element_ = root_;
            if(element_ != nullptr){
                element = element_->Attribute("val");
            }else
                element = nullptr;
            if(element != nullptr)
                obj = atoi(element);
        }

        inline void DeserializeFromXML(float& obj, tinyxml2::XMLElement* root_){
            auto element_ = root_;
            if(root_ != nullptr){
                element = element_->Attribute("val");
            }else
                element = nullptr;
            if(element != nullptr)
                obj = atof(element);
        }

        inline void DeserializeFromXML(bool& obj, tinyxml2::XMLElement* root_){
            auto element_ = root_;
            if(root_ != nullptr){
                element = element_->Attribute("val");
            }else
                element = nullptr;
            if(element != nullptr)
                obj = !(strcmp(element, "true"));
        }

        inline void DeserializeFromXML(char& obj, tinyxml2::XMLElement* root_){
            auto element_ = root_;
            if(root_ != nullptr){
                element = element_->Attribute("val");
            }else
                element = nullptr;
            if(element != nullptr)
                obj = *(element);
        }

        inline void DeserializeFromXML(std::string& obj, tinyxml2::XMLElement* root_){
            auto child = root_;
            if(child != nullptr){
                element = child->Attribute("val");
            }else{
                element = nullptr;
            }
            if(element != nullptr)
                obj = std::string(element);
        }

        template<class T>
        inline void DeserializeFromXML(std::vector<T>& obj, tinyxml2::XMLElement * root_){
            obj.clear();
            T item = T();
            tinyxml2::XMLElement *element_ = root_;
            auto child = element_->FirstChild()->ToElement();
            auto size_ = atoi(element_->Attribute("size"));//get the size
            for(auto i = 0; i < size_; ++i){
                //get items one by one, then move to the next item
                DeserializeFromXML(item, child);
                obj.push_back(item);
                if(child->NextSibling())
                    child = child->NextSibling()->ToElement();
            }
        }

        template<class T>
        inline void DeserializeFromXML(std::list<T>& obj, tinyxml2::XMLElement * root_){
            obj.clear();
            T item = T();
            tinyxml2::XMLElement *element_ = root_;
            auto child = element_->FirstChild()->ToElement();
            auto size_ = atoi(element_->Attribute("size"));//get the size
            for(auto i = 0; i < size_; ++i){
                //get items one by one, then move to the next item
                DeserializeFromXML(item, child);
                obj.push_back(item);
                if(child->NextSibling())
                    child = child->NextSibling()->ToElement();
            }
        }

        template<class T>
        inline void DeserializeFromXML(std::set<T>& obj, tinyxml2::XMLElement * root_){
            obj.clear();
            T item = T();
            tinyxml2::XMLElement *element_ = root_;
            auto child = element_->FirstChild()->ToElement();
            auto size_ = atoi(element_->Attribute("size"));//get size
            for(auto i = 0; i < size_; ++i){
                //get items one by one, then move to the next item
                DeserializeFromXML(item, child);
                obj.insert(item);
                if(child->NextSibling())
                    child = child->NextSibling()->ToElement();
            }
        }

        template<class First, class Second>
        inline void DeserializeFromXML(std::pair<First, Second>& obj, tinyxml2::XMLElement * root_){
            First first;
            Second second;
            tinyxml2::XMLElement *element_ = root_;
            tinyxml2::XMLElement *child = element_->FirstChild()->ToElement();
            if(element_ != nullptr) {
                //get first and child
                DeserializeFromXML(first, child);
                if(child != nullptr){
                    child = child->NextSibling()->ToElement();
                }
                DeserializeFromXML(second, child);
            }
            obj = std::make_pair(first, second);
        }

        template<class Key, class Value>
        inline void DeserializeFromXML(std::map<Key, Value>& obj, tinyxml2::XMLElement * root_){
            Key key;
            Value val;
            tinyxml2::XMLElement *child = root_->FirstChild()->ToElement();
            auto size_ = atoi(root_->Attribute("size"));//get the size of the map
            for(auto i = 0; i < size_; ++i){
                //for each pair, get key and value
                std::pair<Key, Value> new_element;
                tinyxml2::XMLElement* first = child->FirstChildElement("Key");
                tinyxml2::XMLElement* second = child->FirstChildElement("Value");
                Key key;
                Value val;
                DeserializeFromXML(key, first->FirstChild()->ToElement());
                DeserializeFromXML(val, second->FirstChild()->ToElement());
                //add the pair to the new map
                new_element.first = key;
                new_element.second = val;
                obj.insert(new_element);
                //move to the next pair
                if(child->NextSibling())
                    child = child->NextSibling()->ToElement();
            }
        }

        template <class H, class ...Args>
        void XML2userDefinedType (tinyxml2::XMLElement* root_, H& head, Args&... rest) {
            auto child = root_;
            //deserialize attributes one by one
            DeserializeFromXML(head, child);
            if(child->NextSibling())
                child = child->NextSibling()->ToElement();
            XML2userDefinedType(child, rest...);//call itself recursively
        }
        //end of recursion
        inline void XML2userDefinedType (tinyxml2::XMLElement* root_){
            return;
        }

    };

    template<class T>
    void serialize_xml(T item, std::string type_name, std::string file_name){
        //interface of serialization
        SerializationXML *serializer = new SerializationXML(type_name, file_name);
        serializer->SerializeToXML(item, serializer->root);
        delete serializer;

    }

    //for user_defined class
    template <class ...Args>
    void UserDefinedTypeToXML (std::string type_name, std::string file_name, Args... args) {
        SerializationXML *serializer = new SerializationXML(type_name, file_name);
        serializer->userDefinedType2XML(serializer->root, args...);
        delete serializer;
    }

    template<class T>
    void deserialize_xml(T& item, std::string type_name, std::string file_name){
        DeserializationXML *deserializer = new DeserializationXML(type_name, file_name);
        if(deserializer->root->FirstChildElement(type_name.c_str()) == nullptr){
            //cannot find an element of type type_name
            throw "No such a element";
        }
        //call DeserializeFromXML
        deserializer->DeserializeFromXML(item, deserializer->root->FirstChildElement(type_name.c_str()));
        delete deserializer;
    }

    //deserialize user defined type
    template <class ...Args>
    void XMLToUserDefinedType (std::string type_name, std::string file_name, Args&... args) {
        DeserializationXML *deserializer = new DeserializationXML(type_name, file_name);
        deserializer->XML2userDefinedType(deserializer->root->ToElement(), args...);
        delete deserializer;
    }

    void XMLtoBase64(std::string XML_file_name, std::string Base64_file_name){
        ifstream in_file;
        in_file.open(XML_file_name);
        ofstream tmp;
        tmp.open("tmp");
        std::string str;
        bool flag_ = false;
        while(getline(in_file, str)){
            if(!in_file.eof())
                if(!flag_) {
                    tmp << str;
                    flag_ = true;
                }else{
                    tmp << std::endl << str;
                }
        }
        in_file.close();
        tmp.close();
        ofstream out_file;
        out_file.open(Base64_file_name, ios::binary);
        in_file.open("tmp");
        char buf_1[3];
        char buf_2[4];
        int read_size = 0;
        while(!in_file.eof()){
            memset(buf_2, 0, 4);
            read_size = 0;
            while(read_size < 3) {
                if (in_file.eof()) break;
                in_file.read(buf_1 + read_size, 1);
                ++read_size;
            }
            char res[4];
            if(read_size == 3) {
                buf_2[0] = (buf_1[0] >> 2) & 0x3f;
                buf_2[1] = (((buf_1[0] & 0x03) << 4) | (buf_1[1] >> 4)) & 0x3f;
                buf_2[2] = (((buf_1[1] & 0x0f) << 2) | (buf_1[2] >> 6)) & 0x3f;
                buf_2[3] = buf_1[2] & 0x3f;

                for (int i = 0; i < 4; i++) {
                    if (buf_2[i] >= 0 && buf_2[i] < 26)
                        res[i] = buf_2[i] + 65;
                    else if (buf_2[i] >= 26 && buf_2[i] < 52)
                        res[i] = buf_2[i] + 71;
                    else if (buf_2[i] >= 52 && buf_2[i] < 62)
                        res[i] = buf_2[i] - 4;
                    else if (buf_2[i] == 62)
                        res[i] = '+';
                    else
                        res[i] = '\\';
                }
            }
            else if(read_size == 2){
                buf_2[0] = (buf_1[0] >> 2) & 0x3f;
                buf_2[1] = (((buf_1[0] & 0x03) << 4) | (buf_1[1] >> 4)) & 0x3f;
                buf_2[2] = (((buf_1[1] & 0x0f) << 2) | (buf_1[2] >> 6)) & 0x3f;
                buf_2[3] = buf_1[2] & 0x3f;
                char res[4];
                for (int i = 0; i < 3; i++) {
                    if (buf_2[i] >= 0 && buf_2[i] < 26)
                        res[i] = buf_2[i] + 65;
                    else if (buf_2[i] >= 26 && buf_2[i] < 52)
                        res[i] = buf_2[i] + 71;
                    else if (buf_2[i] >= 52 && buf_2[i] < 62)
                        res[i] = buf_2[i] - 4;
                    else if (buf_2[i] == 62)
                        res[i] = '+';
                    else
                        res[i] = '\\';
                }
                res[3] = res[2] = '=';
            }
            else if(read_size == 1){
                buf_2[0] = (buf_1[0] >> 2) & 0x3f;
                buf_2[1] = (((buf_1[0] & 0x03) << 4) | (buf_1[1] >> 4)) & 0x3f;
                buf_2[2] = (((buf_1[1] & 0x0f) << 2) | (buf_1[2] >> 6)) & 0x3f;
                buf_2[3] = buf_1[2] & 0x3f;
                char res[4];
                for (int i = 0; i < 2; i++) {
                    if (buf_2[i] >= 0 && buf_2[i] < 26)
                        res[i] = buf_2[i] + 65;
                    else if (buf_2[i] >= 26 && buf_2[i] < 52)
                        res[i] = buf_2[i] + 71;
                    else if (buf_2[i] >= 52 && buf_2[i] < 62)
                        res[i] = buf_2[i] - 4;
                    else if (buf_2[i] == 62)
                        res[i] = '+';
                    else
                        res[i] = '\\';
                }
                res[3] = res[2] = res[1] = '=';
            }
            out_file.write(res, 4);
        }
        in_file.close();
        out_file.close();
    }
}


#endif
