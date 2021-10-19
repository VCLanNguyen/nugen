#[================================================================[.rst:
FindGENIE
----------
  find GENIE and all its libraries

#]================================================================]
if (NOT GENIE_FOUND)
  if (GENIE_FIND_REQUIRED)
    set(_cet_GENIE_FIND_REQUIRED ${GENIE_FIND_REQUIRED})
    unset(GENIE_FIND_REQUIRED)
  else()
    unset(_cet_GENIE_FIND_REQUIRED)
  endif()
  find_package(GENIE CONFIG QUIET)
  if (_cet_GENIE_FIND_REQUIRED)
    set(GENIE_FIND_REQUIRED ${_cet_GENIE_FIND_REQUIRED})
    unset(_cet_GENIE_FIND_REQUIRED)
  endif()
  if (GENIE_FOUND)
    set(_cet_GENIE_config_mode CONFIG_MODE)
  else()
    unset(_cet_GENIE_config_mode)
  endif()
endif()
if (NOT GENIE_FOUND)
  find_file(_cet_GENIE_hpp NAMES range_fwd.hpp HINTS ENV GENIE_INC
    PATH_SUFFIXES range/v3)
  if (_cet_GENIE_hpp)
    get_filename_component(_cet_GENIE_include_dir "${_cet_GENIE_hpp}" PATH)
    get_filename_component(_cet_GENIE_include_dir "${_cet_GENIE_include_dir}" PATH)
    get_filename_component(_cet_GENIE_include_dir "${_cet_GENIE_include_dir}" PATH)
    if (_cet_GENIE_include_dir STREQUAL "/")
      unset(_cet_GENIE_include_dir)
    endif()
  endif()
  if (EXISTS "${_cet_GENIE_include_dir}")
    set(GENIE_FOUND TRUE)
    set(RANGE_FOUND TRUE)
  endif()
endif()

