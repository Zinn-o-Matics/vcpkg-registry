vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO RaidcoreGG/RCGG-lib-nexus-api
    REF a8b7fceab29a35da4ae0cc43f0c7f78fe2f8dc4f
    SHA512 45d3cf07061095e6006b11063768493182734a8f2bf0a4742109a31b37894088ebce350eaab0aa00839bddb707fc25a66d578c473189928d72b5042b9b0e8537
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
