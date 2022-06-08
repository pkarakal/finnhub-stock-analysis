cmake_minimum_required(VERSION 3.10)
project(finnhub_stocks_analysis)

set(CMAKE_CXX_STANDARD 14)

option(ENABLE_CLANGTIDY "Enable clang-tidy support?" OFF)

if (ENABLE_CLANGTIDY)
    include(cmake/FindClangTidy.cmake)
endif ()

add_executable(finnhub_stocks_analysis main.cpp)
