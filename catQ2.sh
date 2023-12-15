#!/bin/bash

# Check if a filename is provided as a command line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

# Check if the file exists
if [ -e "$filename" ]; then
    echo "File '$filename' exists."

    # Check if the file is a regular file
    if [ -f "$filename" ]; then
        echo "Type: Regular File"
        echo "Permissions: $(stat -c %A "$filename")"
        echo "Size: $(stat -c %s "$filename") bytes"
        echo "Last Modification Time: $(stat -c %y "$filename")"

    # Check if the file is a directory
    elif [ -d "$filename" ]; then
        echo "Type: Directory"
        num_files=$(find "$filename" -maxdepth 1 -type f | wc -l)
        num_subdirectories=$(find "$filename" -maxdepth 1 -type d | wc -l)
        echo "Number of Files: $num_files"
        echo "Number of Subdirectories: $((num_subdirectories - 1))" # Exclude the directory itself

    else
        echo "Type: Unknown"
    fi

else
    echo "File '$filename' does not exist."
fi


