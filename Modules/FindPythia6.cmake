#[================================================================[.rst:
FindPythia6
----------

Finds Pythia6 library and headers

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``Pythia6::Pythia6``
  The Pythia6 library


#]================================================================]
# headers
find_file(_cet_main60_f NAMES main60.f HINTS ENV PYTHIA_INC
  PATH_SUFFIXES Pythia6)
if (_cet_main60_f)
  get_filename_component(_cet_Pythia6_include_dir "${_cet_main60_f}" PATH)
  if (_cet_Pythia6_include_dir STREQUAL "/")
    unset(_cet_Pythia6_include_dir)
  endif()
endif()
if (EXISTS "${_cet_Pythia6_include_dir}")
  set(Pythia6_FOUND TRUE)
  get_filename_component(_cet_Pythia6_dir "${_cet_Pythia6_include_dir}" PATH)
  if (_cet_Pythia6_dir STREQUAL "/")
    unset(_cet_Pythia6_dir)
  endif()
  set(Pythia6_INCLUDE_DIRS "${_cet_Pythia6_include_dir}")
  set(Pythia6_LIBRARY_DIR "${_cet_Pythia6_dir}/lib")
endif()
if (Pythia6_FOUND)
  find_library(Pythia6_LIBRARY NAMES Pythia6 PATHS ${Pythia6_LIBRARY_DIR})
  if (NOT TARGET Pythia6::Pythia6)
    add_library(Pythia6::Pythia6 SHARED IMPORTED)
    set_target_properties(Pythia6::Pythia6 PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${Pythia6_INCLUDE_DIRS}"
      IMPORTED_LOCATION "${Pythia6_LIBRARY}"
      )
  endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Pythia6
  REQUIRED_VARS Pythia6_FOUND
  Pythia6_INCLUDE_DIRS
  Pythia6_LIBRARY)

unset(_cet_Pythia6_FIND_REQUIRED)
unset(_cet_Pythia6_dir)
unset(_cet_Pythia6_include_dir)
unset(_cet_main60_f CACHE)

