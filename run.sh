#!/bin/bash

apt-get update
sleep 1

apt-get upgrade -y
sleep 1

apt-get install -y nano

apt-get install -y qbittorrent-nox

apt-get install -y nginx

apt-get install -y screen

npm install --global http-server

supervisorctl stop all

curl -o /cloudclusters/zipfolder.sh https://raw.githubusercontent.com/VishveshC/cloudsetup/master/zipfolder.sh && chmod +x /cloudclusters/zipfolder.sh

screen -d -m http-server /cloudclusters -p 6969 -a 127.0.0.1

qbittorrent-nox -d

pkill -KILL qbittorrent

curl -o /root/.config/qBittorrent/qBittorrent.conf https://raw.githubusercontent.com/VishveshC/cloudsetup/master/qBittorrent.conf

git clone https://github.com/ntoporcov/iQbit.git

cd /cloudclusters/iQbit/release/public

cp index.html login.html

cd /cloudclusters

qbittorrent-nox -d

rm /cloudclusters/config/nginx/default.conf

curl -o /cloudclusters/config/nginx/default.conf https://raw.githubusercontent.com/VishveshC/cloudsetup/master/default.conf

nginx -t

service nginx restart

curl -s "https://api.telegram.org/bot6374163490:AAEpRNt8_ymZylHd0aBUtSSZgSHOLvbUVes/sendMessage?chat_id=1497506203&text=Setup%20finished.%0AWebsite:%20http://$(echo "$HOSTNAME" | sed 's/\(-runtimes\).*//')-0.cloudclusters.net"
sleep 1

exit 0
