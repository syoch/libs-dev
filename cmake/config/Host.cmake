
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(SYOCH_ROBOTICS_TARGET "Emulation" CACHE STRING "Thread implementation")
set(EMULATION_ENABLED OFF CACHE STRING "Enable emulation")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
  /usr/arm-none-eabi/share/cmake
  /usr/arm-none-eabi/lib/cmake
  /usr/share/robotics/cmake/STM32Cube/cmake
)

set(MY_COMPILE_FLAGS "-ffunction-sections -fdata-sections -fexceptions -fshort-enums -O0 -g -rdynamic")

set(CMAKE_C_FLAGS "${MY_COMPILE_FLAGS}")
set(CMAKE_CXX_FLAGS "${MY_COMPILE_FLAGS} -fno-threadsafe-statics -fuse-cxa-atexit")
set(CMAKE_ASM_FLAGS "-x assembler-with-cpp")
set(CMAKE_EXE_LINKER_FLAGS "-Wl,--gc-sections -lc -lm")
