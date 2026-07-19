vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Krappa322/arcdps_unofficial_extras_releases
    REF "v2.4.1.1"
    SHA512 d44ee4a0947e9c3f7a7e532ce48856b84d07d222bebeda0b6d70ce6b88b67395099ea484b68c41696e790a6b5fbeb312259e7f349fd7bbca8d324640e9c2abea
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
