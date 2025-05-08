cmake_minimum_required(VERSION 3.25)
cmake_policy(VERSION 3.25)

add_compile_options(-fdiagnostics-color=always)
set(CMAKE_COLOR_DIAGNOSTICS ON)

set(PROJECT_PREFIX "N25A")

function(define_sub_project name)
  ExternalProject_Add(
    ${name}
    PREFIX ${CMAKE_BINARY_DIR}/${name}
    SOURCE_DIR ${CMAKE_SOURCE_DIR}
    CMAKE_ARGS
      -DCMAKE_TOOLCHAIN_FILE=${CMAKE_SOURCE_DIR}/cmake/config/${name}.cmake
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
      -DCMAKE_SUB_PROJECT=${name}
    BUILD_ALWAYS TRUE
    USES_TERMINAL_DOWNLOAD        ON
    USES_TERMINAL_UPDATE          ON
    USES_TERMINAL_CONFIGURE       ON
    USES_TERMINAL_BUILD           ON
    USES_TERMINAL_TEST            OFF
    USES_TERMINAL_INSTALL         OFF
    INSTALL_COMMAND ""
  )
endfunction()

include(ExternalProject)
if(NOT CMAKE_SUB_PROJECT)
  project(${PROJECT_PREFIX}-Root)

  define_sub_project(F4H)
  define_sub_project(F3H)
  # define_sub_project(F3He)
  define_sub_project(F4M)
  define_sub_project(Host)
  # define_sub_project(ESP32)
  return()
endif()



enable_testing()
project(${PROJECT_PREFIX}-${CMAKE_SUB_PROJECT})
enable_language(C CXX ASM)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fconcepts-diagnostics-depth=5")

# sub-project specific settings
if("${CMAKE_SUB_PROJECT}" STREQUAL "F3H" OR "${CMAKE_SUB_PROJECT}" STREQUAL "F3He" OR "${CMAKE_SUB_PROJECT}" STREQUAL "F4H")
  include(stm32cube)
endif()

# common sub-directories
add_subdirectory(lib)
add_subdirectory(modules)
add_subdirectory(src)