vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO knoxfighter/patterns
        REF 
        SHA512 cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e
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


