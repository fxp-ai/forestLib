add_library(forestLib SHARED forest.cpp tree.cpp include/forest.h include/tree.h)
target_include_directories(forestLib PUBLIC ${CMAKE_SOURCE_DIR}/Sources/forestLib/include)