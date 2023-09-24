cmake_minimum_required(VERSION 3.26)

cmake_host_system_information(RESULT baum QUERY WINDOWS_REGISTRY "HKCU\\Environment" VALUE "Path")

find_program(Cargo cargo HINTS ${baum})

if (NOT Cargo)
    message(FATAL_ERROR "Rust' cargo not found, please add it to your CurrentUser Environment Path variable!")
endif ()

add_custom_command(
        OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/target/release/patterns_sys.lib
        COMMAND ${Cargo} build -r
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/sys
)

add_custom_target(patterns ALL DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/target/release/patterns_sys.lib)

install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/target/release/patterns_sys.lib DESTINATION lib)
