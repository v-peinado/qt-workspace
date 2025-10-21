set(SOURCES
    main.cpp
)

set(HEADERS
    # Add your headers here
)

add_executable(PROJECTNAME
    ${SOURCES}
    ${HEADERS}
)

target_include_directories(PROJECTNAME PRIVATE
    ${CMAKE_SOURCE_DIR}/include
)

target_link_libraries(PROJECTNAME PRIVATE
    Qt6::Core
    Qt6::Widgets
)

# Warnings
if(MSVC)
    target_compile_options(PROJECTNAME PRIVATE /W4)
else()
    target_compile_options(PROJECTNAME PRIVATE -Wall -Wextra -Wpedantic)
endif()