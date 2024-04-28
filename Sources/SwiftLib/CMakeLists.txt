include(CheckCompilerFlag)

function(SwiftGenerateCxxHeaderTarget target module header)
  cmake_parse_arguments(ARG "" "" "SOURCES;SEARCH_PATHS;DEPENDS" ${ARGN})
  if(NOT ARG_SOURCES)
    message(FATAL_ERROR "No sources provided to 'SwiftGenerateCxxHeaderTarget'")
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

SwiftGenerateCxxHeaderTarget(
  SwiftLib_Swift_H
  SwiftLib
  "${CMAKE_CURRENT_BINARY_DIR}/include/SwiftLib/SwiftLib-Swift.h"
  SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/math.swift")


add_library(SwiftLib math.swift)
target_include_directories(SwiftLib INTERFACE "${CMAKE_CURRENT_BINARY_DIR}/include")
add_dependencies(SwiftLib SwiftLib_Swift_H)
