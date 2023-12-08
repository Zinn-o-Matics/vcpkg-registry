vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO knoxfighter/patterns
        REF 
        SHA512 935b3d516e996f6d25948ba8a54c1b7f70f7f0e3f517e36481fdf0196c2c5cfc2841f86e891f3df9517746b7fb605db47cdded1b8ff78d9482ddaa621db43a34
        HEAD_REF bugfix_build
)

#execute_process(COMMAND cargo build -r WORKING_DIRECTORY ${SOURCE_PATH}/sys)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()

file(COPY "${CMAKE_CURRENT_LIST_DIR}/patterns.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include/patterns")

#file(COPY "${CMAKE_CURRENT_LIST_DIR}/lib/patterns_sys.lib" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")
##file(COPY "${CMAKE_CURRENT_LIST_DIR}/lib/debug/patterns_sysd.lib" DESTINATION "${CURRENT_PACKAGES_DIR}/lib/debug")

file(COPY "${CMAKE_CURRENT_LIST_DIR}/patterns-config.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/patterns")


