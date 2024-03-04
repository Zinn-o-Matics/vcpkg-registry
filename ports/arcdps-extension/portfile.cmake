vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO knoxfighter/arcdps-extension
    REF 697c129760856e358eb7a3037b182e706c9e6848
    SHA512 039a37075188b55c77a08891e730856c662ceb3429e461a46ad2ebdad8ce54e706a065caaf9460c090680790f79777aa131f92ce2046a5499494b00854373638
    HEAD_REF vcpkg-update
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    imgui				ARCDPS_EXTENSION_IMGUI
	unofficial-extras	ARCDPS_EXTENSION_UNOFFICIAL_EXTRAS
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
