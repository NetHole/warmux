# see http://www.cmake.org/Wiki/CMake:Packaging_With_CPack
cmake_minimum_required(VERSION 2.4)

SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Wormux - a convivial mass murder game")
SET(CPACK_PACKAGE_NAME "Wormux")
SET(CPACK_PACKAGE_VENDOR "Wormux Development Team")
SET(CPACK_PACKAGE_DESCRIPTION_FILE "${PROJECT_SOURCE_DIR}/README")
SET(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/COPYING")
SET(CPACK_PACKAGE_VERSION ${VERSION})
SET(CPACK_PACKAGE_VERSION_MAJOR ${WORMUX_MAJOR})
SET(CPACK_PACKAGE_VERSION_MINOR ${WORMUX_MINOR})
SET(CPACK_PACKAGE_VERSION_PATCH ${WORMUX_PATCH})
SET(CPACK_PACKAGE_FILE_NAME ${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION})
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "Wormux ${WORMUX_MAJOR}.${WORMUX_MINOR}")

IF(UNIX)
  SET(CPACK_GENERATOR "TBZ2")
  SET(CPACK_SOURCE_GENERATOR "TBZ2")
  SET(CPACK_PACKAGE_EXECUTABLES "wormux" "Wormux")
  SET(CPACK_STRIP_FILES "bin/wormux")
ENDIF(UNIX)
IF(WIN32)
  SET(CPACK_GENERATOR "NSIS")
  SET(CPACK_SOURCE_GENERATOR "ZIP")
  SET(CPACK_PACKAGE_EXECUTABLES "wormux.exe" "Wormux")
  # because of a bug in nsis there have to be at least 4 backslashes once
  SET(CPACK_PACKAGE_ICON "${PROJECT_SOURCE_DIR}/data\\\\wormux_32x32.png")
  SET(CPACK_NSIS_URL_INFO_ABOUT "http:\\\\\\\\www.wormux.org")
  SET(CPACK_NSIS_CONTACT "wormux-dev@gna.org")
ENDIF(WIN32)

INCLUDE(CPack)
