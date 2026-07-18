vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Krappa322/arcdps_unofficial_extras_releases
    REF bcc236ef63a8a66e46db9c0c29decdeb4b5b5c96
    SHA512 004be12fd7be530ce90e8f790729b6df82a645fb99fc933025b028a7463f020c2b718400e14a72e50003122f220c1ba597389f3317c4cf0ccad9a9887591fa3e
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
