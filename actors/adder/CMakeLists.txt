# C++ actors
add_executable(macro_cpp macro.cpp)
target_link_libraries(macro_cpp PRIVATE
    muscle          # muscle3
    ymmsl           # part of muscle3
)

add_executable(micro_cpp micro.cpp)
target_link_libraries(micro_cpp PRIVATE
    muscle          # muscle3
    ymmsl           # part of muscle3
)

# Fortran actors
add_executable(macro_fortran macro.f90)
target_link_libraries(macro_fortran PRIVATE
    muscle_fortran  # muscle3
    ymmsl_fortran   # muscle3
)

add_executable(micro_fortran micro.f90)
target_link_libraries(micro_fortran PRIVATE
    muscle_fortran  # muscle3
    ymmsl_fortran   # muscle3
)

# Process *.ymmsl.in files in workflows/adder directory
file(GLOB infiles ${PROJECT_SOURCE_DIR}/workflows/adder/*.ymmsl.in)
foreach(infile IN LISTS infiles)
    cmake_path(REMOVE_EXTENSION infile LAST_ONLY OUTPUT_VARIABLE outfile)
    configure_file(${infile} ${outfile})
endforeach()
