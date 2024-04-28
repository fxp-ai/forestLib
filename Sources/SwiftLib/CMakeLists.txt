include(CheckCompilerFlag)

function(_swift_generate_cxx_header_target target module header)
  cmake_parse_arguments(ARG "" "" "SOURCES;SEARCH_PATHS;DEPENDS" ${ARGN})
  if(NOT ARG_SOURCES)
    message(FATAL_ERROR "No sources provided to 'swift_generate_cxx_header_target'")
  endif()

  if(ARG_SEARCH_PATHS)
    list(TRANSFORM ARG_SEARCH_PATHS PREPEND "-I")
  endif()

  if(APPLE)
    set(SDK_FLAGS "-sdk" "${CMAKE_OSX_SYSROOT}")
  elseif(WIN32)
    set(SDK_FLAGS "-sdk" "$ENV{SDKROOT}")
  endif()

  add_custom_command(
    OUTPUT
      "${header}"
    COMMAND
      ${CMAKE_Swift_COMPILER} -frontend -typecheck
      ${ARG_SEARCH_PATHS}
      ${ARG_SOURCES}
      ${SDK_FLAGS}
      -module-name "${module}"
      -cxx-interoperability-mode=default
      -emit-clang-header-path "${header}"
    DEPENDS
      ${ARG_DEPENDS}
    COMMENT
      "Generating '${header}'"
  )

  add_custom_target("${target}" DEPENDS "${header}")
endfunction()

_swift_generate_cxx_header_target(
  swiftlib_swift_h
  SwiftLib
  "${CMAKE_CURRENT_BINARY_DIR}/include/SwiftLib/SwiftLib-Swift.h"
  SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/math.swift")


add_library(SwiftLib math.swift)
add_dependencies(SwiftLib swiftlib_swift_h)
