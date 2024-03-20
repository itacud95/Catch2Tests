#!/bin/bash

# add any argument to clean 
if [ $# -gt 0 ]; then 
    if [ -d build ]; then
        echo "delete build"    
        rm -r build
    fi
    if [ -d dist ]; then
        echo "delete dist"
        rm -r dist
    fi
fi

if [ ! -f compile_commands.json ]; then
    ln -s build/compile_commands.json . 
fi

target_dir=TagsAndFilters

cmake -Bbuild -DCMAKE_INSTALL_PREFIX=dist -DCMAKE_EXPORT_COMPILE_COMMANDS=on $target_dir && \
cmake --build build -j$(nproc) && \
cmake --install build

./dist/tags_and_filters --filenames-as-tags --success
