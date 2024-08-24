#!/bin/bash

today=$(date +"%Y-%m-%d")
directory="/root/myscripts"
destination="/root/myscripts/serverrotationfiles"

# Function to display help message
if [ ! -f "${destination}/ssl.conf_${today}" ]; then
    cp -rp ${directory}/ssl.conf ${destination}/ssl.conf_${today}
    echo "taken master copy"
else
    echo "master copy is already there"
fi

# Check if any arguments were passed
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {server1|server2|all_in}"
    exit 1
fi

# Process the command-line argument
case $1 in
    server1)
        # Get today's date in YYYY-MM-DD format
        sed -i '/edppvlpxya01:2033/s/^/# /' ${directory}/ssl.conf
        echo "server1 taken out"
        ;;
    
    server2)
        # Search for files modified in the last 7 days
        sed -i '/edppvlpxya02:2033/s/^/# /' ${directory}/ssl.conf
        echo "server2 taken out"
        ;;
    
    all_in)
        if [ -f "${destination}/ssl.conf_${today}" ]; then
            echo "No file found with today's date."
        else
            echo "file is there"
        fi

        #cp -rp ${destination}/ssl.conf_$today ${directory}/ssl.conf
        #echo "all servers are in rotaion"
        ;;
    
    *)
        echo "Invalid option: $1"
        echo "Usage: $0 {server1|server2|all_in}"
        exit 1
        ;;
esac