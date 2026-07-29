vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Zinn-o-Matics/arcdps-extension
    REF "v2.5.0"
    SHA512 ac92638a802f4a899a94718332f632fe5151c0ebf4391f37568f3d6ce2c79a7dc9d4606346196d58ee19c2a7ada59b4172eac93981313765e1ae4c23fda235b3
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
