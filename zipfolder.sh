#!/bin/bash

cd /cloudclusters/download
torrent_name="$1"
torrent_size="$2"

new_file_name=$(echo "$torrent_name" | tr " " "_")

tar -cvf "$new_file_name.tar" "$torrent_name"
sleep 0.5
rm -rf "$torrent_name"
sleep 0.5

curl -X POST -H "Content-Type: application/json" -d '{
  "chat_id": "1497506203",
  "text": "File path: http://'"$(echo "$HOSTNAME" | sed 's/\(-runtimes\).*//')"'-0.cloudclusters.net/download/'"$new_file_name"'.tar\nTorrent name: '"$torrent_name"'\nTorrent size: '"$(numfmt --to iec --format "%8.4f" "$torrent_size")"'"
}' https://api.telegram.org/bot6374163490:AAEpRNt8_ymZylHd0aBUtSSZgSHOLvbUVes/sendMessage
sleep 0.5

exit 0
