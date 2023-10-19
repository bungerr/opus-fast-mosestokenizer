#[=======================================================================[.rst:
FindRE2
--------

Find the re2 headers and libraries from the deps folder.

General variables::

  RE2_FOUND - true if the libre2 headers and libraries were found
  RE2_INCLUDE_DIRS - the directory containing the libre2 headers
  RE2_LIBRARIES - libre2 libraries to be linked

The following variables may also be set to alter behavior::

  BUILD_SHARED_LIBS - used to determine which of static or shared library
    should be sourced

.. note::
  This script is pretty hard coded.
#]=======================================================================]

#if (BUILD_SHARED_LIBS)
if (False)

# Search for shared library on system level
find_package(PkgConfig REQUIRED)
pkg_search_module(RE2 REQUIRED re2)

else()  # BUILD_SHARED_LIBS

# Search for static library from deps
set(RE2_INCLUDE_DIRS C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/include)
set(RE2_LIBRARIES C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/lib/re2.lib)
add_library(re2::re2 STATIC IMPORTED)

set(RE2_FOUND ON)

endif()  # BUILD_SHARED_LIBS
