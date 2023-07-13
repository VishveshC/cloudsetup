#!/bin/bash

# Telegram bot token and chat ID
bot_token="6374163490:AAEpRNt8_ymZylHd0aBUtSSZgSHOLvbUVes"
chat_id="1497506203"

# Set the download folder path
download_folder="/cloudclusters/download"

# Get the current directory
current_dir="%F"

# Extract the base folder name
base_folder="$(basename "$current_dir")"

# Replace spaces with underscores in the base folder name
new_base_folder="${base_folder// /_}"

# Create the tar file path
tar_file_path="$download_folder/$new_base_folder.tar"

# Create a tar archive without compression
tar -cf "$tar_file_path" -C "$current_dir" .

# Print out the file path
echo "Tar archive created: $tar_file_path"

# Remove the original directory
rm -r "$current_dir"

# Print message after deletion
echo "Original folder deleted: $current_dir"

# Path to the tar file
tar_file="$tar_file_path"

# Extract file name without path
file_name=$(basename "$tar_file")

# Calculate file size in bytes
file_size=$(stat -c%s "$tar_file")

# Calculate file size in gigabytes with one decimal point precision
file_size_gb=$(awk -v size="$file_size" 'BEGIN{ printf "%.1f", size/1024/1024/1024 }')

# Category
category="%L"

# Generate the automatic download link
download_link="http://$(echo "$HOSTNAME" | sed 's/\(-runtimes\).*//')-0.cloudclusters.net/download/$file_name"

# Create the message with properties
message="File Name: $file_name
File Size: $file_size_gb GB
Category: $category
Download: $download_link"

# Send the message using Telegram bot API
curl -s -X POST "https://api.telegram.org/bot$bot_token/sendMessage" -d "chat_id=$chat_id" -d "text=$message"
