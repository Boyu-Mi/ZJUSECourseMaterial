cmake_minimum_required(VERSION 3.0)

PROJECT(Student)

INCLUDE_DIRECTORIES(include)
INCLUDE_DIRECTORIES(~/Desktop/build/)

AUX_SOURCE_DIRECTORY(src DIR_SRCS)

SET(CMAKE_CXX_STANDARD 11)

add_executable(student ${DIR_SRCS})

