# Samba Configuration Bash Script

This bash script is intended to simplify the process of setting up a Samba share on a Linux system. It automates many of the necessary steps, including directory creation, setting permissions, backing up the existing Samba configuration, creating a new Samba user, and adding a new share definition to the Samba configuration file.

## Prerequisites

Before you run the script, ensure you have the following:

    A Linux system with Samba installed.
    Administrative access (the script will need to be run with sudo or as root to modify Samba's configuration and restart the service).

## Usage

    Download the script to your Linux system.

    Open a terminal and navigate to the directory containing the script.

    Make the script executable by running `chmod +x scriptname.sh`.

    Run the script with administrative privileges: `sudo ./scriptname.sh`.

    Follow the prompts provided by the script. You will be asked for:

        The path to the directory you want to share. If the directory does not already exist, the script will create it for you.

        The owner and group for the shared directory.

        Whether you want to backup your existing smb.conf file. If you choose to do so, you will be asked for the backup directory.

        Whether you want to create a new Samba user. If you choose not to, you will be asked to provide the name of an existing Samba user.

    After all prompts have been answered, the script will add a new share definition to your smb.conf file and restart the Samba service.

## Note

This script sets the shared directory permissions to 777 (read, write, and execute for owner, group, and others). Please consider your security requirements and modify the script as needed.