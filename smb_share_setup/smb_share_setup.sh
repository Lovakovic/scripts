#!/bin/bash

# Prompt user for directory
read -p "Enter the directory path to share: " share_dir

# Create directory if it does not exist
if [ ! -d "$share_dir" ]; then
  echo "Directory does not exist. Creating now..."
  mkdir -p "$share_dir"
  echo "Directory created"
else
  echo "Directory exists."
fi

# Prompt user for group and owner
read -p "Enter the owner of the directory: " dir_owner
read -p "Enter the group of the directory: " dir_group

# Set directory permissions and ownership
chown -R $dir_owner:$dir_group "$share_dir"
chmod -R 0777 "$share_dir"

# Ask if user wants to backup smb.conf
read -p "Would you like to backup the Samba configuration file? (y/n): " backup_choice
if [ "$backup_choice" == "y" ]; then
  read -p "Enter backup directory: " backup_dir
  cp /etc/samba/smb.conf "$backup_dir"/smb.conf.bak
  echo "Backup of smb.conf created at $backup_dir/smb.conf.bak"
fi

# Check if user wants to support SMBv1
read -p "Would you like to support the legacy version of SMB protocol (SMBv1)? (y/n): " smb1_choice
if [ "$smb1_choice" == "y" ]; then
  if ! grep -q "client min protocol = NT1" /etc/samba/smb.conf; then
    sed -i '/\[global\]/a \   client min protocol = NT1' /etc/samba/smb.conf
    echo "SMBv1 support enabled."
  else
    echo "SMBv1 support is already enabled."
  fi
fi

# Check if user wants to create a new Samba user
read -p "Would you like to create a new Samba user? (y/n): " user_choice
if [ "$user_choice" == "y" ]; then
  read -p "Enter new Samba username: " samba_user
  smbpasswd -a $samba_user
else
  read -p "Enter existing Samba username: " samba_user
fi

# Append to the Samba configuration
{
  echo "[${samba_user}_share]"
  echo "   path = ${share_dir}"
  echo "   read only = no"
  echo "   browsable = yes"
  echo "   valid users = ${samba_user}"
  echo "   create mask = 0777"
  echo "   directory mask = 0777"
  echo "   force user = ${dir_owner}"
  echo "   force group = ${dir_group}"
} >> /etc/samba/smb.conf

# Restart Samba service
systemctl restart smbd
echo "Samba has been restarted and the new configurations have been loaded."
