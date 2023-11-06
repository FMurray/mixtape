# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-build"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/tmp"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-stamp"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/forrestmurray/Documents/Projects/mixtape/build/AudioFile-prefix/src/AudioFile-stamp${cfgdir}") # cfgdir has leading slash
endif()
