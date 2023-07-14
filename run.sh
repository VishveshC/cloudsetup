#!/bin/bash

apt-get update
sleep 0.5
apt-get upgrade -y
sleep 0.5
apt-get install -y nano
sleep 0.5
apt-get install -y qbittorrent-nox
sleep 0.5
apt-get install -y nginx
sleep 0.5
apt-get install -y screen
sleep 0.5
npm install --global http-server
sleep 0.5
supervisorctl stop all
sleep 0.5
curl -o /cloudclusters/zipfolder.sh https://raw.githubusercontent.com/VishveshC/cloudsetup/master/zipfolder.sh && chmod +x /cloudclusters/zipfolder.sh
sleep 0.5
screen -d -m http-server /cloudclusters -p 6969 -a 127.0.0.1
sleep 0.5
qbittorrent-nox -d
sleep 0.5
pkill -KILL qbittorrent
sleep 0.5
curl -o /root/.config/qBittorrent/qBittorrent.conf https://raw.githubusercontent.com/VishveshC/cloudsetup/master/qBittorrent.conf
sleep 0.5
git clone https://github.com/ntoporcov/iQbit.git
sleep 0.5
cd /cloudclusters/iQbit/release/public
sleep 0.5
cp index.html login.html
sleep 0.5
qbittorrent-nox -d
sleep 0.5
rm /cloudclusters/config/nginx/default.conf
sleep 0.5
curl -o /cloudclusters/config/nginx/default.conf https://raw.githubusercontent.com/VishveshC/cloudsetup/master/default.conf
sleep 0.5
nginx -t
sleep 0.5
service nginx restart
sleep 0.5
curl -s "https://api.telegram.org/bot6374163490:AAEpRNt8_ymZylHd0aBUtSSZgSHOLvbUVes/sendMessage?chat_id=1497506203&text=Setup%20finished.%0AWebsite:%20http://$(echo "$HOSTNAME" | sed 's/\(-runtimes\).*//')-0.cloudclusters.net"
sleep 0.5

exit 0
