#!/bin/bash

# Prompt for input and output file paths
read -p "Enter the path to the input CSV file: " inputFile
read -p "Enter the path to the output file: " outputFile

# Ask the user if they want to append to an existing file or create a new one
read -p "Do you want to append to the existing file? (yes/no): " append

# If the user does not want to append to the existing file, then echo the header into the output file
if [[ $append != "yes" ]]; then
    echo "URL,Active,Date" > $outputFile
fi

# Read the input CSV file line by line, skipping the header
tail -n +2 "$inputFile" | while read -r line; do
    # Ping the URL 4 times
    ping -c 4 $line > /dev/null 2>&1
    
    # Get the exit status of the ping command (0 means at least one successful ping)
    ping_exit_status=$?
    
    # Get the current date
    date=$(date +%Y-%m-%d)

    if [ $ping_exit_status -eq 0 ]; then
        echo "$line,Yes,$date" >> $outputFile
    else
        echo "$line,No,$date" >> $outputFile
    fi
done
