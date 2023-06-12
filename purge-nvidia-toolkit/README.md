# Nvidia Driver and CUDA Toolkit Purge Script

This script is used to remove (purge) the Nvidia drivers and the Nvidia CUDA toolkit from a Linux system. This is useful when you want to replace your current Nvidia driver or CUDA toolkit with a different version.

## Description

The script will:

1. Ensure it is being run as root (required for these operations)
2. Purge the Nvidia driver
3. Remove Nvidia driver directories
4. Purge the Nvidia CUDA toolkit
5. Remove any remaining Nvidia and CUDA directories
6. Update the system
7. Run 'autoremove' to clean up any remaining unnecessary packages
8. Print a confirmation message that the process has been completed

## Getting Started

### Dependencies

* A Linux system with Nvidia driver and/or CUDA toolkit installed
* Bash shell environment

### Installing

* Save the script to a file, for example 'purge_nvidia.sh'
* Set execute permissions on your script: \`chmod +x purge_nvidia.sh\`

### Executing program

* Run the script with root privileges. For example:
```
sudo ./purge_nvidia.sh
```
You will be prompted to enter your password.

## Warnings

* This script will completely remove your Nvidia driver and CUDA toolkit, be sure that's what you want before running it.
* As this script needs to run with root privileges, ensure that you trust the source and understand what the script does before running it.
* Always back up any important data before making significant changes to your system.
