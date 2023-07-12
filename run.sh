apt update
apt upgrade -y
apt install -y qbittorrent-nox
apt install -y nginx
npm install --global http-server
curl -o /etc/nginx/sites-available/default https://raw.githubusercontent.com/VishveshC/cloudsetup/master/default
nginx -t
service start nginx
pm2 stop 0
pm2 delete 0
pm2 start "http-server -p 6969 -a 127.0.0.1"
curl -o /root/.config/qBittorrent/qBittorrent.conf https://raw.githubusercontent.com/VishveshC/cloudsetup/master/qBittorrent.conf
pm2 start "qbittorrent-nox --webui-port=6970 --webui-address=127.0.0.1"
pm2 save --force
curl -s "https://api.telegram.org/bot6374163490:AAEpRNt8_ymZylHd0aBUtSSZgSHOLvbUVes/sendMessage?chat_id=1497506203&text=Setup%20finished.%0AWebsite:%20http://$(echo "$HOSTNAME" | sed 's/\(-runtimes\).*//')-0.cloudclusters.net"
