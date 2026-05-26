vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Krappa322/arcdps_mock
        REF d876f047cf88610f073a06297040a5c7d86fbde2
        SHA512 a4c5f51dbb929372f717f6edea4a6799df7f22734b249ea5efefefc78ef5545d8cc8bbab414f1aa4d649fb0fd31d67acbc0926fe384e18e3cbd9af91fa474e2b
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