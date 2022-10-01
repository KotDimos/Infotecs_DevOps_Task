PROJECT(my_sqlite3)
cmake_minimum_required(VERSION 2.8)

include_directories(${CMAKE_SOURCE_DIR}/sqlite-amalgamation-3260000)

add_library(my_sqlite3
            STATIC
            sqlite-amalgamation-3260000/sqlite3.c
            sqlite-amalgamation-3260000/sqlite3.h
            sqlite-amalgamation-3260000/sqlite3ext.h)

add_executable(my_sqlite
               sqlite-amalgamation-3260000/sqlite3.c
               sqlite-amalgamation-3260000/shell.c
               sqlite-amalgamation-3260000/sqlite3.h
               sqlite-amalgamation-3260000/sqlite3ext.h)

add_definitions(-DSQLITE_ENABLE_RTREE)
add_definitions(-DSQLITE_ENABLE_FTS4)
add_definitions(-DSQLITE_ENABLE_FTS5)
add_definitions(-DSQLITE_ENABLE_JSON1)
add_definitions(-DSQLITE_ENABLE_RBU)
add_definitions(-DSQLITE_ENABLE_STAT4)

include(FindThreads)
target_link_libraries(my_sqlite m ${CMAKE_THREAD_LIBS_INIT} ${CMAKE_DL_LIBS})
install(TARGETS my_sqlite RUNTIME DESTINATION bin)

install(FILES
	sqlite-amalgamation-3260000/sqlite3.h
	sqlite-amalgamation-3260000/sqlite3ext.h
	DESTINATION include)

install(TARGETS my_sqlite3 LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
