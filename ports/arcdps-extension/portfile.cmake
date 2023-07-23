vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO knoxfighter/arcdps-extension
    REF f570aa547f37f7795749f5a7ba5a71c8e29368fe
    SHA512 ca7dc7e640cb87d3f63e6771b19ca53c4f2d076a131ebb25d5655957a294d5876a3167a5959a8fd18cbc720df37b36a9ed5d24718fb9499730c6ff94bb47e113
    HEAD_REF vcpkg-update
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ArcdpsExtension)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
