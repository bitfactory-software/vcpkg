
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bitfactory-software/virtual_void
    REF "${VERSION}"
    SHA512  96c2e77c3c35faae972cd8d416bcba0c8c5f4c405694b5160b59da06d41ef1db752799b18863fb0304575ea698134b36b94ca35238ef4e119ef30aec54bb4b0e
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