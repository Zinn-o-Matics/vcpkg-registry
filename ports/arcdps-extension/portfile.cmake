vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Zinn-o-Matics/arcdps-extension
    REF "v2.2.3"
    SHA512 41e148aae876eaa69936463c1fd4cd7c9e43acd02b2a5c320663ae9e7b12fe3794662b11f55ebfcfa21ab25ba8f2d52b952e58d0863deccac209d6c26c25f1c1
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
