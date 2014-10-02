# Install script for directory: /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libraries")
  FOREACH(file
      "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libmd_d_mpibull_gshmc.so.6"
      "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libmd_d_mpibull_gshmc.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      FILE(RPATH_CHECK
           FILE "${file}"
           RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
    ENDIF()
  ENDFOREACH()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libmd_d_mpibull_gshmc.so.6;/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libmd_d_mpibull_gshmc.so")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib" TYPE SHARED_LIBRARY FILES
    "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib/libmd_d_mpibull_gshmc.so.6"
    "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib/libmd_d_mpibull_gshmc.so"
    )
  FOREACH(file
      "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libmd_d_mpibull_gshmc.so.6"
      "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libmd_d_mpibull_gshmc.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      FILE(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib:"
           NEW_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "${file}")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDFOREACH()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libraries")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "development")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/pkgconfig/libmd_d_mpibull_gshmc.pc")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/pkgconfig" TYPE FILE RENAME "libmd_d_mpibull_gshmc.pc" FILES "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib/libmd.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "development")

