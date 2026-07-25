vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Zinn-o-Matics/arcdps-extension
    REF "v2.4.2"
    SHA512 d34c57f5892245511e2872170c4dbf0c63869fcd87089b69d4d415039674972ea7563e4568d47079e330a549be5e7046ef956d75ffdd66efba9de94a56099541
    HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
	imgui				ARCDPS_EXTENSION_IMGUI
	unofficial-extras	ARCDPS_EXTENSION_UNOFFICIAL_EXTRAS
	curl                ARCDPS_EXTENSION_CURL
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
	OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ArcdpsExtension)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
