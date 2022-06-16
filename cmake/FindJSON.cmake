#.rst:
# FindJSON
# -------------
# Finds nlohmann_json library and sets up the compilation and linking flags
#
# This will define the following variable:
#
# JSON_FOUND - A boolean that checks if nlohmann_json library is found
# JSON_LIBRABIES - A list of link flags to use to link to nlohmann_json library
# JSON_INCLUDE_DIR - A string to indicate the root of nlohmann/json.hpp library
# JSON_INCLUDE_DIRS - A list of strings to indicate the directories to include

if(PKG_CONFIG_FOUND)
    pkg_check_modules(PC_JSON nlohmann_json QUIET)
    set(JSON_LIBRABIES ${PC_JSON_INCLUDE_DIRS})
    find_path(JSON_INCLUDE_DIRS NAMES nlohmann/json.hpp
            PATHS ${PC_JSON_INCLUDE_DIRS})
    include_directories(${PC_JSON_INCLUDE_DIRS} ${PC_JSON_PREFIX}
            ${PC_JSON_LIBDIR})
    set(JSON_LIBRARIES ${PC_JSON_LIBRARIES})
    set(JSON_VERSION ${PC_JSON_VERSION})
    set(JSON_FOUND TRUE)
    message("-- Found nlohmann_json: ${JSON_INCLUDE_DIRS} (found version ${PC_JSON_VERSION})")
else()
    find_package(nlohmann_json 3.10.0 REQUIRED)
    find_path(JSON_INCLUDE_DIR nlohmann/json.hpp
            /usr/local/include
            /usr/include)
    set(JSON_LIBRABIES nlohmann_json::nlohmann_json)
    set(JSON_FOUND TRUE)
    message("-- Found nlohmann_json: ${JSON_INCLUDE_DIR} (found version ${})")
endif()

mark_as_advanced(JSON_LIBRABIES JSON_INCLUDE_DIR JSON_INCLUDE_DIRS JSON_FOUND)
