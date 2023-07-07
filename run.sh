apt update
apt upgrade -y
apt install -y qbittorrent-nox
pm2 stop 0
pm2 delete 0
curl -o /root/.config/qBittorrent/qBittorrent.conf https://raw.githubusercontent.com/VishveshC/cloudsetup/master/qBittorrent.conf
pm2 start "qbittorrent-nox"
pm2 save --force
curl -s "https://api.telegram.org/bot6374163490:AAEpRNt8_ymZylHd0aBUtSSZgSHOLvbUVes/sendMessage?chat_id=1497506203&text=Setup%20finished.%0AWebsite:%20http://$(curl -s https://api.ipify.org)"
