cmake_minimum_required(VERSION 3.15)
project(
  mixtape
  VERSION 0.1.0
  DESCRIPTION "Read and write Spotify playlists to cassette tapes"
  LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)
FetchContent_Declare(
  AudioFile
  GIT_REPOSITORY https://github.com/adamstark/AudioFile.git
  GIT_TAG master # or you might want to lock to a specific release tag
)
FetchContent_MakeAvailable(AudioFile)

FetchContent_Declare(
  json
  GIT_REPOSITORY https://github.com/nlohmann/json.git
  GIT_TAG master
)

FetchContent_GetProperties(json)

if(NOT json_POPULATED)
  FetchContent_Populate(json)
  add_subdirectory(${json_SOURCE_DIR} ${json_BINARY_DIR} EXCLUDE_FROM_ALL)
endif()

FetchContent_Declare(cpr GIT_REPOSITORY https://github.com/libcpr/cpr.git
  GIT_TAG 0817715923c9705e68994eb52ef9df3f6845beba) # The commit hash for 1.10.x. Replace with the latest from: https://github.com/libcpr/cpr/releases
FetchContent_MakeAvailable(cpr)

FetchContent_Declare(httplib GIT_REPOSITORY https://github.com/yhirose/cpp-httplib.git
  GIT_TAG master)
FetchContent_MakeAvailable(httplib)

FetchContent_Declare(yaml-cpp GIT_REPOSITORY https://github.com/jbeder/yaml-cpp.git
  GIT_TAG master)
FetchContent_MakeAvailable(yaml-cpp)

add_subdirectory(kfr)

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} AudioFile)
target_link_libraries(${PROJECT_NAME} kfr)
target_link_libraries(${PROJECT_NAME} kfr_io)
target_link_libraries(${PROJECT_NAME} kfr_dft)
target_link_libraries(${PROJECT_NAME} nlohmann_json::nlohmann_json)
target_link_libraries(${PROJECT_NAME} cpr::cpr)
target_link_libraries(${PROJECT_NAME} httplib::httplib)
target_link_libraries(${PROJECT_NAME} yaml-cpp)