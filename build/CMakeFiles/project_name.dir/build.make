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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/forrestmurray/Documents/Projects/mixtape

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/forrestmurray/Documents/Projects/mixtape/build

# Utility rule file for project_name.

# Include any custom commands dependencies for this target.
include CMakeFiles/project_name.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/project_name.dir/progress.make

CMakeFiles/project_name: CMakeFiles/project_name-complete

CMakeFiles/project_name-complete: project_name-prefix/src/project_name-stamp/project_name-install
CMakeFiles/project_name-complete: project_name-prefix/src/project_name-stamp/project_name-mkdir
CMakeFiles/project_name-complete: project_name-prefix/src/project_name-stamp/project_name-download
CMakeFiles/project_name-complete: project_name-prefix/src/project_name-stamp/project_name-update
CMakeFiles/project_name-complete: project_name-prefix/src/project_name-stamp/project_name-patch
CMakeFiles/project_name-complete: project_name-prefix/src/project_name-stamp/project_name-configure
CMakeFiles/project_name-complete: project_name-prefix/src/project_name-stamp/project_name-build
CMakeFiles/project_name-complete: project_name-prefix/src/project_name-stamp/project_name-install
CMakeFiles/project_name-complete: project_name-prefix/src/project_name-stamp/project_name-test
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'project_name'"
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E make_directory /Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles/project_name-complete
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp/project_name-done

project_name-prefix/src/project_name-stamp/project_name-build: project_name-prefix/src/project_name-stamp/project_name-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No build step for 'project_name'"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E echo_append
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp/project_name-build

project_name-prefix/src/project_name-stamp/project_name-configure: project_name-prefix/tmp/project_name-cfgcmd.txt
project_name-prefix/src/project_name-stamp/project_name-configure: project_name-prefix/src/project_name-stamp/project_name-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "No configure step for 'project_name'"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E echo_append
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp/project_name-configure

project_name-prefix/src/project_name-stamp/project_name-download: project_name-prefix/src/project_name-stamp/project_name-gitinfo.txt
project_name-prefix/src/project_name-stamp/project_name-download: project_name-prefix/src/project_name-stamp/project_name-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'project_name'"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/dependencies && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -P /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/tmp/project_name-gitclone.cmake
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/dependencies && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp/project_name-download

project_name-prefix/src/project_name-stamp/project_name-install: project_name-prefix/src/project_name-stamp/project_name-build
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No install step for 'project_name'"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E echo_append
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp/project_name-install

project_name-prefix/src/project_name-stamp/project_name-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'project_name'"
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -Dcfgdir= -P /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/tmp/project_name-mkdirs.cmake
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp/project_name-mkdir

project_name-prefix/src/project_name-stamp/project_name-patch: project_name-prefix/src/project_name-stamp/project_name-patch-info.txt
project_name-prefix/src/project_name-stamp/project_name-patch: project_name-prefix/src/project_name-stamp/project_name-update
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'project_name'"
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E echo_append
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp/project_name-patch

project_name-prefix/src/project_name-stamp/project_name-test: project_name-prefix/src/project_name-stamp/project_name-install
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No test step for 'project_name'"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E echo_append
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp/project_name-test

project_name-prefix/src/project_name-stamp/project_name-update: project_name-prefix/tmp/project_name-gitupdate.cmake
project_name-prefix/src/project_name-stamp/project_name-update: project_name-prefix/src/project_name-stamp/project_name-update-info.txt
project_name-prefix/src/project_name-stamp/project_name-update: project_name-prefix/src/project_name-stamp/project_name-download
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Performing update step for 'project_name'"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/dependencies/repo && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -Dcan_fetch=YES -P /Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/tmp/project_name-gitupdate.cmake

project_name: CMakeFiles/project_name
project_name: CMakeFiles/project_name-complete
project_name: project_name-prefix/src/project_name-stamp/project_name-build
project_name: project_name-prefix/src/project_name-stamp/project_name-configure
project_name: project_name-prefix/src/project_name-stamp/project_name-download
project_name: project_name-prefix/src/project_name-stamp/project_name-install
project_name: project_name-prefix/src/project_name-stamp/project_name-mkdir
project_name: project_name-prefix/src/project_name-stamp/project_name-patch
project_name: project_name-prefix/src/project_name-stamp/project_name-test
project_name: project_name-prefix/src/project_name-stamp/project_name-update
project_name: CMakeFiles/project_name.dir/build.make
.PHONY : project_name

# Rule to build all files generated by this target.
CMakeFiles/project_name.dir/build: project_name
.PHONY : CMakeFiles/project_name.dir/build

CMakeFiles/project_name.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/project_name.dir/cmake_clean.cmake
.PHONY : CMakeFiles/project_name.dir/clean

CMakeFiles/project_name.dir/depend:
	cd /Users/forrestmurray/Documents/Projects/mixtape/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/forrestmurray/Documents/Projects/mixtape /Users/forrestmurray/Documents/Projects/mixtape /Users/forrestmurray/Documents/Projects/mixtape/build /Users/forrestmurray/Documents/Projects/mixtape/build /Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles/project_name.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/project_name.dir/depend
