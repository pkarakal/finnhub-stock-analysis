cmake_minimum_required(VERSION 3.10)
project(finnhub_stocks_analysis LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "-fpermissive")

find_package(PkgConfig)

option(ENABLE_CLANGTIDY "Enable clang-tidy support?" OFF)

if (ENABLE_CLANGTIDY)
    include(cmake/FindClangTidy.cmake)
endif ()

include(cmake/FindBoost.cmake)
if(BOOST_FOUND)
    link_libraries(${BOOST_LIBRARIES})
    set(USE_BOOST 1)
endif()
include(cmake/FindJSON.cmake)
include(cmake/FindLibWebsockets.cmake)

configure_file(lib/definitions.h.in lib/definitions.h)

link_libraries(${JSON_LIBRARIES} ${PC_LIBWS_LIBRARIES})

add_executable(finnhub_stocks_analysis main.cpp)
