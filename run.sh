#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get install -y qbittorrent-nox
apt-get install -y nginx
apt-get install -y screen
npm install --global http-server
supervisorctl stop all
rm /root/.config/qBittorrent/qBittorrent.conf
curl -o /cloudclusters/zipfolder.sh https://raw.githubusercontent.com/VishveshC/cloudsetup/master/zipfolder.sh && chmod +x /cloudclusters/zipfolder.sh
screen -d -m http-server /cloudclusters -p 6969 -a 127.0.0.1
screen -d -m 'yes | qbittorrent-nox'
curl -o /root/.config/qBittorrent/qBittorrent.conf https://raw.githubusercontent.com/VishveshC/cloudsetup/master/qBittorrent.conf
rm /cloudclusters/config/nginx/default.conf
curl -o /cloudclusters/config/nginx/default.conf https://raw.githubusercontent.com/VishveshC/cloudsetup/master/default.conf
nginx -t
service nginx restart
curl -s "https://api.telegram.org/bot6374163490:AAEpRNt8_ymZylHd0aBUtSSZgSHOLvbUVes/sendMessage?chat_id=1497506203&text=Setup%20finished.%0AWebsite:%20http://$(echo "$HOSTNAME" | sed 's/\(-runtimes\).*//')-0.cloudclusters.net"

exit 0
