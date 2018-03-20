include(CTest)
set(CATCH_DOWNLOAD_PREFIX ${CMAKE_BINARY_DIR}/external/catch-download)
set(CATCH_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/external/catch)

if(BUILD_TESTING)
  configure_file(${CMAKE_SOURCE_DIR}/cmake/Catch-CMakeLists.txt.in ${CATCH_DOWNLOAD_PREFIX}/CMakeLists.txt)
  execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
    RESULT_VARIABLE result
    WORKING_DIRECTORY ${CATCH_DOWNLOAD_PREFIX})

  if(result)
    message(FATAL_ERROR "Configure step for catch failed: ${result}")
  endif()

  execute_process(COMMAND ${CMAKE_COMMAND} --build .
    RESULT_VARIABLE result
    WORKING_DIRECTORY ${CATCH_DOWNLOAD_PREFIX})

  if(result)
    message(FATAL_ERROR "Download step for catch failed: ${result}")
  endif()

  add_library(CatchLibrary INTERFACE)
  target_include_directories(CatchLibrary INTERFACE ${CATCH_INSTALL_PREFIX}/include)

  add_library(CatchMain STATIC ${CATCH_INSTALL_PREFIX}/catch_main.cpp)
  target_link_libraries(CatchMain PUBLIC CatchLibrary)
  add_library(Catch::Catch ALIAS CatchLibrary)
  add_library(Catch::Main ALIAS CatchMain)

  enable_testing()
endif()
