#[================================================================[.rst:
Findlog4cpp
----------

Finds log4cpp library and headers

Imported Targets
^^^^^^^^^^^^^^^^

This module provides the following imported targets, if found:

``log4cpp::log4cpp``
  The log4cpp library


#]================================================================]
# headers
find_file(_cet_LoggingEvent_hh NAMES LoggingEvent.hh HINTS ENV LOG4CPP_INC
  PATH_SUFFIXES log4cpp)
if (_cet_LoggingEvent_hh)
  get_filename_component(_cet_log4cpp_include_dir "${_cet_LoggingEvent_hh}" PATH)
  get_filename_component(_cet_log4cpp_include_dir "${_cet_log4cpp_include_dir}" PATH)
  if (_cet_log4cpp_include_dir STREQUAL "/")
    unset(_cet_log4cpp_include_dir)
  endif()
endif()
if (EXISTS "${_cet_log4cpp_include_dir}")
  set(log4cpp_FOUND TRUE)
  get_filename_component(_cet_log4cpp_dir "${_cet_log4cpp_include_dir}" PATH)
  if (_cet_log4cpp_dir STREQUAL "/")
    unset(_cet_log4cpp_dir)
  endif()
  set(log4cpp_INCLUDE_DIRS "${_cet_log4cpp_include_dir}")
  set(log4cpp_LIBRARY_DIR "${_cet_log4cpp_dir}/lib}")
endif()
if (log4cpp_FOUND)
  find_library(log4cpp_LIBRARY NAMES log4cpp PATHS ${log4cpp_LIBRARY_DIR})
  if (NOT TARGET log4cpp::log4cpp)
    add_library(log4cpp::log4cpp SHARED IMPORTED)
    set_target_properties(log4cpp::log4cpp PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${log4cpp_INCLUDE_DIRS}"
      IMPORTED_LOCATION "${log4cpp_LIBRARY}"
      )
  endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(log4cpp
  REQUIRED_VARS log4cpp_FOUND
  log4cpp_INCLUDE_DIRS
  log4cpp_LIBRARY)

unset(_cet_log4cpp_FIND_REQUIRED)
unset(_cet_log4cpp_dir)
unset(_cet_log4cpp_include_dir)
unset(_cet_LoggingEvent_hh CACHE)

