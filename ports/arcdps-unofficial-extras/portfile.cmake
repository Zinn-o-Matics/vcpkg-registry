vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Krappa322/arcdps_unofficial_extras_releases
    REF a3d5a0efad7238cd2d6cfaec77c206ab0ba0c58d
    SHA512 d2351f220dba7381f4d12af47f1a1b5d70ecf31592799da9f5b11c5414c2411ea804c43b02a28d835f72b545fcef12749a316ef842727e1e789a92c27abd17a8
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ArcdpsUnofficialExtras)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
