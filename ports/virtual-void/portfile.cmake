
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bitfactory-software/virtual_void
    REF "${VERSION}"
    SHA512  3dfa4caab6ed964f0db9dc3ed00610d6ca3cf9ca3021e4bb4dd41b0217a7bda82784a204ea11ff6075ee52a5f61d4ccdcd149bbeb7c7e55bcecfd9986fde01ca
)


vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)
#vcpkg_cmake_build()
message("install")
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "virtual_void")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)