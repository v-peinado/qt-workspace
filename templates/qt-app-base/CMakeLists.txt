cmake_minimum_required(VERSION 3.16)
project(PROJECTNAME VERSION 1.0.0 LANGUAGES CXX)

# ============================================
# Project settings
# ============================================
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Qt settings
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# ============================================
# Dependencies
# ============================================
find_package(Qt6 REQUIRED COMPONENTS 
    Core
    Widgets
)

# ============================================
# Subdirectories
# ============================================
add_subdirectory(src)

# ============================================
# IDE support
# ============================================
set_property(GLOBAL PROPERTY USE_FOLDERS ON)