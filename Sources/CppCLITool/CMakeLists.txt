add_executable(CppCLITool main.cpp)
target_link_libraries(CppCLITool PRIVATE SwiftLib)
target_include_directories(CppCLITool PUBLIC "${CMAKE_BINARY_DIR}/Sources/SwiftLib/include")