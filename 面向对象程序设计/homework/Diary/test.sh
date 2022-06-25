#!/bin/bash
g++ diary.cpp diarylist.cpp pdadd.cpp -o pdadd.exe || exit -1
g++ diary.cpp diarylist.cpp pdshow.cpp -o pdshow.exe || exit -1
g++ diary.cpp diarylist.cpp pdlist.cpp -o pdlist.exe || exit -1
g++ diary.cpp diarylist.cpp pdremove.cpp -o pdremove.exe || exit -1
./pdlist.exe 2012.01.01 2050.12.31 
echo "---------------------------------------"
./pdshow.exe 2021.06.18
echo "---------------------------------------"
./pdlist.exe
echo "---------------------------------------"
echo -e "2021.11.15\nwe can add a diary by means of pipeline.\n." | ./pdadd.exe
./pdshow.exe 2021.11.15
echo "---------------------------------------"
echo -e "2022.04.05\nwe can add a diary by means of redirection.\n." > a.txt 
cat a.txt | ./pdadd.exe
./pdshow.exe 2022.04.05
echo "---------------------------------------"
./pdremove 2025.05.31
if [ $? -ne 0 ];then
    echo "no such a diary"
else
    echo "remove success"
fi
