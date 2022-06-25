cmake_minimum_required(VERSION 3.16)
project(vector)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(vector
        main.cpp
        Vector.h)
