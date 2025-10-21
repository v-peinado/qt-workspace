#!/bin/bash

# Build helper con opciones
# Usage: ./build.sh [Debug|Release]

BUILD_TYPE=${1:-Debug}

echo "========================================"
echo "Building in $BUILD_TYPE mode"
echo "========================================"

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

echo ""
echo "✓ Build complete ($BUILD_TYPE)"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Run with:"
echo "  ./build/<executable>"
echo ""
echo "Or open in Qt Creator:"
echo "  qtcreator CMakeLists.txt &"
echo "  Then press Ctrl+R"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"