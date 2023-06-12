# Ubuntu System Update and Clean-up Script

This script is used to update and clean-up an Ubuntu system. It is useful for maintaining the system updated and clean from unnecessary packages.

## Description

The script will:

1. Ensure it is being run as root (required for these operations)
2. Update the package list
3. Upgrade all installed packages
4. Remove no longer required packages
5. Update Snap applications

## Getting Started

### Dependencies

* An Ubuntu or Debian-based system
* Bash shell environment
* Snap package manager installed

### Installing

* Save the script to a file, for example 'update_system.sh'
* Set execute permissions on your script: `chmod +x update_system.sh`

### Executing program

* Run the script with root privileges. For example: `sudo ./update_system.sh`

You will be prompted to enter your password.

### Cerating a Bash Command

You can make your script accessible as a command from anywhere in the system by creating a symbolic link in /usr/bin. To do this, follow the steps below:

1. Navigate to the directory where your script is stored. For example: `cd /path/to/your/script`
2. Make a symbolic link to your script in /usr/bin. Replace update_system.sh with your script's name and update_system with the command you want to create: `sudo ln -s $PWD/update_system.sh /usr/bin/update_system`

Now you can run your script from anywhere just by typing `update_system` in your terminal.

### Running the Script Automatically Using Cron

To set up a cron job for running your script automatically at specified intervals, follow these steps:

1. Open your crontab file: `crontab -e`
2. Add a line at the end of the file that describes when and how the script should be run. The structure of the line is as follows: `* * * * * command-to-be-executed`
    
    Here's what each field represents:

        Minute (0 - 59)
        Hour (0 - 23)
        Day of month (1 - 31)
        Month (1 - 12)
        Day of week (0 - 7) (Sunday=0 or 7)

    For example, to run your script every day at 3:00 AM, add: `0 3 * * * /usr/bin/update_system`

    Remember to replace /usr/bin/update_system with the path to your script.

3. Save and close the file. Your cron job is now set up and will run as specified.

So, if you want to run your script every day at 3:00 AM, you could add: `0 3 * * * /usr/bin/update_system`

## Warnings

* This script will update all installed packages on your system. Be sure to check what updates are being applied and ensure they will not disrupt your system operation before running it.
* As this script needs to run with root privileges, ensure that you trust the source and understand what the script does before running it.
* Always back up any important data before making significant changes to your system.

