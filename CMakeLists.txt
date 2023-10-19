cmake_minimum_required(VERSION 3.2)

file(STRINGS "VERSION" MOSESTOKENIZER_VERSION)
project(mosestokenizer VERSION ${MOSESTOKENIZER_VERSION} LANGUAGES CXX)
add_definitions(-DVERSION_INFO="${MOSESTOKENIZER_VERSION}")
add_definitions(-DTOKENIZER_NAMESPACE=mosestokenizer)


######## Options
option(BUILD_SHARED_LIBS "Build mosestokenizer as shared library" ON)
option(BUILD_CLI "Build mosestokenizer commandline tool" ON)
option(BUILD_PYTHON "Build mosestokneizer python library" ON)


######## CMake settings
if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
  set(CMAKE_MACOSX_RPATH 1)
  find_library(COREFOUNDATION_LIBRARY CoreFoundation)
  find_library(FOUNDATION_LIBRARY Foundation)
  set(
    DEP_LIBRARIES ${DEP_LIBRARIES}
    ${COREFOUNDATION_LIBRARY} ${FOUNDATION_LIBRARY}
  )
endif()
set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/lib)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if (NOT BUILD_SHARED_LIBS)
  set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
  set(CMAKE_EXE_LINKER_FLAGS "-static")
  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
else()
  if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(CMAKE_FIND_LIBRARY_SUFFIXES ".dylib")
  else()
    set(CMAKE_FIND_LIBRARY_SUFFIXES ".dll")
  endif()
endif ()

set(
  CMAKE_MODULE_PATH
  ${CMAKE_MODULE_PATH}
  ${CMAKE_SOURCE_DIR}/cmake
  ${CMAKE_SOURCE_DIR}/cmake
)


######## Compiler flags
if ("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
  add_definitions(-std=c++11 -Wall)
  if (CMAKE_BUILD_TYPE MATCHES Debug)
    add_definitions(-O0 -g3)
  endif ()
elseif ("${CMAKE_CXX_COMPILER_ID}" MATCHES "GNU")
  add_definitions(-std=c++0x -Wall)
  if (CMAKE_BUILD_TYPE MATCHES Debug)
    add_definitions(-O0 -g3)
  endif ()
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  add_definitions(/W4 /D "_CRT_SECURE_NO_WARNINGS")
endif()


######## Dependencies
# Boost
if (BUILD_SHARED_LIBS)

set(BOOST_ROOT "C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows")
#find_package(Boost COMPONENTS program_options thread REQUIRED)
set(Boost_LIBRARIES
  C:\\git\\opus-fast-mosestokenizer\\vcpkg\\installed\\x64-windows\\lib\\boost_program_options-vc140-mt.lib
  C:\\git\\opus-fast-mosestokenizer\\vcpkg\\installed\\x64-windows\\lib\\boost_thread-vc140-mt.lib
)

include_directories(${BOOST_ROOT}/include/boost)
include_directories(${BOOST_ROOT}/include/absl)

message("Boost Libraries: ${Boost_LIBRARIES}")
set(DEP_LIBRARIES ${DEP_LIBRARIES} ${Boost_LIBRARIES})

else()

include_directories("C:\\Program Files\\boost")
set(
  DEP_LIBRARIES
  ${DEP_LIBRARIES}
  ${Boost_LIBRARIES}
  ${Boost_LIBRARIES}
)

endif()

link_directories(C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/lib)
#set(INTL_LIBRARY "C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/lib/intl.lib")
set(Intl_INCLUDE_DIR "C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/include")
set(Intl_LIBRARY "C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/lib/intl.lib")
#set(INTL_LIBRARIES "C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/lib/intl.lib")
#set(RE2_LIBRARIES "vcpkg/installed/x64-windows/lib/re2.lib")

# Intl


find_package(Intl REQUIRED)
set(Intl_LIBRARY "C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/lib/intl.lib")
set(Intl_LIBRARIES "C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/lib/intl.lib")
include_directories(${Intl_INCLUDE_DIRS})
set(DEP_LIBRARIES ${DEP_LIBRARIES} ${Intl_LIBRARIES})

find_package(Glib2 REQUIRED)
include_directories(${Glib2_INCLUDE_DIRS})
link_directories(${Glib2_LIBRARY_DIRS})
set(DEP_LIBRARIES ${DEP_LIBRARIES} ${Glib2_LIBRARIES})

find_package(RE2 REQUIRED)
include_directories(${RE2_INCLUDE_DIRS})
link_directories(${RE2_LIBRARY_DIRS})
set(DEP_LIBRARIES ${DEP_LIBRARIES} ${RE2_LIBRARIES})

#set(ABSL_INCLUDE_DIR "C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/include")
#include_directories(${ABSL_INCLUDE_DIR})
#set(ABSL_LIBRARIES
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/abseil_dll.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags_commandlineflag.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags_commandlineflag_internal.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags_config.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags_internal.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags_marshalling.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags_parse.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags_private_handle_accessor.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags_program_name.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags_reflection.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags_usage.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_flags_usage_internal.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_log_flags.lib"
#    "${CMAKE_SOURCE_DIR}/vcpkg/installed/x64-windows/lib/absl_string_view.lib"
#)

set(ABSL_LIBRARIES
  C:\\git\\opus-fast-mosestokenizer\\vcpkg\\installed\\x64-windows\\lib\\abseil_dll.lib
  C:\\git\\opus-fast-mosestokenizer\\vcpkg\\installed\\x64-windows\\lib\\absl_string_view.lib
)

set(DEP_LIBRARIES ${DEP_LIBRARIES} ${ABSL_LIBRARIES})

include_directories(
  C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/include
  C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/include/glib-2.0
  C:/git/opus-fast-mosestokenizer/vcpkg/installed/x64-windows/lib/glib-2.0/include
)


include_directories(${CMAKE_SOURCE_DIR}/include)
#add_definitions(-std=c++11 -pthread)


######## Targets
add_library(mosestokenizer-dev SHARED src/Tokenizer.cpp src/Parameters.cpp)
set_target_properties(mosestokenizer-dev PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS TRUE)
target_link_libraries(mosestokenizer-dev PRIVATE ${DEP_LIBRARIES} ${PYTHON_LIBRARIES})

configure_file(
  mosestokenizer.pc.in
  mosestokenizer.pc
  @ONLY
)

install(
  FILES ${CMAKE_BINARY_DIR}/mosestokenizer.pc
  DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/pkgconfig
)

install(
  DIRECTORY ${CMAKE_SOURCE_DIR}/share/nonbreaking_prefixes
  DESTINATION ${CMAKE_INSTALL_PREFIX}/share/mosestokenizer
)

install(
  TARGETS mosestokenizer-dev
  LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
  ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
)


######## CLI
if (BUILD_CLI)

add_executable(mosestokenizer src/tools/tokenizer_main.cpp)
target_link_libraries(
  mosestokenizer PRIVATE
  mosestokenizer-dev
  ${DEP_LIBRARIES}
)

install(
  TARGETS mosestokenizer
  RUNTIME DESTINATION bin
)

endif()


######## Python
if (BUILD_PYTHON)

if (BUILD_SHARED_LIBS)
  find_package(pybind11 REQUIRED)
else()
  add_subdirectory(deps/pybind11-2.10.3)
endif()

pybind11_add_module(_mosestokenizer src/python/mosestokenizer.cpp)
target_link_libraries(
  _mosestokenizer PRIVATE
  mosestokenizer-dev
  ${DEP_LIBRARIES}
)

endif()


######## Installation