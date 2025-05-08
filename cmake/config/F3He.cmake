set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
  /usr/share/robotics/cmake/STM32Cube/cmake
)
set(STM32CUBE_TARGET STM32F303K8TX)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(SYOCH_ROBOTICS_TARGET "STM32 HAL" CACHE STRING "Thread implementation")
set(EMULATION_ENABLED ON CACHE STRING "Enable emulation")



# include(/usr/share/robotics/cmake/STM32Cube/toolchain-emu.cmake)
include(/workspaces/NHK2025A/CMake/STM32Cube/toolchain-emu.cmake)
include(stm32cube)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__ASM='if(0) asm'")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D__ASM='if(0) asm'")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -D__ASM='if(0) asm'")