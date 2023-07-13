#!/bin/bash
cd /cloudclusters/download
# Get the torrent name, file path, root path, and save path from qBittorrent.
torrent_name="$1"
torrent_size="$2"

# Replace all the spaces in the filename with underscores.
new_file_name=$(echo "$torrent_name" | tr " " "_")

# Tar the folder and save it with the new name.
tar -cvf "$new_file_name.tar" "$torrent_name"

# Move the new tar file to the download directory.
# mv "$new_file_name.tar" /cloudclusters/download

# Delete the original folder.
rm -rf "$torrent_name"

# Curl the file path, torrent name, and torrent size to the telegram API.
curl -X POST -H "Content-Type: application/json" -d '{
  "chat_id": "1497506203",
  "text": "File path: http://'"$(echo "$HOSTNAME" | sed 's/\(-runtimes\).*//')"'-0.cloudclusters.net/download/'"$new_file_name"'.tar\nTorrent name: '"$torrent_name"'\nTorrent size: '"$(numfmt --to iec --format "%8.4f" "$torrent_size")"'"
}' https://api.telegram.org/bot6374163490:AAEpRNt8_ymZylHd0aBUtSSZgSHOLvbUVes/sendMessage

# Exit the script.
exit 0
