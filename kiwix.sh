# Masuk sebagai superuser (root) terlebih dahulu, agar mempermudah proses installasi. 

sudo apt install apache2 php php-xmlrpc php-mysql php-gd php-cli php-curl -y

cd /usr/local/src/
wget https://download.kiwix.org/release/kiwix-tools/kiwix-tools_linux-armhf.tar.gz
wget https://download.kiwix.org/release/kiwix-tools/kiwix-tools_linux-armhf-3.3.0-1.tar.gz

wget https://download.kiwix.org/zim/wikipedia/wikipedia_id_all_maxi_2022-05.zim
wget https://download.kiwix.org/zim/wikipedia/wikipedia_id_all_nopic_2022-05.zim

tar zxvf kiwix-tools_linux-armhf-3.3.0-1.tar.gz
mv kiwix-tools_linux-armhf-3.3.0-1/kiwix-* /usr/local/bin/
chmod -Rf 777 /usr/local/bin
chown -Rf nobody: /usr/local/bin

cd /usr/local/bin/
./kiwix-serve --port=8080 /usr/local/src/wikipedia_id_all_maxi_2022-05.zim &
./kiwix-serve --port=8181 /usr/local/src/wikipedia_id_all_nopic_2022-05.zim &





