# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/lenovo/Desktop/计原/磁盘读写

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/lenovo/Desktop/计原/磁盘读写/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Disk.h.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Disk.h.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Disk.h.dir/flags.make

CMakeFiles/Disk.h.dir/main.cpp.o: CMakeFiles/Disk.h.dir/flags.make
CMakeFiles/Disk.h.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/lenovo/Desktop/计原/磁盘读写/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Disk.h.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Disk.h.dir/main.cpp.o -c /mnt/c/Users/lenovo/Desktop/计原/磁盘读写/main.cpp

CMakeFiles/Disk.h.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Disk.h.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/lenovo/Desktop/计原/磁盘读写/main.cpp > CMakeFiles/Disk.h.dir/main.cpp.i

CMakeFiles/Disk.h.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Disk.h.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/lenovo/Desktop/计原/磁盘读写/main.cpp -o CMakeFiles/Disk.h.dir/main.cpp.s

# Object files for target Disk.h
Disk_h_OBJECTS = \
"CMakeFiles/Disk.h.dir/main.cpp.o"

# External object files for target Disk.h
Disk_h_EXTERNAL_OBJECTS =

Disk.h: CMakeFiles/Disk.h.dir/main.cpp.o
Disk.h: CMakeFiles/Disk.h.dir/build.make
Disk.h: CMakeFiles/Disk.h.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/lenovo/Desktop/计原/磁盘读写/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Disk.h"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Disk.h.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Disk.h.dir/build: Disk.h

.PHONY : CMakeFiles/Disk.h.dir/build

CMakeFiles/Disk.h.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Disk.h.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Disk.h.dir/clean

CMakeFiles/Disk.h.dir/depend:
	cd /mnt/c/Users/lenovo/Desktop/计原/磁盘读写/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/lenovo/Desktop/计原/磁盘读写 /mnt/c/Users/lenovo/Desktop/计原/磁盘读写 /mnt/c/Users/lenovo/Desktop/计原/磁盘读写/cmake-build-debug /mnt/c/Users/lenovo/Desktop/计原/磁盘读写/cmake-build-debug /mnt/c/Users/lenovo/Desktop/计原/磁盘读写/cmake-build-debug/CMakeFiles/Disk.h.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Disk.h.dir/depend

