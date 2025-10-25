#!/bin/bash

# Build helper con opciones
# Usage: ./build.sh [Debug|Release] [--clean] [--run]

BUILD_TYPE=${1:-Debug}  # Debug por defecto (entorno de desarrollo)
CLEAN=false
RUN=false

# Procesar argumentos
for arg in "$@"; do
    case $arg in
        --clean)
            CLEAN=true
            ;;
        --run)
            RUN=true
            ;;
        Debug|Release)
            BUILD_TYPE=$arg
            ;;
    esac
done

echo "========================================"
echo "Building in $BUILD_TYPE mode"
if [ "$CLEAN" = true ]; then
    echo "Clean build enabled"
fi
echo "========================================"

# Clean si se solicita
if [ "$CLEAN" = true ] && [ -d "build" ]; then
    echo "Cleaning build directory..."
    rm -rf build/*
fi

# Crear build si no existe
if [ ! -d "build" ]; then
    echo "Creating build directory..."
    mkdir build
fi

cd build

echo "Configuring with CMake..."
cmake .. -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64 -DCMAKE_BUILD_TYPE=$BUILD_TYPE

if [ $? -ne 0 ]; then
    echo "❌ CMake configuration failed"
    exit 1
fi

echo "Building..."
cmake --build . -j$(nproc)

if [ $? -ne 0 ]; then
    echo "❌ Build failed"
    exit 1
fi

# Buscar el ejecutable
EXECUTABLE=$(find . -maxdepth 1 -type f -executable | head -n 1)

echo ""
echo "✓ Build complete ($BUILD_TYPE)"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -n "$EXECUTABLE" ]; then
    echo "Run with:"
    echo "  $EXECUTABLE"
    
    # Ejecutar si se solicita
    if [ "$RUN" = true ]; then
        echo ""
        echo "Running..."
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        $EXECUTABLE
    fi
else
    echo "Run with:"
    echo "  ./build/<executable>"
fi
echo ""
echo "Or open in Qt Creator:"
echo "  qtcreator CMakeLists.txt &"
echo "  Then press Ctrl+R"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"