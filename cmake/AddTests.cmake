function(add_tests library)
  set(options NONE)
  set(oneValueArgs DIRECTORY)
  set(multiValueArgs TEST_CASES)
  cmake_parse_arguments(ADD_TESTS_ARGS
    "${options}"
    "${oneValueArgs}"
    "${multiValueArgs}" 
    ${ARGN})

  foreach(test_source ${ADD_TESTS_ARGS_TEST_CASES})
    string(REGEX REPLACE "\.cpp$" "" target ${test_source})
    if (ADD_TESTS_ARGS_DIRECTORY)
      set(source ${ADD_TESTS_ARGS_DIRECTORY}/${test_source})
    else()
      set(source ${test_source})
    endif()

    add_executable(${target} ${source})
    target_link_libraries(${target} PRIVATE ${library} Catch::Main)
    add_test(NAME ${target} COMMAND ${target})
  endforeach()
endfunction()
