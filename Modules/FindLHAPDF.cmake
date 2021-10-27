#[================================================================[.rst:
FindLHAPDF
----------

Finds LHAPDF library and headers

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``LHAPDF::LHAPDF``
  The LHAPDF library


#]================================================================]
# headers
find_file(_cet_LHAPDF_h NAMES LHAPDF.h HINTS ENV LHAPDF_INC
  PATH_SUFFIXES LHAPDF)
if (_cet_LHAPDF_h)
  get_filename_component(_cet_LHAPDF_include_dir "${_cet_LHAPDF_h}" PATH)
  get_filename_component(_cet_LHAPDF_include_dir "${_cet_LHAPDF_include_dir}" PATH)
  if (_cet_LHAPDF_include_dir STREQUAL "/")
    unset(_cet_LHAPDF_include_dir)
  endif()
endif()
if (EXISTS "${_cet_LHAPDF_include_dir}")
  set(LHAPDF_FOUND TRUE)
  get_filename_component(_cet_LHAPDF_dir "${_cet_LHAPDF_include_dir}" PATH)
  if (_cet_LHAPDF_dir STREQUAL "/")
    unset(_cet_LHAPDF_dir)
  endif()
  set(LHAPDF_INCLUDE_DIRS "${_cet_LHAPDF_include_dir}")
  set(LHAPDF_LIBRARY_DIR "${_cet_LHAPDF_dir}/lib")
endif()
if (LHAPDF_FOUND)
  find_library(LHAPDF_LIBRARY NAMES LHAPDF PATHS ${LHAPDF_LIBRARY_DIR})
  if (NOT TARGET LHAPDF::LHAPDF)
    add_library(LHAPDF::LHAPDF SHARED IMPORTED)
    set_target_properties(LHAPDF::LHAPDF PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${LHAPDF_INCLUDE_DIRS}"
      IMPORTED_LOCATION "${LHAPDF_LIBRARY}"
      )
  endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LHAPDF
  REQUIRED_VARS LHAPDF_FOUND
  LHAPDF_INCLUDE_DIRS
  LHAPDF_LIBRARY)

unset(_cet_LHAPDF_FIND_REQUIRED)
unset(_cet_LHAPDF_dir)
unset(_cet_LHAPDF_include_dir)
unset(_cet_LHAPDF_h CACHE)

