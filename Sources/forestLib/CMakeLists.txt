add_library(forestLib SHARED forest.cpp tree.cpp include/forest.hpp include/tree.hpp)
target_include_directories(forestLib PUBLIC ${CMAKE_SOURCE_DIR}/Sources/forestLib/include)
