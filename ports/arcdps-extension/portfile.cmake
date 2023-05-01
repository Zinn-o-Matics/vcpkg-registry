vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO knoxfighter/arcdps-extension
    REF d26d411c809fcdce10ebbf61377be134afbee9b4
    SHA512 203f0a865014368cc04a3bcba0ee71919c3dfec14789b636d96205fea839c19a9aa9a18354c41dcd2f6c7c705cb85e09a9e0fb2fd5273e679bf0a0adfc8254ae
    HEAD_REF vcpkg-update
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ArcdpsExtension)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
