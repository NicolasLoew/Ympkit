#!/bin/bash
#First version of the setup script focused on the Debian legacy script.
echo "Setting up basic dependencies.."
apt update
apt upgrade
apt install zip unzip
sleep 3s
apt install curl
sleep 3s
apt-get -y install htop
sleep 3s
apt-get -y install nload
sleep 3s
apt-get install nano
sleep 3s
cd
wget https://raw.githubusercontent.com/NicolasLoew/Ympkit/master/legacy.sh
sleep 5s
chmod +x legacy.sh
sleep 3s
echo "All done! Start Ympker's Serverkit by running the following command:"
echo "#################"
echo "sh legacy.sh"
echo "#################"
