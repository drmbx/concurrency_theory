# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

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
CMAKE_SOURCE_DIR = /home/drmbx/remote/task2/2.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/drmbx/remote/task2/2.1/build

# Include any dependencies generated for this target.
include CMakeFiles/matrix_vector_product.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/matrix_vector_product.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/matrix_vector_product.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/matrix_vector_product.dir/flags.make

CMakeFiles/matrix_vector_product.dir/source/main.c.o: CMakeFiles/matrix_vector_product.dir/flags.make
CMakeFiles/matrix_vector_product.dir/source/main.c.o: /home/drmbx/remote/task2/2.1/source/main.c
CMakeFiles/matrix_vector_product.dir/source/main.c.o: CMakeFiles/matrix_vector_product.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/drmbx/remote/task2/2.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/matrix_vector_product.dir/source/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/matrix_vector_product.dir/source/main.c.o -MF CMakeFiles/matrix_vector_product.dir/source/main.c.o.d -o CMakeFiles/matrix_vector_product.dir/source/main.c.o -c /home/drmbx/remote/task2/2.1/source/main.c

CMakeFiles/matrix_vector_product.dir/source/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/matrix_vector_product.dir/source/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/drmbx/remote/task2/2.1/source/main.c > CMakeFiles/matrix_vector_product.dir/source/main.c.i

CMakeFiles/matrix_vector_product.dir/source/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/matrix_vector_product.dir/source/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/drmbx/remote/task2/2.1/source/main.c -o CMakeFiles/matrix_vector_product.dir/source/main.c.s

# Object files for target matrix_vector_product
matrix_vector_product_OBJECTS = \
"CMakeFiles/matrix_vector_product.dir/source/main.c.o"

# External object files for target matrix_vector_product
matrix_vector_product_EXTERNAL_OBJECTS =

matrix_vector_product: CMakeFiles/matrix_vector_product.dir/source/main.c.o
matrix_vector_product: CMakeFiles/matrix_vector_product.dir/build.make
matrix_vector_product: CMakeFiles/matrix_vector_product.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/drmbx/remote/task2/2.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable matrix_vector_product"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/matrix_vector_product.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/matrix_vector_product.dir/build: matrix_vector_product
.PHONY : CMakeFiles/matrix_vector_product.dir/build

CMakeFiles/matrix_vector_product.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/matrix_vector_product.dir/cmake_clean.cmake
.PHONY : CMakeFiles/matrix_vector_product.dir/clean

CMakeFiles/matrix_vector_product.dir/depend:
	cd /home/drmbx/remote/task2/2.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/drmbx/remote/task2/2.1 /home/drmbx/remote/task2/2.1 /home/drmbx/remote/task2/2.1/build /home/drmbx/remote/task2/2.1/build /home/drmbx/remote/task2/2.1/build/CMakeFiles/matrix_vector_product.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/matrix_vector_product.dir/depend
