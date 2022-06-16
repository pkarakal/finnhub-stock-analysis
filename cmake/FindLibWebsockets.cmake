#.rst:
# FindLibWebsockets
# -------------
# Finds libwebsockets library and sets up the compilation and linking flags
#
# This will define the following variable:
#
# WS_FOUND - A boolean that checks if libwebsockets library is found
# WS_LIBRARIES - A list of link flags to use to link to libwebsockets library
# WS_INCLUDE_DIR -  A string to indicate the root of libwebsockets.h library
# WS_INCLUDE_DIRS - A list of strings to indicate the directories to include

if(PKG_CONFIG_FOUND)
    pkg_check_modules(PC_LIBWS libwebsockets QUIET)
    get_filename_component(
            LIB_WEBSOCKETS_INSTALL_DIR
            ${PC_LIBWS_LIBRARY_DIRS}
            DIRECTORY
    )
    set(WS_LIBRABIES ${PC_LIBWS_LIBS})
    find_path(WS_INCLUDE_DIRS NAMES libwebsockets.h
            PATHS ${PC_LIBWS_INCLUDE_DIRS})
    include_directories(${WS_INCLUDE_DIRS} ${PC_LIBWS_PREFIX}
            ${PC_WS_LIBDIR} ${LIB_WEBSOCKETS_LIBRARY_DIRS})
    set(WS_LIBRARIES ${PC_LIBWS_LIBRARIES})
    set(WS_VERSION ${PC_LIBWS_VERSION})
    set(WS_FOUND TRUE)
    message("-- Found libwebsockets: ${WS_INCLUDE_DIRS} (found version ${PC_LIBWS_VERSION})")
else()
    find_path(WS_INCLUDE_DIR libwebsockets.h
            /usr/include/
            /usr/local/include/)
    set(WS_INCLUDE_DIRS /usr/local/include
            /usr/include)
    set(WS_LIBRABIES websockets)
    set(WS_FOUND TRUE)
    message("-- Found libwebsockets: ${WS_INCLUDE_DIR})")
endif()

mark_as_advanced(WS_LIBRARIES WS_INCLUDE_DIR WS_INCLUDE_DIRS WS_FOUND)
