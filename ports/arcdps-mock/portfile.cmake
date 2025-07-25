vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Krappa322/arcdps_mock
        REF dfc9d060f93a7daaf66342d6b9228fb168a13585
        SHA512 4b8e89555917ccb455fce717199b423abc1fc4960b5ef765dbe8e484a1a166707228b4a06d1fa04e3078f90c3f4bd9d527becd336c1f420f5dd680bb34ca01ab
        HEAD_REF vcpkg
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