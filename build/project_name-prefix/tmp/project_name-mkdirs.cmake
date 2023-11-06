# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/forrestmurray/Documents/Projects/mixtape/build/dependencies/repo"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-build"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/tmp"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src"
  "/Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/forrestmurray/Documents/Projects/mixtape/build/project_name-prefix/src/project_name-stamp${cfgdir}") # cfgdir has leading slash
endif()
