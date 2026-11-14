vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO RaidcoreGG/RCGG-lib-nexus-api
    REF 9b2c53df86c00db6495642bfcff2d0611bd957ef
    SHA512 182ff1c58d15fdcfd182564476c4acce6a978b6fef3ac757373237fd7bcdbc888d3ffb6819a5b5c467d39abf7efce9e2b8846a2b2180d86f3fdcb4bf7f16d740
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
