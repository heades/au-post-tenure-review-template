#!/bin/bash

build_dir="$1"
layout_dir="$2"
md_file="$3"

if [[ -z $build_dir || -z $layout_dir || -z "$md_file" ]]; then
    echo "Usage: $0 <build directory> <layout directory> <filename.md>"
    exit -1
fi

if [[ ! -e $md_file  ]]; then
    echo "Error: $md_file doesn't exist."
    exit -1
fi

if [[ ! -e $layout_dir  ]]; then
    echo "Error: $layout_dir doesn't exist."
    exit -1
fi

default_layout="$layout_dir/default.tex"
if [[ ! -e $default_layout  ]]; then
    echo "Error: The default layout $default_layout doesn't exist."
    exit -1
fi

layout="$default_layout"

# Test to see if a custom layout exists:
if [[ -e "$layout_dir/$md_name.tex" ]]; then
    layout="$layout_dir/$md_name.tex"
fi

# Make sure the build directory exists:
if [[ ! -e $build_dir  ]]; then
    mkdir $build_dir # Create it if it doesn't
fi

md_filename=$(basename "$md_file")
md_name="${md_filename%.*}"

pandoc --pdf-engine=xelatex -N --citeproc --template=$layout -o "$build_dir/$md_name.pdf" $md_file

