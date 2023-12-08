vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO knoxfighter/patterns
        REF db7f9c80e5aa716a9a42481149053cdaaf6395d5
        SHA512 5b01b7c856889246a3ff28853932b392c4b97ec380bc810d2e0b4e87a7f25d4381261f72469ed4f2f6a6a76f5eff14e86715cd3b977a2274e6cb204823f3be27
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


