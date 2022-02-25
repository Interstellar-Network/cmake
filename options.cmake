################################################################################

# If not ON, all "add_library" will default to STATIC
# TODO test with shared libs, and update build.rs if it works!
option(BUILD_SHARED_LIBS "Build shared libraries (.so)." OFF)

################################################################################

# c++17: needed for string_view
# c++20: why not?
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Force PIC on all target
# (it's needed for most anyway since we are building a shared lib for the Python wrapper)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# enable LTO because why not
# also pretty much a prerequisite for Rust FFI cf https://github.com/XiangpengHao/cxx-cmake-example
# NOTE: behind an option b/c that REALLY slows down the linking (even in Debug)
option(ENABLE_LTO "Enable cross language linking time optimization" OFF)
if(ENABLE_LTO)
  if(supported)
      message(STATUS "IPO / LTO enabled")
      set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)
  else()
      message(STATUS "IPO / LTO not supported: <${error}>")
  endif()
endif()