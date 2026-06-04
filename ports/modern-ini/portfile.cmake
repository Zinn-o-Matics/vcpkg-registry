vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Zinn-o-Matics/modernIni
    REF f461412775b3fec4ed167df56afd2e9eb6c423cf
    SHA512 54143fb9b5fe5763dc39e34e2bd803bda990de5c92d386515a70d0dc6af50c4f46029f1bc4ebb13192fda9f9e9df822a36c0db9b78ba086fb2f3b0a00eb4100d
    HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
	magic-enum			MODERNINI_MAGIC_ENUM
	tests				MODERNINI_BUILD_TESTS
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
	OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ModernIni)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
