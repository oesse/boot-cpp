cmake_minimum_required(VERSION 3.10)
project(ceplact)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)


set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


add_library(server STATIC src/server.cpp)
target_include_directories(server PUBLIC src)


include(Testing)
include(AddTests)

add_tests(server
  DIRECTORY test
  TEST_CASES
  server_test.cpp)
