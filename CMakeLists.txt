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

add_subdirectory(kfr)

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} AudioFile)
target_link_libraries(${PROJECT_NAME} kfr)
target_link_libraries(${PROJECT_NAME} kfr_io)
target_link_libraries(${PROJECT_NAME} kfr_dft)
