################################################################################
# NOTE: apparently include(and add_subdirectory/FetchContent) vs
# add_compile_options order does NOT matter b/c CMake will "include+configure"
# THEN compile.
# Which means the flags from "add_compile_options" are used whatever the moment
# they were added

add_compile_options(
    -march=native

    -Wall -Wextra -Werror

    -fstack-protector-strong

    # without this when debugging we can not see the stack values
    # GCC does not understand this flag
    $<$<CXX_COMPILER_ID:Clang>:$<$<CONFIG:Debug>:-fno-limit-debug-info>>
)