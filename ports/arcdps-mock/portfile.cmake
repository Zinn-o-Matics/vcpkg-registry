vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO Krappa322/arcdps_mock
        REF eae8fd79dcd5cdc604a1d24b8f0567ee0eb1fad5
        SHA512 db9b00fa344bf50e087c79fdb1ba2108e75dded946eb1dcda50341877c896973253c2d6cb1822fa257d486b28bd5f8a231754cd31ff081aeb3f711a2e638af12
        HEAD_REF vcpkg
)

# This is a header only library (for now)
file(INSTALL "${SOURCE_PATH}/xevtc/Xevtc.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include/xevtc")

# Handle copyright
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME "copyright")