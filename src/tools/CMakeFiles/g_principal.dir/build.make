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
include src/tools/CMakeFiles/g_principal.dir/depend.make

# Include the progress variables for this target.
include src/tools/CMakeFiles/g_principal.dir/progress.make

# Include the compile flags for this target's objects.
include src/tools/CMakeFiles/g_principal.dir/flags.make

src/tools/CMakeFiles/g_principal.dir/g_principal.c.o: src/tools/CMakeFiles/g_principal.dir/flags.make
src/tools/CMakeFiles/g_principal.dir/g_principal.c.o: src/tools/g_principal.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/tools/CMakeFiles/g_principal.dir/g_principal.c.o"
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/tools && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/g_principal.dir/g_principal.c.o   -c /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/tools/g_principal.c

src/tools/CMakeFiles/g_principal.dir/g_principal.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/g_principal.dir/g_principal.c.i"
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/tools && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/tools/g_principal.c > CMakeFiles/g_principal.dir/g_principal.c.i

src/tools/CMakeFiles/g_principal.dir/g_principal.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/g_principal.dir/g_principal.c.s"
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/tools && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/tools/g_principal.c -o CMakeFiles/g_principal.dir/g_principal.c.s

src/tools/CMakeFiles/g_principal.dir/g_principal.c.o.requires:
.PHONY : src/tools/CMakeFiles/g_principal.dir/g_principal.c.o.requires

src/tools/CMakeFiles/g_principal.dir/g_principal.c.o.provides: src/tools/CMakeFiles/g_principal.dir/g_principal.c.o.requires
	$(MAKE) -f src/tools/CMakeFiles/g_principal.dir/build.make src/tools/CMakeFiles/g_principal.dir/g_principal.c.o.provides.build
.PHONY : src/tools/CMakeFiles/g_principal.dir/g_principal.c.o.provides

src/tools/CMakeFiles/g_principal.dir/g_principal.c.o.provides.build: src/tools/CMakeFiles/g_principal.dir/g_principal.c.o

# Object files for target g_principal
g_principal_OBJECTS = \
"CMakeFiles/g_principal.dir/g_principal.c.o"

# External object files for target g_principal
g_principal_EXTERNAL_OBJECTS =

src/tools/g_principal_d_mpibull_gshmc: src/tools/CMakeFiles/g_principal.dir/g_principal.c.o
src/tools/g_principal_d_mpibull_gshmc: src/tools/CMakeFiles/g_principal.dir/build.make
src/tools/g_principal_d_mpibull_gshmc: src/tools/libgmxana_d_mpibull_gshmc.so.6
src/tools/g_principal_d_mpibull_gshmc: src/mdlib/libmd_d_mpibull_gshmc.so.6
src/tools/g_principal_d_mpibull_gshmc: /usr/lib/x86_64-linux-gnu/libfftw3.a
src/tools/g_principal_d_mpibull_gshmc: src/gmxlib/libgmx_d_mpibull_gshmc.so.6
src/tools/g_principal_d_mpibull_gshmc: src/tools/CMakeFiles/g_principal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable g_principal_d_mpibull_gshmc"
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/g_principal.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/tools/CMakeFiles/g_principal.dir/build: src/tools/g_principal_d_mpibull_gshmc
.PHONY : src/tools/CMakeFiles/g_principal.dir/build

src/tools/CMakeFiles/g_principal.dir/requires: src/tools/CMakeFiles/g_principal.dir/g_principal.c.o.requires
.PHONY : src/tools/CMakeFiles/g_principal.dir/requires

src/tools/CMakeFiles/g_principal.dir/clean:
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/tools && $(CMAKE_COMMAND) -P CMakeFiles/g_principal.dir/cmake_clean.cmake
.PHONY : src/tools/CMakeFiles/g_principal.dir/clean

src/tools/CMakeFiles/g_principal.dir/depend:
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/BCAMATH/mfernandez/reduced-flipping-GSHMC /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/tools /home/BCAMATH/mfernandez/reduced-flipping-GSHMC /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/tools /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/tools/CMakeFiles/g_principal.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tools/CMakeFiles/g_principal.dir/depend

