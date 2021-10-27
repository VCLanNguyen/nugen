#[================================================================[.rst:
Finddk2nugenie
----------
  find dk2nugenie

#]================================================================]
if (dk2nugenie_FIND_REQUIRED)
  set(_cet_dk2nugenie_FIND_REQUIRED ${dk2nugenie_FIND_REQUIRED})
  unset(dk2nugenie_FIND_REQUIRED)
else()
  unset(_cet_dk2nugenie_FIND_REQUIRED)
endif()
find_package(dk2nugenie CONFIG QUIET)
if (_cet_dk2nugenie_FIND_REQUIRED)
  set(dk2nugenie_FIND_REQUIRED ${_cet_dk2nugenie_FIND_REQUIRED})
  unset(_cet_dk2nugenie_FIND_REQUIRED)
endif()
if (dk2nugenie_FOUND)
  set(_cet_dk2nugenie_config_mode CONFIG_MODE)
else()
  unset(_cet_dk2nugenie_config_mode)
  find_file(_cet_GDk2NuFlux_h NAMES GDk2NuFlux.h HINTS ENV DK2NUGENIE_INC
    PATH_SUFFIXES dk2nu/genie)
  if (_cet_GDk2NuFlux_h)
    get_filename_component(_cet_dk2nugenie_include_dir "${_cet_GDk2NuFlux_h}" PATH)
    get_filename_component(_cet_dk2nugenie_include_dir "${_cet_dk2nugenie_include_dir}" PATH)
    get_filename_component(_cet_dk2nugenie_include_dir "${_cet_dk2nugenie_include_dir}" PATH)
    if (_cet_dk2nugenie_include_dir STREQUAL "/")
      unset(_cet_dk2nugenie_include_dir)
    endif()
  endif()
  if (EXISTS "${_cet_dk2nugenie_include_dir}")
    set(dk2nugenie_FOUND TRUE)
    set(DK2NUGENIE_FOUND TRUE)
    get_filename_component(_cet_dk2nugenie_dir "${_cet_dk2nugenie_include_dir}" PATH)
    if (_cet_dk2nugenie_dir STREQUAL "/")
      unset(_cet_dk2nugenie_dir)
    endif()
    set(dk2nugenie_INCLUDE_DIRS "${_cet_dk2nugenie_include_dir}")
    set(dk2nugenie_LIBRARY_DIR "${_cet_dk2nugenie_dir}/lib")
    find_library(dk2nugenie_LIBRARY NAMES dk2nuGenie HINTS ${dk2nugenie_LIBRARY_DIR})
  endif()
endif()
if (dk2nugenie_FOUND)
  if (NOT TARGET dk2nu::Genie)
    add_library(dk2nu::Genie SHARED IMPORTED)
    set_target_properties(dk2nu::Genie PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${dk2nugenie_INCLUDE_DIRS}"
      IMPORTED_LOCATION "${dk2nugenie_LIBRARY}"
      )
    set(dk2nugenie_LIBRARY "dk2nu::Genie")
  endif()
  if (CETMODULES_CURRENT_PROJECT_NAME AND
      ${CETMODULES_CURRENT_PROJECT_NAME}_OLD_STYLE_CONFIG_VARS)
    include_directories("${dk2nugenie_INCLUDE_DIRS}")
  endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(dk2nugenie ${_cet_dk2nugenie_config_mode}
  REQUIRED_VARS dk2nugenie_FOUND
  dk2nugenie_INCLUDE_DIRS
  dk2nugenie_LIBRARY)

unset(_cet_dk2nugenie_FIND_REQUIRED)
unset(_cet_dk2nugenie_config_mode)
unset(_cet_dk2nugenie_dir)
unset(_cet_dk2nugenie_include_dir)
unset(_cet_GDk2NuFlux_h CACHE)

