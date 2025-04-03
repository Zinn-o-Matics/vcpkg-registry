vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO RaidcoreGG/RCGG-lib-nexus-api
    REF e585220d489ed27feeb2dd208845f15472e0cf04
    SHA512 aecb7a46b14a414b5e7a6ef90cddcda0a7db33c9269358e9d60c27a98780d00e4ac3eaab5f526d86ecb7df2b384390ee0b53ff43710485690254aaa20930ce8f
    HEAD_REF main
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

vcpkg_fixup_pkgconfig()
