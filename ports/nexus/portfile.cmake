vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO knoxfighter/RCGG-lib-nexus-api
    REF 511eecdcdefb1699fde8b803f1b1634ba1cac08b
    SHA512 587693b4157ea8d0266d4f79d3f01f9496032766cba287303b38fab97e35da70230782941efe162ac7dc0ba5685131b94a8cb89b61bf1fdbccbd9b960a7b4b02
    HEAD_REF optional-imgui
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

vcpkg_fixup_pkgconfig()
