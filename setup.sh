#!/bin/bash
echo "Setting up basic dependencies.."
apt install zip unzip
sleep 3
apt install curl
sleep 3
apt-get -y install htop
sleep 3
apt-get -y install nload
sleep 3
apt-get install nano
sleep 3
cd
wget --no-check-certificate https://raw.githubusercontent.com/NicolasLoew/Ympkit/master/serverkit.sh
sleep 5
sudo chmod +x serverkit.sh
sleep 3
echo "All done! Start Ympker's Serverkit by running the following command:"
echo "#################"
echo "sh serverkit.sh"
echo "#################"
