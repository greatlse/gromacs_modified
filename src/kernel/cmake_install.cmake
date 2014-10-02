# Install script for directory: /home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel

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
      "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libgmxpreprocess_d_mpibull_gshmc.so.6"
      "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libgmxpreprocess_d_mpibull_gshmc.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      FILE(RPATH_CHECK
           FILE "${file}"
           RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
    ENDIF()
  ENDFOREACH()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libgmxpreprocess_d_mpibull_gshmc.so.6;/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libgmxpreprocess_d_mpibull_gshmc.so")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib" TYPE SHARED_LIBRARY FILES
    "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/libgmxpreprocess_d_mpibull_gshmc.so.6"
    "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/libgmxpreprocess_d_mpibull_gshmc.so"
    )
  FOREACH(file
      "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libgmxpreprocess_d_mpibull_gshmc.so.6"
      "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/libgmxpreprocess_d_mpibull_gshmc.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      FILE(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib:"
           NEW_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "${file}")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDFOREACH()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libraries")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "mdrun")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/mdrun_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/mdrun_d_mpibull_gshmc")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/mdrun_d_mpibull_gshmc"
         RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/mdrun_d_mpibull_gshmc")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin" TYPE EXECUTABLE FILES "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/mdrun_d_mpibull_gshmc")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/mdrun_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/mdrun_d_mpibull_gshmc")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/mdrun_d_mpibull_gshmc"
         OLD_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib:"
         NEW_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/mdrun_d_mpibull_gshmc")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "mdrun")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/grompp_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/grompp_d_mpibull_gshmc")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/grompp_d_mpibull_gshmc"
         RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/grompp_d_mpibull_gshmc")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin" TYPE EXECUTABLE FILES "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/grompp_d_mpibull_gshmc")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/grompp_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/grompp_d_mpibull_gshmc")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/grompp_d_mpibull_gshmc"
         OLD_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib:"
         NEW_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/grompp_d_mpibull_gshmc")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/tpbconv_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/tpbconv_d_mpibull_gshmc")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/tpbconv_d_mpibull_gshmc"
         RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/tpbconv_d_mpibull_gshmc")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin" TYPE EXECUTABLE FILES "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/tpbconv_d_mpibull_gshmc")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/tpbconv_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/tpbconv_d_mpibull_gshmc")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/tpbconv_d_mpibull_gshmc"
         OLD_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib:"
         NEW_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/tpbconv_d_mpibull_gshmc")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/pdb2gmx_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/pdb2gmx_d_mpibull_gshmc")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/pdb2gmx_d_mpibull_gshmc"
         RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/pdb2gmx_d_mpibull_gshmc")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin" TYPE EXECUTABLE FILES "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/pdb2gmx_d_mpibull_gshmc")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/pdb2gmx_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/pdb2gmx_d_mpibull_gshmc")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/pdb2gmx_d_mpibull_gshmc"
         OLD_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib:"
         NEW_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/pdb2gmx_d_mpibull_gshmc")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_protonate_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_protonate_d_mpibull_gshmc")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_protonate_d_mpibull_gshmc"
         RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_protonate_d_mpibull_gshmc")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin" TYPE EXECUTABLE FILES "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/g_protonate_d_mpibull_gshmc")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_protonate_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_protonate_d_mpibull_gshmc")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_protonate_d_mpibull_gshmc"
         OLD_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib:"
         NEW_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_protonate_d_mpibull_gshmc")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_luck_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_luck_d_mpibull_gshmc")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_luck_d_mpibull_gshmc"
         RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_luck_d_mpibull_gshmc")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin" TYPE EXECUTABLE FILES "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/g_luck_d_mpibull_gshmc")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_luck_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_luck_d_mpibull_gshmc")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_luck_d_mpibull_gshmc"
         OLD_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib:"
         NEW_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_luck_d_mpibull_gshmc")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxdump_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxdump_d_mpibull_gshmc")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxdump_d_mpibull_gshmc"
         RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxdump_d_mpibull_gshmc")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin" TYPE EXECUTABLE FILES "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/gmxdump_d_mpibull_gshmc")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxdump_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxdump_d_mpibull_gshmc")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxdump_d_mpibull_gshmc"
         OLD_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib:"
         NEW_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxdump_d_mpibull_gshmc")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_x2top_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_x2top_d_mpibull_gshmc")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_x2top_d_mpibull_gshmc"
         RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_x2top_d_mpibull_gshmc")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin" TYPE EXECUTABLE FILES "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/g_x2top_d_mpibull_gshmc")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_x2top_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_x2top_d_mpibull_gshmc")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_x2top_d_mpibull_gshmc"
         OLD_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib:"
         NEW_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/g_x2top_d_mpibull_gshmc")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxcheck_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxcheck_d_mpibull_gshmc")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxcheck_d_mpibull_gshmc"
         RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxcheck_d_mpibull_gshmc")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin" TYPE EXECUTABLE FILES "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/gmxcheck_d_mpibull_gshmc")
  IF(EXISTS "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxcheck_d_mpibull_gshmc" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxcheck_d_mpibull_gshmc")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxcheck_d_mpibull_gshmc"
         OLD_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/mdlib:/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/gmxlib:"
         NEW_RPATH "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/bin/gmxcheck_d_mpibull_gshmc")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "runtime")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "development")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/pkgconfig/libgmxpreprocess_d_mpibull_gshmc.pc")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/exec/lib/pkgconfig" TYPE FILE RENAME "libgmxpreprocess_d_mpibull_gshmc.pc" FILES "/home/BCAMATH/mfernandez/reduced-flipping-GSHMC/src/kernel/libgmxpreprocess.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "development")

