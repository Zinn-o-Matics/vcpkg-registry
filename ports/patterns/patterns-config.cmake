get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

add_library(patterns STATIC IMPORTED)
set_property(TARGET patterns PROPERTY IMPORTED_LOCATION ${PACKAGE_PREFIX_DIR}/lib/patterns_sys.lib)
set_target_properties(patterns PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include;${PACKAGE_PREFIX_DIR}/include"
)

set(patterns_INCLUDE_DIRS ${PACKAGE_PREFIX_DIR}/include/patterns)
set(patterns_LIBRARIES ${PACKAGE_PREFIX_DIR}/lib/patterns_sys.lib)
