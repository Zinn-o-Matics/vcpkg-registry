vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO knoxfighter/patterns
        REF 28831c7c2490530e4c9847f7159072885ea5e53d
        SHA512 cc00858a6bcb7bc3ae1fff671be9bbf9852b9a939710d66d5aafddc2d6f0c39c23037a7d48da4ccc1ff84e8bc89f1d017b41a959067fa6ad913060b1a48a7666
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


