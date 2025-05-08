
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(SYOCH_ROBOTICS_TARGET "ESP" CACHE STRING "Thread implementation")
set(EMULATION_ENABLED OFF CACHE STRING "Enable emulation")

set(EXTRA_COMPONENT_DIRS "${CMAKE_SOURCE_DIR}/src-esp32")
set(COMPONENTS esp32-rw)
include($ENV{IDF_PATH}/tools/cmake/project.cmake)