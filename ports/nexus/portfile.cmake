vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO knoxfighter/RCGG-lib-nexus-api
    REF 1e5bd141ee3e1d5b50dd1aae1fb681584370d0ac
    SHA512 d023fbc8ea53b2b6c3bcca8a0d760cd7cf5e1e71615a6b3a4128918f5bc04cc3a95fe4816c4cfb710264e2543eb09ae6ecb8313c37fa9bfd8f5d5b98b00ef343
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
