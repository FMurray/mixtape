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

# Include any dependencies generated for this target.
include kfr/CMakeFiles/kfr_io.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include kfr/CMakeFiles/kfr_io.dir/compiler_depend.make

# Include the progress variables for this target.
include kfr/CMakeFiles/kfr_io.dir/progress.make

# Include the compile flags for this target's objects.
include kfr/CMakeFiles/kfr_io.dir/flags.make

kfr/CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.o: kfr/CMakeFiles/kfr_io.dir/flags.make
kfr/CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.o: /Users/forrestmurray/Documents/Projects/mixtape/kfr/include/kfr/io/impl/audiofile-impl.cpp
kfr/CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.o: kfr/CMakeFiles/kfr_io.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object kfr/CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.o"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/kfr && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT kfr/CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.o -MF CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.o.d -o CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.o -c /Users/forrestmurray/Documents/Projects/mixtape/kfr/include/kfr/io/impl/audiofile-impl.cpp

kfr/CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.i"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/kfr && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/forrestmurray/Documents/Projects/mixtape/kfr/include/kfr/io/impl/audiofile-impl.cpp > CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.i

kfr/CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.s"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/kfr && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/forrestmurray/Documents/Projects/mixtape/kfr/include/kfr/io/impl/audiofile-impl.cpp -o CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.s

# Object files for target kfr_io
kfr_io_OBJECTS = \
"CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.o"

# External object files for target kfr_io
kfr_io_EXTERNAL_OBJECTS =

kfr/libkfr_io.dylib: kfr/CMakeFiles/kfr_io.dir/include/kfr/io/impl/audiofile-impl.cpp.o
kfr/libkfr_io.dylib: kfr/CMakeFiles/kfr_io.dir/build.make
kfr/libkfr_io.dylib: kfr/CMakeFiles/kfr_io.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/forrestmurray/Documents/Projects/mixtape/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libkfr_io.dylib"
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/kfr && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kfr_io.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
kfr/CMakeFiles/kfr_io.dir/build: kfr/libkfr_io.dylib
.PHONY : kfr/CMakeFiles/kfr_io.dir/build

kfr/CMakeFiles/kfr_io.dir/clean:
	cd /Users/forrestmurray/Documents/Projects/mixtape/build/kfr && $(CMAKE_COMMAND) -P CMakeFiles/kfr_io.dir/cmake_clean.cmake
.PHONY : kfr/CMakeFiles/kfr_io.dir/clean

kfr/CMakeFiles/kfr_io.dir/depend:
	cd /Users/forrestmurray/Documents/Projects/mixtape/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/forrestmurray/Documents/Projects/mixtape /Users/forrestmurray/Documents/Projects/mixtape/kfr /Users/forrestmurray/Documents/Projects/mixtape/build /Users/forrestmurray/Documents/Projects/mixtape/build/kfr /Users/forrestmurray/Documents/Projects/mixtape/build/kfr/CMakeFiles/kfr_io.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : kfr/CMakeFiles/kfr_io.dir/depend

