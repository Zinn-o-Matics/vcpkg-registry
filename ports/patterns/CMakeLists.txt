cmake_minimum_required(VERSION 3.26)

# Read windows registry Current User Path env variable
cmake_host_system_information(RESULT Path QUERY WINDOWS_REGISTRY "HKCU\\Environment" VALUE "Path")
set(ProgamPathBackup "${CMAKE_PROGRAM_PATH}")
set(CMAKE_PROGRAM_PATH "${Path}") # this has to be here in 3.26

# let cmake find cargo in the path
find_program(Cargo cargo PATHS "${Path}")

set(CMAKE_PROGRAM_PATH "${ProgamPathBackup}") # cleanup after myself

if (NOT Cargo)
    message(FATAL_ERROR "Rust cargo not found, please add it to your CurrentUser Environment Path variable!")
endif ()

# Run cargo.exe build -r in compile step.
add_custom_command(
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/target/release/patterns_sys.lib
        COMMAND ${Cargo} build -r
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/sys
)

add_custom_target(patterns ALL DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/target/release/patterns_sys.lib)

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/target/release/patterns_sys.lib DESTINATION lib)
