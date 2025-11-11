cmake_minimum_required(VERSION 3.16)
project(SimpleControl VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Concurrent)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appSimpleControl
    src/main.cpp
)

# ---- Collect QML & resources (single source of truth) ----
file(GLOB_RECURSE QML_FILES
    RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    content/*.qml
    content/*.ui.qml
)

file(GLOB_RECURSE RES_FILES
    RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    resources/*
)

file(GLOB_RECURSE SRC_FILES
    RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    src/*.cpp
    src/*.h
)


# ---- QML module (no duplicate QML_FILES arguments) ----
qt_add_qml_module(appSimpleControl
    URI SimpleControl
    VERSION 1.0
    QML_FILES ${QML_FILES}
    RESOURCES ${RES_FILES}
    SOURCES ${SRC_FILES}
)

# ---- Link Qt ----
target_link_libraries(appSimpleControl
    PRIVATE Qt6::Quick Qt6::Concurrent
)

# ---- Bundle settings ----
set_target_properties(appSimpleControl PROPERTIES
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
)

include(GNUInstallDirs)
install(TARGETS appSimpleControl
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

target_include_directories(appSimpleControl
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        ${CMAKE_CURRENT_SOURCE_DIR}/src/device
        ${CMAKE_CURRENT_SOURCE_DIR}/src/command
        ${CMAKE_CURRENT_SOURCE_DIR}/src/model
        ${CMAKE_CURRENT_SOURCE_DIR}/src/state
)
