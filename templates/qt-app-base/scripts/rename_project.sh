#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: ./scripts/rename_project.sh NewProjectName"
    exit 1
fi

OLD_NAME="PROJECTNAME"
NEW_NAME="$1"

echo "Renaming project from $OLD_NAME to $NEW_NAME..."

# Rename in files
find . -type f -not -path "./.git/*" -not -path "./build/*" -exec sed -i "s/$OLD_NAME/$NEW_NAME/g" {} +

# Rename directory
if [ -d "include/$OLD_NAME" ]; then
    mv "include/$OLD_NAME" "include/$NEW_NAME"
fi

echo "✓ Project renamed to $NEW_NAME"
echo "Next steps:"
echo "  1. mkdir build && cd build"
echo "  2. cmake .. -DCMAKE_PREFIX_PATH=~/Qt/6.9.3/gcc_64"
echo "  3. make"