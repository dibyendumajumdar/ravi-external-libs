cmake_minimum_required(VERSION 2.8)
project(RaviDist)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")

if (WIN32)
  install(DIRECTORY include/win64/openblas/
        DESTINATION include/openblas)
  install(DIRECTORY bin/win64/
        DESTINATION bin)
  install(DIRECTORY lib/win64/
        DESTINATION lib)
endif(WIN32)

if (UNIX)
  find_package(LAPACK REQUIRED)
endif(UNIX)

if (APPLE)
  install(DIRECTORY bin/osx/
  	      DESTINATION bin)
elseif (UNIX)
  install(DIRECTORY bin/linux/
  	      DESTINATION bin)
endif()
