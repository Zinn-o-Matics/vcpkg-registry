vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Krappa322/arcdps_unofficial_extras_releases
    REF ac7505651b96dfeb5848eb599fdfbf5de3d2823c
    SHA512 f0065555834494d0672fff51534cca2d72ce0dc3d9cbe374071793e0a2ec5f4f856a16f4e84d14d3066d221bc3eb5e6ccb0d3de670066be10affbb3feed6fe3d
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    magic-enum				ARCPDS_UNOFFICIAL_EXTRAS_MAGIC_ENUM
    cpp11					ARCPDS_UNOFFICIAL_EXTRAS_CPP_11
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ArcdpsUnofficialExtras)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
