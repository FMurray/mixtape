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

# Utility rule file for AudioFile.

# Include any custom commands dependencies for this target.
include CMakeFiles/AudioFile.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/AudioFile.dir/progress.make

CMakeFiles/AudioFile: CMakeFiles/AudioFile-complete

CMakeFiles/AudioFile-complete: AudioFile-prefix/src/AudioFile-stamp/AudioFile-install
CMakeFiles/AudioFile-complete: AudioFile-prefix/src/AudioFile-stamp/AudioFile-mkdir
CMakeFiles/AudioFile-complete: AudioFile-prefix/src/AudioFile-stamp/AudioFile-download
CMakeFiles/AudioFile-complete: AudioFile-prefix/src/AudioFile-stamp/AudioFile-update
CMakeFiles/AudioFile-complete: AudioFile-prefix/src/AudioFile-stamp/AudioFile-patch
CMakeFiles/AudioFile-complete: AudioFile-prefix/src/AudioFile-stamp/AudioFile-configure
CMakeFiles/AudioFile-complete: AudioFile-prefix/src/AudioFile-stamp/AudioFile-build
CMakeFiles/AudioFile-complete: AudioFile-prefix/src/AudioFile-stamp/AudioFile-install
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'AudioFile'"
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E make_directory /Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles/AudioFile-complete
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-stamp/AudioFile-done

AudioFile-prefix/src/AudioFile-stamp/AudioFile-build: AudioFile-prefix/src/AudioFile-stamp/AudioFile-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing build step for 'AudioFile'"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-build && $(MAKE)
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-stamp/AudioFile-build

AudioFile-prefix/src/AudioFile-stamp/AudioFile-configure: AudioFile-prefix/tmp/AudioFile-cfgcmd.txt
AudioFile-prefix/src/AudioFile-stamp/AudioFile-configure: AudioFile-prefix/src/AudioFile-stamp/AudioFile-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Performing configure step for 'AudioFile'"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -DCMAKE_INSTALL_PREFIX=/Users/forrestmurray/Documents/Projects/mixtape/build/audiofile_install "-GUnix Makefiles" -S /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile -B /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-build
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-stamp/AudioFile-configure

AudioFile-prefix/src/AudioFile-stamp/AudioFile-download: AudioFile-prefix/src/AudioFile-stamp/AudioFile-gitinfo.txt
AudioFile-prefix/src/AudioFile-stamp/AudioFile-download: AudioFile-prefix/src/AudioFile-stamp/AudioFile-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'AudioFile'"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -P /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/tmp/AudioFile-gitclone.cmake
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-stamp/AudioFile-download

AudioFile-prefix/src/AudioFile-stamp/AudioFile-install: AudioFile-prefix/src/AudioFile-stamp/AudioFile-build
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No install step for 'AudioFile'"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E echo_append
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-build && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-stamp/AudioFile-install

AudioFile-prefix/src/AudioFile-stamp/AudioFile-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'AudioFile'"
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -Dcfgdir= -P /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/tmp/AudioFile-mkdirs.cmake
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-stamp/AudioFile-mkdir

AudioFile-prefix/src/AudioFile-stamp/AudioFile-patch: AudioFile-prefix/src/AudioFile-stamp/AudioFile-patch-info.txt
AudioFile-prefix/src/AudioFile-stamp/AudioFile-patch: AudioFile-prefix/src/AudioFile-stamp/AudioFile-update
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'AudioFile'"
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E echo_append
	/opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -E touch /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-stamp/AudioFile-patch

AudioFile-prefix/src/AudioFile-stamp/AudioFile-update: AudioFile-prefix/tmp/AudioFile-gitupdate.cmake
AudioFile-prefix/src/AudioFile-stamp/AudioFile-update: AudioFile-prefix/src/AudioFile-stamp/AudioFile-update-info.txt
AudioFile-prefix/src/AudioFile-stamp/AudioFile-update: AudioFile-prefix/src/AudioFile-stamp/AudioFile-download
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing update step for 'AudioFile'"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile && /opt/homebrew/Cellar/cmake/3.27.7/bin/cmake -Dcan_fetch=YES -P /Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/tmp/AudioFile-gitupdate.cmake

AudioFile: AudioFile-prefix/src/AudioFile-stamp/AudioFile-build
AudioFile: AudioFile-prefix/src/AudioFile-stamp/AudioFile-configure
AudioFile: AudioFile-prefix/src/AudioFile-stamp/AudioFile-download
AudioFile: AudioFile-prefix/src/AudioFile-stamp/AudioFile-install
AudioFile: AudioFile-prefix/src/AudioFile-stamp/AudioFile-mkdir
AudioFile: AudioFile-prefix/src/AudioFile-stamp/AudioFile-patch
AudioFile: AudioFile-prefix/src/AudioFile-stamp/AudioFile-update
AudioFile: CMakeFiles/AudioFile
AudioFile: CMakeFiles/AudioFile-complete
AudioFile: CMakeFiles/AudioFile.dir/build.make
.PHONY : AudioFile

# Rule to build all files generated by this target.
CMakeFiles/AudioFile.dir/build: AudioFile
.PHONY : CMakeFiles/AudioFile.dir/build

CMakeFiles/AudioFile.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/AudioFile.dir/cmake_clean.cmake
.PHONY : CMakeFiles/AudioFile.dir/clean

CMakeFiles/AudioFile.dir/depend:
	cd /Users/forrestmurray/Documents/Projects/mixtape/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/forrestmurray/Documents/Projects/mixtape /Users/forrestmurray/Documents/Projects/mixtape /Users/forrestmurray/Documents/Projects/mixtape/build /Users/forrestmurray/Documents/Projects/mixtape/build /Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles/AudioFile.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/AudioFile.dir/depend

