cmake_minimum_required(VERSION 3.26)

project(swift-cpp LANGUAGES Swift CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_CXX_EXTENSIONS TRUE)

add_subdirectory(Sources)