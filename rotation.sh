#!/bin/bash


# Set the directory where your files are located
directory="/path/to/your/files"

# Get today's date in YYYY-MM-DD format
today=$(date +"%Y-%m-%d")

# Search for a file with today's date
file=$(find "$directory" -type f -name "ssl.conf_${today}")

if [ -z "$file" ]; then
  echo "No file found with today's date."

  # If no file is found, search for older files
  # You can adjust the `-mtime` value as needed (e.g., 7 for a week)
  file=$(find "$directory" -type f -mtime -7 -print | head -n 1)

  if [ -n "$file" ]; then
    echo "Found older file: $file"
  else
    echo "No recent files found."
  fi
else
  echo "Found today's file: $file"
fi

# Copy the file to a destination directory
destination="/path/to/destination"
if [ -n "$file" ]; then
  cp "$file" "$destination"
  echo "File copied to $destination"
else
  echo "No file to copy."
fi