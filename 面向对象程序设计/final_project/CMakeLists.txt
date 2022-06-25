cmake_minimum_required(VERSION 3.16)
project(Object_Serialization)

set(CMAKE_CXX_STANDARD 14)

add_executable(Object_Serialization main.cpp
        SerializeBin.h
        tinyxml2.h
        tinyxml2.cpp
        SerializeXML.h)
