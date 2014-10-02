# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/BCAMATH/mfernandez/reduced-flipping-GSHMC

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/BCAMATH/mfernandez/reduced-flipping-GSHMC

# Include any dependencies generated for this target.
include src/kernel/CMakeFiles/gmxdump.dir/depend.make

# Include the progress variables for this target.
include src/kernel/CMakeFiles/gmxdump.dir/progress.make

# Include the compile flags for this target's objects.
include src/kernel/CMakeFiles/gmxdump.dir/flags.make

src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o: src/kernel/CMakeFiles/gmxdump.dir/flags.make
src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o: src/kernel/gmxdump.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o"
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/gmxdump.dir/gmxdump.c.o   -c /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/gmxdump.c

src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gmxdump.dir/gmxdump.c.i"
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/gmxdump.c > CMakeFiles/gmxdump.dir/gmxdump.c.i

src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gmxdump.dir/gmxdump.c.s"
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/gmxdump.c -o CMakeFiles/gmxdump.dir/gmxdump.c.s

src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o.requires:
.PHONY : src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o.requires

src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o.provides: src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o.requires
	$(MAKE) -f src/kernel/CMakeFiles/gmxdump.dir/build.make src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o.provides.build
.PHONY : src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o.provides

src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o.provides.build: src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o

# Object files for target gmxdump
gmxdump_OBJECTS = \
"CMakeFiles/gmxdump.dir/gmxdump.c.o"

# External object files for target gmxdump
gmxdump_EXTERNAL_OBJECTS =

src/kernel/gmxdump_d_mpibull_gshmc: src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o
src/kernel/gmxdump_d_mpibull_gshmc: src/kernel/CMakeFiles/gmxdump.dir/build.make
src/kernel/gmxdump_d_mpibull_gshmc: src/kernel/libgmxpreprocess_d_mpibull_gshmc.so.6
src/kernel/gmxdump_d_mpibull_gshmc: src/mdlib/libmd_d_mpibull_gshmc.so.6
src/kernel/gmxdump_d_mpibull_gshmc: src/gmxlib/libgmx_d_mpibull_gshmc.so.6
src/kernel/gmxdump_d_mpibull_gshmc: /usr/lib/x86_64-linux-gnu/libfftw3.a
src/kernel/gmxdump_d_mpibull_gshmc: src/kernel/CMakeFiles/gmxdump.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable gmxdump_d_mpibull_gshmc"
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gmxdump.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/kernel/CMakeFiles/gmxdump.dir/build: src/kernel/gmxdump_d_mpibull_gshmc
.PHONY : src/kernel/CMakeFiles/gmxdump.dir/build

src/kernel/CMakeFiles/gmxdump.dir/requires: src/kernel/CMakeFiles/gmxdump.dir/gmxdump.c.o.requires
.PHONY : src/kernel/CMakeFiles/gmxdump.dir/requires

src/kernel/CMakeFiles/gmxdump.dir/clean:
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel && $(CMAKE_COMMAND) -P CMakeFiles/gmxdump.dir/cmake_clean.cmake
.PHONY : src/kernel/CMakeFiles/gmxdump.dir/clean

src/kernel/CMakeFiles/gmxdump.dir/depend:
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/BCAMATH/mfernandez/reduced-flipping-GSHMC /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel /home/BCAMATH/mfernandez/reduced-flipping-GSHMC /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/CMakeFiles/gmxdump.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/kernel/CMakeFiles/gmxdump.dir/depend
