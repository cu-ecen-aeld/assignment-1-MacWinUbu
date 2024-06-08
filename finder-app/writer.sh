#!/bin/bash

# Check if the required arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required (writefile and writestr)"
    exit 1
fi

writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
dir=$(dirname "$writefile")
if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
fi

# Write the string to the file
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Failed to create or write to $writefile"
    exit 1
fi

echo "Successfully wrote to $writefile"