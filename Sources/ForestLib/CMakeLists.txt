add_library(ForestLib SHARED forest.cpp tree.cpp include/forest.hpp include/tree.hpp)
target_include_directories(ForestLib PUBLIC ${CMAKE_SOURCE_DIR}/Sources/ForestLib/include)
