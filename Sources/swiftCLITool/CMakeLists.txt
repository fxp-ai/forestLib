add_executable(swiftCLITool main.swift)
target_link_libraries(swiftCLITool PRIVATE forestLib)
target_compile_options(swiftCLITool PRIVATE "-cxx-interoperability-mode=default")