add_executable(SwiftCLITool main.swift)
target_link_libraries(SwiftCLITool PRIVATE ForestLib)
target_compile_options(SwiftCLITool PRIVATE "-cxx-interoperability-mode=default")
