add_library(ForestLib forest.cpp tree.cpp include/forest.hpp include/tree.hpp)
target_include_directories(ForestLib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_compile_options(ForestLib INTERFACE "$<$<COMPILE_LANGUAGE:Swift>:-cxx-interoperability-mode=default>")