#!/bin/bash

# Telegram bot token and chat ID
bot_token="YOUR_BOT_TOKEN"
chat_id="YOUR_CHAT_ID"

# Path to the tar file
tar_file="/path/to/tar_file.tar"

# Extract file name without path
file_name=$(basename "$tar_file")

# Calculate file size in bytes
file_size=$(stat -c%s "$tar_file")

# Calculate file size in gigabytes with one decimal point precision
file_size_gb=$(awk -v size="$file_size" 'BEGIN{ printf "%.1f", size/1024/1024/1024 }')

# Category
category="YOUR_CATEGORY"

# Generate the automatic download link
download_link="https://yourwebsite.com/download/$file_name"

# Create the message with properties
message="File Name: $file_name
File Size: $file_size_gb GB
Category: $category
Download: $download_link"

# Send the message using Telegram bot API
curl -s -X POST "https://api.telegram.org/bot$bot_token/sendMessage" -d "chat_id=$chat_id" -d "text=$message"
