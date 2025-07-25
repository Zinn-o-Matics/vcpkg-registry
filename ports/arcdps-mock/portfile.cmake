vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Krappa322/arcdps_mock
        REF 447cf9a041d8736ef0bcdf4694d7cc84d2433870
        SHA512 3bdc0f8716887bc0c460f5df858da8df17df7e9171a9fb02ee01672b85b84acebcbdf23739feeef62fd35b5225f323132c0725dfaaae5ff7aaf31001971ad8db
        HEAD_REF vcpkg
)

# This is a header only library (for now)
file(INSTALL "${SOURCE_PATH}/xevtc/Xevtc.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include/xevtc")

# Handle copyright
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME "copyright")