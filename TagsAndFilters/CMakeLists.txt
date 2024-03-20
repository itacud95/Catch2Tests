cmake_minimum_required(VERSION 3.28)
project(tags_and_filters)

add_subdirectory(../Catch2 Catch2)

add_executable(${PROJECT_NAME} 
    src/bar.cpp
    src/foo.cpp)

target_link_libraries(${PROJECT_NAME} PRIVATE Catch2WithMain)

install(TARGETS ${PROJECT_NAME} DESTINATION .)
