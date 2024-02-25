cmake_minimum_required(VERSION 3.23)

project(Nexus)

add_library(${PROJECT_NAME} INTERFACE)
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

target_include_directories(
    ${PROJECT_NAME}
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include/${PROJECT_NAME}>
)

target_sources(${PROJECT_NAME} INTERFACE
    FILE_SET HEADERS
    FILES
        Nexus.h
)

install(TARGETS ${PROJECT_NAME}
    FILE_SET HEADERS
    DESTINATION include/${PROJECT_NAME}
)
