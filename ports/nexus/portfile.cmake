vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO RaidcoreGG/RCGG-lib-nexus-api
    REF 0719989faa4220d5e6673705b7e14b9cf527ac92
    SHA512 dc9f8a05bbb9ecae697993598d835a090965ff63d20e293c98c86b9487b675a708bbd8c8823df8392c651c59972e3cff9d1df92fa47c21ecaf71e5c1347afd9e
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
