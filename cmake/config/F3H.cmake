set(STM32CUBE_TARGET STM32F303K8TX CACHE STRING "STM32 target")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE BOOL "Export compile commands")

set(SYOCH_ROBOTICS_TARGET "STM32 HAL" CACHE STRING "Thread implementation")
set(EMULATION_ENABLED OFF CACHE STRING "Enable emulation")



include(/usr/share/robotics/cmake/STM32Cube/toolchain.cmake)
# include(/workspaces/NHK2025A/CMake/STM32Cube/toolchain.cmake)
