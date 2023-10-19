#[=======================================================================[.rst:
FindGlib2
--------

Find the glib-2.0 headers and libraries from the deps folder.

General variables::

  Glib2_FOUND - true if the libglib-2.0 headers and libraries were found
  Glib2_INCLUDE_DIRS - the directory containing the libglib-2.0 headers
  Glib2_LIBRARIES - libglib-2.0 libraries to be linked

The following variables may also be set to alter behavior::

  BUILD_SHARED_LIBS - used to determine which of static or shared library
    should be sourced

.. note::
  This script is pretty hard coded.
#]=======================================================================]

if (False)

# Search for shared library on system level
find_package(PkgConfig REQUIRED)
pkg_search_module(Glib2 REQUIRED glib-2.0)

else()  # BUILD_SHARED_LIBS

# Search for static library from deps
set(Glib2_INCLUDE_DIRS C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/include/glib-2.0 C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/lib/glib-2.0/include)
set(Glib2_LIBRARIES C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/lib/glib-2.0.lib C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/lib/gmodule-2.0.lib)
set(Glib2_FOUND ON)
add_library(glib-2.0::glib-2.0 STATIC IMPORTED)

endif()  # BUILD_SHARED_LIBS
