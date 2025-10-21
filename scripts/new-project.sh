#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: ./scripts/new-project.sh ProjectName"
    exit 1
fi

PROJECT_NAME="$1"
WORKSPACE_ROOT="$(dirname $(dirname $(readlink -f $0)))"
TEMPLATE_DIR="$WORKSPACE_ROOT/templates/qt-app-base"
PROJECTS_DIR="$WORKSPACE_ROOT/projects"
NEW_PROJECT="$PROJECTS_DIR/$PROJECT_NAME"

echo "Creating new project: $PROJECT_NAME"

# Copy template
cp -r "$TEMPLATE_DIR" "$NEW_PROJECT"

# Rename
cd "$NEW_PROJECT"
./scripts/rename_project.sh "$PROJECT_NAME"

echo ""
echo "✓ Project created at: $NEW_PROJECT"
echo ""
echo "Next steps:"
echo "  cd $NEW_PROJECT"
echo "  mkdir build && cd build"
echo "  cmake .. -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64"
echo "  make"