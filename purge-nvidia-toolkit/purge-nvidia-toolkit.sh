#!/bin/bash

# Ensure the script is being run as root
if [ "$EUID" -ne 0 ]
then echo "Please run as root"
    exit
fi

# Purge Nvidia driver
echo "Removing Nvidia driver..."
apt-get purge -y 'nvidia*'

# Remove Nvidia driver directories
rm -rf /etc/X11/xorg.conf
rm -rf /etc/X11/xorg.conf.d
rm -rf /etc/modprobe.d/blacklist-nvidia.conf
rm -rf /etc/modules-load.d/nvidia.conf

# Purge Nvidia toolkit (CUDA)
echo "Removing Nvidia CUDA Toolkit..."
apt-get purge -y 'cuda*'

# Remove any remaining Nvidia and CUDA directories
rm -rf /usr/local/cuda*

# Update the system
echo "Updating the system..."
apt-get update

# Autoremove to clean up any remaining unnecessary packages
echo "Running autoremove to clean up..."
apt-get autoremove -y

echo "All done. You can now install the specific Nvidia driver and CUDA version you want."

exit 0
