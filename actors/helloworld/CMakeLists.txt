# C++ actor
add_executable(helloworld_cpp helloworld.cpp)
target_link_libraries(helloworld_cpp PRIVATE
    imas            # access layer
    imas-cpp        # imas cpp interface
    muscle          # muscle3
    ymmsl           # part of muscle3
)

# Fortran actor
add_executable(helloworld_fortran helloworld.f90)
target_link_libraries(helloworld_fortran PRIVATE
    imas            # access layer
    # FIXME: also support other fortran compilers
    imas-gfortran   # imas fortran interface
    muscle_fortran  # muscle3
    ymmsl_fortran   # muscle3
)

# Process *.ymmsl.in files in workflows/helloworld directory
file(GLOB infiles ${PROJECT_SOURCE_DIR}/workflows/helloworld/*.ymmsl.in)
foreach(infile IN LISTS infiles)
    cmake_path(REMOVE_EXTENSION infile LAST_ONLY OUTPUT_VARIABLE outfile)
    configure_file(${infile} ${outfile})
endforeach()
