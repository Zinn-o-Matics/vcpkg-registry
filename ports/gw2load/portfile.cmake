vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gw2load/GW2Load
    REF de969433c10a6f6a7cb5b9ef71465f9bfff3173a
    SHA512 42cdf25f3a84c47a4ede7e309eee77cb1ec5e0b91a52e09a93ab47375ff90b87cf1bb44fdec217095d228177a1fe5431a6f46b345d2d9b8fa6295eb9488a106e
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
