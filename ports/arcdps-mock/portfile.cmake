vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Krappa322/arcdps_mock
        REF e8ffb64aa31a64ca2593994fb013014efa1011eb
        SHA512 ad8d5ca09ffe13b10b931c545b519a5c400416f34e4b9edfebfb9166ac90f9d1263bb2dcaa55d2f82f04f64bcb0dfd9cc7f39a6b0ab91350f5fb63774c8d2ddb
        HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
	OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ArcdpsMock)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# This is a header only library (for now)
#file(INSTALL "${SOURCE_PATH}/xevtc/Xevtc.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include/xevtc")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)