# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build

# Include any dependencies generated for this target.
include CMakeFiles/dLOGIC_ULS.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/dLOGIC_ULS.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/dLOGIC_ULS.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/dLOGIC_ULS.dir/flags.make

dLOGIC_ULS_autogen/timestamp: /usr/lib/qt5/bin/moc
dLOGIC_ULS_autogen/timestamp: /usr/lib/qt5/bin/uic
dLOGIC_ULS_autogen/timestamp: CMakeFiles/dLOGIC_ULS.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC and UIC for target dLOGIC_ULS"
	/usr/bin/cmake -E cmake_autogen /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build/CMakeFiles/dLOGIC_ULS_autogen.dir/AutogenInfo.json ""
	/usr/bin/cmake -E touch /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build/dLOGIC_ULS_autogen/timestamp

CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.o: CMakeFiles/dLOGIC_ULS.dir/flags.make
CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.o: dLOGIC_ULS_autogen/mocs_compilation.cpp
CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.o: CMakeFiles/dLOGIC_ULS.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.o -MF CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.o -c /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build/dLOGIC_ULS_autogen/mocs_compilation.cpp

CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build/dLOGIC_ULS_autogen/mocs_compilation.cpp > CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.i

CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build/dLOGIC_ULS_autogen/mocs_compilation.cpp -o CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.s

CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.o: CMakeFiles/dLOGIC_ULS.dir/flags.make
CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.o: /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/src/helper.cpp
CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.o: CMakeFiles/dLOGIC_ULS.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.o -MF CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.o.d -o CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.o -c /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/src/helper.cpp

CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/src/helper.cpp > CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.i

CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/src/helper.cpp -o CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.s

CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.o: CMakeFiles/dLOGIC_ULS.dir/flags.make
CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.o: /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/src/main.cpp
CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.o: CMakeFiles/dLOGIC_ULS.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.o -MF CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.o.d -o CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.o -c /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/src/main.cpp

CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/src/main.cpp > CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.i

CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/src/main.cpp -o CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.s

# Object files for target dLOGIC_ULS
dLOGIC_ULS_OBJECTS = \
"CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.o" \
"CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.o"

# External object files for target dLOGIC_ULS
dLOGIC_ULS_EXTERNAL_OBJECTS =

dLOGIC_ULS: CMakeFiles/dLOGIC_ULS.dir/dLOGIC_ULS_autogen/mocs_compilation.cpp.o
dLOGIC_ULS: CMakeFiles/dLOGIC_ULS.dir/src/helper.cpp.o
dLOGIC_ULS: CMakeFiles/dLOGIC_ULS.dir/src/main.cpp.o
dLOGIC_ULS: CMakeFiles/dLOGIC_ULS.dir/build.make
dLOGIC_ULS: /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5.15.13
dLOGIC_ULS: /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5.15.13
dLOGIC_ULS: /usr/lib/x86_64-linux-gnu/libQt5Core.so.5.15.13
dLOGIC_ULS: CMakeFiles/dLOGIC_ULS.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable dLOGIC_ULS"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dLOGIC_ULS.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/dLOGIC_ULS.dir/build: dLOGIC_ULS
.PHONY : CMakeFiles/dLOGIC_ULS.dir/build

CMakeFiles/dLOGIC_ULS.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dLOGIC_ULS.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dLOGIC_ULS.dir/clean

CMakeFiles/dLOGIC_ULS.dir/depend: dLOGIC_ULS_autogen/timestamp
	cd /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build /home/ubuntu/work/builder/dLOGIC/cpp-ubuntu-app/build/CMakeFiles/dLOGIC_ULS.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/dLOGIC_ULS.dir/depend

