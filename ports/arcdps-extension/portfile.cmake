vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO knoxfighter/arcdps-extension
    REF b713d9e990579065317a7c9cd76cccf179d36107
    SHA512 243dbba5b106509a01cf2c647d985672df53ebbd5fc446c89b29ed793917f7b65e351024fefe38b4e1d634fdf18f3e759841c0225c1358252937b0bdf4e88e79
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
