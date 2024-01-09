echo "Creating installation folders"
mkdir pihole-unifi
cd pihole-unifi

echo "Downloading Pihole"
git clone --depth 1 https://github.com/pi-hole/pi-hole.git Pi-hole

echo "Installing Pihole"
cd "Pi-hole/automated install/"
sudo bash basic-install.sh
cd ../../
echo "Done"

#Install unifi-controller
#Credits to jimdigriz -https://gist.github.com/jimdigriz/3a12e519e97f671c9df1174f203c8516#file-debian-unifi-mdmkdir unifi
echo "Preparing to install Unifi"
mkdir unifi
cd unifi

echo "Adding Unifi repository"
sudo curl -o /usr/share/keyrings/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg
echo 'deb [arch=armhf signed-by=/usr/share/keyrings/unifi-repo.gpg] https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/unifi.list >/dev/null

echo "Downloading Unifi dependencies"
curl -o openjdk11.deb -J http://security.debian.org/debian-security/pool/updates/main/o/openjdk-11/openjdk-11-jre-headless_11.0.20+8-1~deb11u1_arm64.deb
curl -o multiarch-supp.deb -J http://security.debian.org/debian-security/pool/updates/main/g/glibc/multiarch-support_2.28-10+deb10u2_arm64.deb
curl -o libssl.deb -J https://snapshot.debian.org/archive/debian/20170705T160707Z/pool/main/o/openssl/libssl1.0.0_1.0.2l-1~bpo8%2B1_arm64.deb
curl -o mongodb.deb -J https://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/3.6/multiverse/binary-arm64/mongodb-org-server_3.6.23_arm64.deb

echo "Installing dependency packages"
sudo dpkg -i openjdk11.deb multiarch-supp.deb libssl.deb mongodb.deb
sudo apt install -f

echo "Starting mongodb service"
sudo systemctl enable --now mongod

echo "Installing Unifi"
sudo apt update
sudo apt install unifi
sudo apt install libsnappy-java
sudo mv /usr/lib/unifi/lib/snappy-java-1.1.8.4.jar /usr/lib/unifi/lib/snappy-java-1.1.8.4.jar.orig
sudo ln -s /usr/share/maven-repo/org/xerial/snappy/snappy-java/1.1.8.3/snappy-java-1.1.8.3.jar /usr/lib/unifi/lib/snappy-java-1.1.8.4.jar
sudo systemctl restart unifi
echo "Done"

echo "Confirming install"
sudo systemctl status unifi
pihole status


echo "Pihole will now be available at http://localhost/admin"
echo "Unifi will now be available at https://localhost:8443/"
