#!/bin/bash

# Set the directory where your files are located
directory="/root/myscripts"
destination="/root/myscripts/serverrotationfiles"

# Function to copy a file if it exists
copy_file_if_exists() {
    local file="$1"
    if [ -f "$file" ]; then
        cp "$destination/$file" "$directory"
        echo "File copied: $file"
        exit 0
    fi
}

# Loop through the last 3 days, starting from today
for i in {0..2}; do
    date_to_check=$(date -d "$i days ago" +"%Y-%m-%d")
    file=$(find "$destination" -type f -name "ssl.conf_$date_to_check" | head -n 1)
    copy_file_if_exists "$file"
done

# If no file was found
echo "No file found for today or the last two days."