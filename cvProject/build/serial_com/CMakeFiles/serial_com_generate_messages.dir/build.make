# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = /home/sentinel/ROSWorkspace/cvProject/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sentinel/ROSWorkspace/cvProject/build

# Utility rule file for serial_com_generate_messages.

# Include the progress variables for this target.
include serial_com/CMakeFiles/serial_com_generate_messages.dir/progress.make

serial_com_generate_messages: serial_com/CMakeFiles/serial_com_generate_messages.dir/build.make

.PHONY : serial_com_generate_messages

# Rule to build all files generated by this target.
serial_com/CMakeFiles/serial_com_generate_messages.dir/build: serial_com_generate_messages

.PHONY : serial_com/CMakeFiles/serial_com_generate_messages.dir/build

serial_com/CMakeFiles/serial_com_generate_messages.dir/clean:
	cd /home/sentinel/ROSWorkspace/cvProject/build/serial_com && $(CMAKE_COMMAND) -P CMakeFiles/serial_com_generate_messages.dir/cmake_clean.cmake
.PHONY : serial_com/CMakeFiles/serial_com_generate_messages.dir/clean

serial_com/CMakeFiles/serial_com_generate_messages.dir/depend:
	cd /home/sentinel/ROSWorkspace/cvProject/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sentinel/ROSWorkspace/cvProject/src /home/sentinel/ROSWorkspace/cvProject/src/serial_com /home/sentinel/ROSWorkspace/cvProject/build /home/sentinel/ROSWorkspace/cvProject/build/serial_com /home/sentinel/ROSWorkspace/cvProject/build/serial_com/CMakeFiles/serial_com_generate_messages.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : serial_com/CMakeFiles/serial_com_generate_messages.dir/depend

