vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO RaidcoreGG/RCGG-lib-nexus-api
    REF 9b2c53df86c00db6495642bfcff2d0611bd957ef
    SHA512 3cc25792d72e6164ad1438466983a1345672aeb750e61bcdb0b3320e63b76572bbdf09c8e8cfc49c486262644b5326ebb351ae78b921df6a7d45719ea15aacff
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
