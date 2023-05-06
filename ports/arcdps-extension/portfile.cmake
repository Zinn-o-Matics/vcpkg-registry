vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO knoxfighter/arcdps-extension
    REF 1d9c48f328c70c2889c0140d9812528760171c75
    SHA512 44ea094b79757ab7238d33e58ec408515f70d25c6f15ef8e35679613b4ac07b2aa78b8c5cb4f76e525b32d14f0ebc330de1ba2ca7094020a7a0c189d2c721ea5
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
