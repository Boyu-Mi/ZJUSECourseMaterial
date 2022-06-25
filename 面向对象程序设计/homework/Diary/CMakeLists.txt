cmake_minimum_required(VERSION 3.21)
project(pd)

set(CMAKE_CXX_STANDARD 14)
include_directories("${PROJECT_BINARY_DIR}")
add_executable(hw04
        diary.cpp
        diary.h
        diarylist.cpp
        diarylist.h
        pdadd.cpp)
add_executable(pdlist.exe
        diary.cpp
        diary.h
        diarylist.cpp
        diarylist.h
        pdlist.cpp)
add_executable(pdshow.exe
        diary.cpp
        diary.h
        diarylist.cpp
        diarylist.h
        pdshow.cpp)
add_executable(pdremove.exe
        diary.cpp
        diary.h
        diarylist.cpp
        diarylist.h
        pdremove.cpp)
