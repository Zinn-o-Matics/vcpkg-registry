vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Krappa322/arcdps_unofficial_extras_releases
    REF 0c4f125343c43700d2e886e75a81514481a30982
    SHA512 fc35f389846f620e0af115d8c9e6072d62ed6702561738535c7d6a9c3146f720d1df5d6859aaaaa33dd427145b4a3d9ec01cd394943e18e8dd9d24fc4b7662e3
    HEAD_REF vcpkg-update
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ArcdpsUnofficialExtras)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
