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

# Utility rule file for gmx_version.

# Include the progress variables for this target.
include src/gmxlib/CMakeFiles/gmx_version.dir/progress.make

src/gmxlib/CMakeFiles/gmx_version: src/gmxlib/version.c.cmakein
	$(CMAKE_COMMAND) -E cmake_progress_report /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating version information"
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib && /usr/bin/cmake -D Git_EXECUTABLE="/usr/bin/git" -D Git_VERSION="1.7.9.5" -D PROJECT_VERSION="4.5.4" -D PROJECT_SOURCE_DIR="/home/BCAMATH/mfernandez/reduced-flipping-GSHMC" -D VERSION_C_CMAKEIN="/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib/version.c.cmakein" -D VERSION_C_OUT="/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib/version.c" -P /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/cmake/gmxGenerateVersionInfo.cmake

gmx_version: src/gmxlib/CMakeFiles/gmx_version
gmx_version: src/gmxlib/CMakeFiles/gmx_version.dir/build.make
.PHONY : gmx_version

# Rule to build all files generated by this target.
src/gmxlib/CMakeFiles/gmx_version.dir/build: gmx_version
.PHONY : src/gmxlib/CMakeFiles/gmx_version.dir/build

src/gmxlib/CMakeFiles/gmx_version.dir/clean:
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib && $(CMAKE_COMMAND) -P CMakeFiles/gmx_version.dir/cmake_clean.cmake
.PHONY : src/gmxlib/CMakeFiles/gmx_version.dir/clean

src/gmxlib/CMakeFiles/gmx_version.dir/depend:
	cd /home/BCAMATH/mfernandez/reduced-flipping-GSHMC && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/BCAMATH/mfernandez/reduced-flipping-GSHMC /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib /home/BCAMATH/mfernandez/reduced-flipping-GSHMC /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib/CMakeFiles/gmx_version.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/gmxlib/CMakeFiles/gmx_version.dir/depend
