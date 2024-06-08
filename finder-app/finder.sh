#!/bin/bash

# Check if the required arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required (filesdir and searchstr)"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if the provided filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory"
    exit 1
fi

# Initialize counters
file_count=0
match_count=0

# Recursive function to search files
search_files() {
    local dir="$1"
    local files=("$dir"/*)
    for file in "${files[@]}"; do
        if [ -d "$file" ]; then
            search_files "$file"
        elif [ -f "$file" ]; then
            ((file_count++))
            match_count=$((match_count + $(grep -c "$searchstr" "$file")))
        fi
    done
}

# Call the recursive function to search files
search_files "$filesdir"

# Print the result
echo "The number of files are $file_count and the number of matching lines are $match_count"

