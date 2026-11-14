vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gw2load/GW2Load
    REF 79328a0e7be2baf7823a780da5c3a3bad02735d7
    SHA512 1d9b3077eca78da035c4dec5c32c6ab907bc68edd83ff78b62cb498531c2b395181e06038cc5444a8c5aed628e78e796ab52ab1a4bc61de7317cda4de1400677
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
