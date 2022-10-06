# Kiwix
<b>Kiwix</b> adalah perangkat lunak bebas yang digunakan untuk membaca Wikipedia secara luar jaringan (offline), artinya tidak memerlukan koneksi internet. Hal ini dilakukan dengan membaca seluruh konten tersebut dari sebuah berkas berformat ZIM yang berisi data/konten Wikipedia yang telah dikompresi terlebih dahulu.

Kiwix memungkinkan kita untuk menjalankan server Wikipedia secara OFFLINE. Kiwix tersedia untuk di download secara gratis, termasuk copy wikipedia terbaru dari berbagai bahasa.


# SAYA MEMPUNYAI 2 PILIHAN PROSES INSTAlLASI

<b><h2> 1. Installasi dengan bash shell (.sh) installasi jadi lebih mudah dan auto selesai dengan sendirinya. </b></h2>

<b>Disarankan masuk sebagai superuser (root) terlebih dahulu, agar mempermudah ketika proses penginstalan.

Dengan perintah : </b>
```
sudo su
```
atau
```
su
```
install git terlebih dahulu (jika belum install) :
```
apt install git
```
Download atau clone repo gitnya terlebih dahulu :
```
git clone https://github.com/arifzxc/kiwix
```
masuk ke dalam directory terlebih dahulu :
```
cd kiwix/
```
Menjalankan bash shell:
```
sh kiwix.sh
```
<b>Selesai, untuk cara mengaksesnya bisa scroll ke bawah.</b>


<b><h2> 2. Dengan command line copy paste manual, silahkan ikuti perintah dibawah ini. </b></h2>

# DOWNLOAD BAHAN-BAHAN

<b> Masuk sebagai superuser (root) terlebih dahulu, agar mempermudah ketika proses installasi.</b>
```
sudo su
```
atau 
```
su
```
install extension pendukung (buat jaga-jaga)

```
apt install apache2 php php-xmlrpc php-mysql php-gd php-cli php-curl -y
```

Masuk ke directory user, untuk menyimpan bahan kiwix:
```
cd /usr/local/src/
```
Download bahan kiwix:
```
wget https://download.kiwix.org/release/kiwix-tools/kiwix-tools_linux-armhf.tar.gz
wget https://download.kiwix.org/release/kiwix-tools/kiwix-tools_linux-armhf-3.3.0-1.tar.gz
```
File copy Wikipedia tersedia dalam format .zim. Copy Wikipedia yang terbaru dapat download dengan mudah melalui situs dibawah ini, bisa memilih sendiri berbagai bahasa, ada yang tanpa foto, ada yang full seperti wikipedia (lengkap ada foto, dll.) tinggal disesuaikan sesuai keinginan. 
```
https://download.kiwix.org/zim/wikipedia/
```
Untuk download file copy terbaru saat ini dalam Bahasa Indonesia yang versi lengkap dan yang tanpa foto, bisa mengikuti perintah dibawah ini:
```
wget https://download.kiwix.org/zim/wikipedia/wikipedia_id_all_maxi_2022-05.zim
wget https://download.kiwix.org/zim/wikipedia/wikipedia_id_all_nopic_2022-05.zim
```
# PROSES PENGINSTALAN

Masuk ke directory yang tadi digunakan untuk menyimpan file kiwix:
```
cd /usr/local/src
```
extract file tar.gz, dengan perintah:
```
tar zxvf kiwix-tools_linux-armhf-3.3.0-1.tar.gz
```
Pindahkan file yang sudah di extract ke /usr/local/bin:
```
mv kiwix-tools_linux-armhf-3.3.0-1/kiwix-* /usr/local/bin/
```
Kasih permission ke /usr/local/bin/:
```
chmod -Rf 777 /usr/local/bin
chown -Rf nobody: /usr/local/bin
```

# CARA MENJALANKAN KIWIX

Untuk menjalankan Kiwix, masing-masing file wikipedia yang ingin dijalankan perlu di set untuk di operasi di nomor port yang berbeda. Di bawah ini dijalankan dua file .zim kiwix pada nomor port 8080 dan 8181 sebagai berikut:
```
cd /usr/local/bin/
./kiwix-serve --port=8080 /usr/local/src/wikipedia_id_all_maxi_2022-05.zim &
./kiwix-serve --port=8181 /usr/local/src/wikipedia_id_all_nopic_2022-05.zim &
```

# MENGAKSES KIWIX DIBROWSER

Bisa diakses menggunakan ip address yang didapat oleh device yang digunakan untuk install kiwix server.

Cek ip address menggunakan:
```
ifconfig
```
atau di linux debian menggunakan salah satu dibawah ini:
```
/sbin/ifconfig
/usr/sbin/ifconfig
```

Contoh hasil ifconfig:
```
eth0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether de:31:23:0d:b1:e3  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 22  

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 19  bytes 1644 (1.6 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 19  bytes 1644 (1.6 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.73  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::e735:89f:f9c2:87d9  prefixlen 64  scopeid 0x20<link>
        ether 04:95:73:ba:4c:9b  txqueuelen 1000  (Ethernet)
        RX packets 37452  bytes 359654791 (342.9 MiB)
        RX errors 0  dropped 174  overruns 0  frame 0
        TX packets 15731  bytes 8735213 (8.3 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
Berhubung saya menggunakan akses jaringan menggunakan Wifi, bisa dilihat di <b>wlan0</b><br>
Ip address yang didapat oleh device adalah: <b>192.168.1.73</b> maka untuk mengaksesnya dengan cara membuka browser dan mengetikan ip yang didapat, dan masukan port kiwixnya contoh dibawah ini:
```
192.168.1.73:8080
192.168.1.73:8181
```

<br><br>   
<b>Selesai, semoga bermanfaat tutorial installasi wikipedia offline by kiwix, yang sudah saya bikin.<br>
Mohon maaf jika ada kata-kata yang kurang nyambung atau lainnya.<br>
Terima Kasih...</b>

