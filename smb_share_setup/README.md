# Samba Configuration Bash Script

This bash script is intended to simplify the process of setting up a Samba share on a Linux system. It automates many of the necessary steps, including directory creation, setting permissions, backing up the existing Samba configuration, creating a new Samba user, adding a new share definition to the Samba configuration file and configuring SMBv1 protocol.

## Prerequisites

Before you run the script, ensure you have the following:

    - A Linux system with Samba installed.
    - Administrative access (the script will need to be run with sudo or as root to modify Samba's configuration and restart the service).

## Usage

1. Download the script to your Linux system.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable by running \`chmod +x scriptname.sh\`.
4. Run the script with administrative privileges: \`sudo ./scriptname.sh\`.
5. Follow the prompts provided by the script. You will be asked for:
    - The path to the directory you want to share. If the directory does not already exist, the script will create it for you.
    - The owner and group for the shared directory.
    - Whether you want to backup your existing smb.conf file. If you choose to do so, you will be asked for the backup directory.
    - Whether you want to create a new Samba user. If you choose not to, you will be asked to provide the name of an existing Samba user.
    - Whether you want to support the SMBv1 protocol. If you choose yes, the script will add the line \`client min protocol = NT1\` under the \[global\] section in the smb.conf file if it doesn't already exist.
6. After all prompts have been answered, the script will add a new share definition to your smb.conf file and restart the Samba service.

## Note

This script sets the shared directory permissions to 777 (read, write, and execute for owner, group, and others). Please consider your security requirements and modify the script as needed.

Moreover, note that SMBv1 is known for having multiple security issues. Enabling it may pose security risks. It should only be enabled if absolutely necessary and if your network is properly secured.
