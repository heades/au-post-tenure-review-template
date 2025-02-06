#!/bin/bash

build_dir="$1"
layout_dir="$2"
md_file="$3"
md_filename=$(basename "$md_file")
md_name="${md_filename%.*}"
debug_mode=0

if [[ -z $build_dir || -z $layout_dir || -z "$md_file" ]]; then
    echo "Usage: $0 <build directory> <layout directory> <filename.md>">&2
    exit 1
fi

if [[ ! -e $md_file  ]]; then
    echo "Error: $md_file doesn't exist.">&2
    exit 1
fi

if [[ ! -e $layout_dir  ]]; then
    echo "Error: $layout_dir doesn't exist.">&2
    exit 1
fi

default_layout="$layout_dir/default.tex"
if [[ ! -e $default_layout  ]]; then
    echo "Error: The default layout $default_layout doesn't exist.">&2
    exit 1
fi

layout="$default_layout"

if [[ "$debug_mode" -eq 1 ]]; then
    echo "Markdown filename: $md_name"
fi
# Test to see if a custom layout exists:
if [[ -e "$layout_dir/$md_name.tex" ]]; then
    layout="$layout_dir/$md_name.tex"
fi

# Make sure the build directory exists:
if [[ ! -e $build_dir  ]]; then
    mkdir "$build_dir" # Create it if it doesn't
fi

if [[ "$debug_mode" -eq 1 ]]; then
    echo "Using layout: $layout"
fi

# Strips comments in the form of '!-- comment' before processing:
sed '/\s*\$--/d' "$md_file" | pandoc --pdf-engine=xelatex -N --citeproc --template="$layout" -o "$build_dir/$md_name.pdf"
