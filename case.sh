#!/bin/bash

today=$(date +"%Y-%m-%d")
directory=""
destination=""

# Function to display help message

# Check if any arguments were passed
if [ $# -eq 0 ]; then
    echo "No arguments provided."
    exit 1
fi

# Process the command-line argument
case $1 in
    server1)
        # Get today's date in YYYY-MM-DD format
         sed -i '/edppvlpxya01:2033/s/^/# /' ssl.conf

        ;;
    
    server2)
        # Search for files modified in the last 7 days
         sed -i '/edppvlpxya02:2033/s/^/# /' ssl.conf
        ;;
    
    all_in)
        ;;
    
    *)
        echo "Invalid option: $1"
        echo "Usage: $0 {server1|server2|all_in}
        exit 1
        ;;
esac