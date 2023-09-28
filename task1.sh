#!/bin/bash

function search_file() {
    local file_name="$1"
    local folder_name="$2"
    echo "Searching for: $file_name in folder: $folder_name"
    if [ -z "$file_name" ] || [ -z "$folder_name" ]; then
        echo "Usage: search_file <file_name> <folder_name>"
        return 1
    fi

    if [ ! -d "$folder_name" ]; then
        echo "Folder '$folder_name' does not exist."
        return 1
    fi

    for item in "$folder_name"/*; do
        if [ -f "$item" ] && [ "$(basename "$item")" == "$file_name" ]; then
            echo "File found at: $item"
        elif [ -d "$item" ]; then
            search_file "$file_name" "$item"
        fi
    done
}

if [ "$#" -ne 2 ]; then
    echo "Usage: search_file <file_name> <folder_name>"
    exit 1
fi

file_name="$1"
folder_name="$2"
search_file "$file_name" "$folder_name"

