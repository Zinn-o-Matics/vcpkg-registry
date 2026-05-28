vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Krappa322/arcdps_mock
        REF ac6af93646bc4fce8bdb27a28594028197ebacbc
        SHA512 bddb38ef00e8c1b2b41f02e19cc3b3d488b1c8d3068c266fb46a5c889c532b7a0c5e4ee22cd60a6b7837f54c56f52b64a1892eace685852cd25cc23c30eb5c6f
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