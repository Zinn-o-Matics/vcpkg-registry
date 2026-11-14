vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO gw2load/GW2Load
    REF 11f1dffaddf967c190cb7b64d3c7d3f5a8ac3879
    SHA512 20fd3eaf9a8ada6b3b2b8a1484c9d76cfbbbebb18c26146457d65e47c36fa6386ca607b491127f713f71ae92d1b5c44b74e6db8fea7579685e3465b0948094e2
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
