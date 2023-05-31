# Ping Status Logger

This Bash script allows you to automate the process of pinging a list of URLs, logging their status (active or inactive), and recording the date of the ping. It can be useful for automating research for a seminar paper or tracking the availability of websites over time.

## Prerequisites

Before running the script, ensure you have the following:

- A Linux system with Bash installed.
- Basic knowledge of the Bash shell.

## Usage

1. Download the script to your Linux system.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable by running `chmod +x scriptname.sh`.
4. Run the script: `./scriptname.sh`.
5. Follow the prompts provided by the script. You will be asked for:
    - The path to the input CSV file containing the list of URLs to ping. The input file should have one URL per line.
    - The path to the output file where the ping results will be logged.
    - Whether you want to append to an existing file or create a new one. If you choose to append, ensure that the existing file has a header row with the columns: URL, Active, Date.
6. Once all prompts are answered, the script will start pinging the URLs, record the ping status (active or inactive), and add the current date to the log entry.
7. The script will save the results to the specified output file in CSV format.

## Example Input File Format

The input file should have the following format:

```
URL
www.example1.com
www.example2.com
www.example3.com
```


## Example Output File Format (if appending to an existing file)

The output file, if appending to an existing file, should have the following format:

```
URL,Active,Date
www.example1.com,Yes,2023-05-31
www.example2.com,No,2023-05-31
www.example3.com,Yes,2023-05-31
```

## Note

- The script was created to automate the research process for a seminar paper. I modified the script that I eventually used by hard coding in the file paths and making the script always append to a file. I then used the modified version of this script with `crontab` to automate tracking over time.
- The script uses the `ping` command to check the status of each URL. It sends four ICMP echo requests (`-c 4`) and discards the output (`> /dev/null 2>&1`) to prevent it from being displayed in the terminal.
- The script relies on the exit status of the `ping` command to determine the status (0 means at least one successful ping).
- Ensure that you have the necessary permissions to read the input file and write to the output file.