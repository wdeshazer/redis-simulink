find_package(Python3 COMPONENTS Interpreter)

set(test_ld_library_path ${imas_LIBRARY_DIRS}:${muscle_LIBRARY_DIRS}:$ENV{LD_LIBRARY_PATH} )
message(STATUS "LD_LIBRARY_PATH for ctest: ${test_ld_library_path}")


# tests for helloworld actor
foreach(macro python cpp fortran)
    foreach(micro python cpp fortran)
        file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/helloworld_${macro}_${micro})
        add_test(
            NAME helloworld_${macro}_${micro}
            COMMAND muscle_manager --start-all
                --log-level DEBUG
                ${PROJECT_SOURCE_DIR}/workflows/helloworld/helloworld.ymmsl
                ${PROJECT_SOURCE_DIR}/workflows/helloworld/helloworld_impl_macro_${macro}.ymmsl
                ${PROJECT_SOURCE_DIR}/workflows/helloworld/helloworld_impl_micro_${micro}.ymmsl
            # explicitly provide a different working directory for each test, so they can run in parallel
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/helloworld_${macro}_${micro}
        )
        set_property(TEST helloworld_${macro}_${micro} PROPERTY ENVIRONMENT "LD_LIBRARY_PATH=${test_ld_library_path}")
    endforeach()
endforeach()


# tests for adder actor
set(adder_actors python cpp fortran)
# check if matlab is available
find_package(Matlab)
if( Matlab_FOUND )
    list(APPEND adder_actors matlab)
endif()

foreach(macro IN LISTS adder_actors)
    foreach(micro IN LISTS adder_actors)
        file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/adder_${macro}_${micro})
        add_test(
            NAME adder_${macro}_${micro}
            COMMAND muscle_manager --start-all
                --log-level DEBUG
                ${PROJECT_SOURCE_DIR}/workflows/adder/adder.ymmsl
                ${PROJECT_SOURCE_DIR}/workflows/adder/adder_impl_macro_${macro}.ymmsl
                ${PROJECT_SOURCE_DIR}/workflows/adder/adder_impl_micro_${micro}.ymmsl
            # explicitly provide a different working directory for each test, so they can run in parallel
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/adder_${macro}_${micro}
        )
        set_property(TEST adder_${macro}_${micro} PROPERTY ENVIRONMENT "LD_LIBRARY_PATH=${test_ld_library_path}")
    endforeach()
endforeach()
