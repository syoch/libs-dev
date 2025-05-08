set(STM32CUBE_TARGET NUCLEO_F446RE)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(MBED_APP_JSON_PATH ${CMAKE_SOURCE_DIR}/mbed_app.json)
set(SYOCH_ROBOTICS_TARGET "Mbed" CACHE STRING "Thread implementation")
set(EMULATION_ENABLED OFF CACHE STRING "Enable emulation")

include(/usr/arm-none-eabi/share/cmake/StaticMbedOSToolchain-NUCLEO_F446RE.cmake)