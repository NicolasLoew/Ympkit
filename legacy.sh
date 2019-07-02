#!/bin/bash
# A script made my Ympker@LET / Ympker@HB. This script basically only represents a collection of many cool projects that truly deserve the credits.
# The sources/projects will always be linked though.
echo "###################################################################################"
echo "Welcome to Ympker's Multi-Purpose Server Kit for Debian. Use at your own risk.

SYSTEM TASKS:																															
 1) Update & Upgrade										
 2) Reboot													
 3) Display System Usage (htop)									
 4) Show Network Traffic										
 5) Show CPU Info											
 6) List Drives														
 7) Show Kernel Info															
 8) Show Syslog													
 9) Change SSH Port	
 10) Disable Root Login															
 11) Create SSH Key Pair										
	
INSTALL WEB STACKS:												
 12) Install WordPress (EasyEngine)														
 13) Create WP Site with Let's Encrypt (EasyEngine needs to be installed)														
 14) Install LAMP Stack (from lempstack.com)										
 15) Install LNMPA Stack (from lempstack.com)												
  												
 INSTALL CONTROL PANEL:																												
 16) Install ISPConfig (Debian 9)																						
 17) Install HestiaCP																					
 18) Install Keyhelp

INSTALL GAMESERVERS:
19) Install Minecraft (LGSM, Debian 8+)
20) Install CS:GO (LGSM, Debian 8+)

BACKUP TASKS:
21) Backup /var/www/html 
22) MySQL Dump

INSTALL MONITORING:
23) PHP ServerMon
24) Netdata

INSTALL OTHER APPS:
25) SETUP Owncloud26. SETUP OpenVPN (Angristan)
26) SETUP Seafile
27) SETUP Youtube-dl
28) Run Geekbench
29) Run Bench.sh Benchmark"																						
echo "###################################################################################"
echo "Please choose what an option (1-30)."

while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	1)
		echo "Updating the system.."
		apt-get -y update 
		apt-get -y upgrade
		break
		;;
	2)
		reboot
		;;
	3)
		top
		;;
	4)
		nload
		break
		;;
	5)
		cat /proc/cpuinfo
		break
		;;
	6)
		lsblk
		;;
	7)
		uname -a
		break
		;;
	8)
		cat /var/log/syslog
		break
		;;
	9)
		echo "Search for 'Port' and change accordingly."
		sleep 3
		nano /etc/ssh/sshd_config
		echo "Restarting SSH Service.."
		/etc/init.d/ssh restart
		break
		;;
	10)
		echo "Search for and change to: 'PermitRootLogin no'"
		sleep 3
		nano /etc/ssh/sshd_config
		echo "Restarting SSH Service.."
		/etc/init.d/ssh restart
		break
		;;		
	11)
		echo "This will only create the SSH Key Pair. You will have to do the following steps by yourself."
		sudo ssh-keygen
		break #when in doubt check: https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-debian-9
		 ;;
	12)
		wget -qO ee https://rt.cx/ee4 && sudo bash ee
		break #https://easyengine.io
		;;
	13)
		echo "Use the following command after EE has been installed: 'ee site create example.com --wp --letsencrypt'"
		break #https://easyengine.io/docs/lets-encrypt/
		;;
	14)
		echo "LAMP Stack will be installed shortly.."
		echo "Please WRITE DOWN the MySQL root password as the server will reboot at the end of the task. Make sure to change it after the reboot!!!"
		sleep 5
		echo "Root password: '3oxfkanf' "
		sleep 20
		wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz && tar xzf oneinstack-full.tar.gz && ./oneinstack/install.sh --apache_option 1 --apache_mpm_option 1 --apache_mode_option 1 --php_option 7 --phpcache_option 1 --phpmyadmin  --db_option 2 --dbinstallmethod 1 --dbrootpwd 3oxfkanf --pureftpd  --redis  --memcached  --iptables  --reboot 
		break #source: https://lempstack.com/auto/
		;;
	15)
		echo "LNMPA Stack will be installed shortly.."
		echo "Please WRITE DOWN the MySQL Root Password as the server will reboot at the end of the task. Make sure to change it after the reboot!!!"
		sleep 5
		echo "Root password: '3oxfkanf' "
		sleep 20
		wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz && tar xzf oneinstack-full.tar.gz && ./oneinstack/install.sh --nginx_option 1 --apache_option 1 --apache_mpm_option 1 --apache_mode_option 1 --php_option 7 --phpcache_option 1 --phpmyadmin  --db_option 2 --dbinstallmethod 1 --dbrootpwd 3oxfkanf --pureftpd  --redis  --memcached  --iptables  --reboot 
		break #source: https://lempstack.com/auto/
		;;
	16)
		cd /tmp; wget --no-check-certificate -O installer.tgz "https://github.com/servisys/ispconfig_setup/tarball/master"; tar zxvf installer.tgz; cd *ispconfig*; bash install.sh
		break #https://www.howtoforge.com/tutorial/ispconfig-automated-install-script/
		;;
	17)
		wget https://raw.githubusercontent.com/hestiacp/hestiacp/master/install/hst-install.sh
		bash hst-install.sh
		break
		;;
	18)
		wget https://install.keyhelp.de/get_keyhelp.php -O installkeyhelp.sh ; bash installkeyhelp.sh ;
		break #https://www.keyhelp.de/en/
		;;
	19)
		echo "Installing Dependencies.. Please make sure you are running Debian 8 or higher on a 64bit system."
		dpkg --add-architecture i386; sudo apt update; sudo apt install mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux default-jre
		sleep 3
		echo "Creating user 'mcserver'and logging in."
		adduser mcserver
		sleep 3
		su - mcserver
		echo "Downloading LGSM.."
		wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh mcserver
		echo "Running the installer.."
		./mcserver install
		echo "Done! Type './mcserver' to get started."
		break #Refer to https://linuxgsm.com/lgsm/mcserver/
		;;
	20)
		echo "Installing Dependencies.. Please make sure you are running Debian 8 or higher on a 64bit system."
		dpkg --add-architecture i386; sudo apt update; sudo apt install mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386
		sleep 3
		echo "Creating user 'csgoserver'and logging in."
		adduser csgoserver
		sleep 3
		su - csgoserver
		echo "Downloading LGSM.."
		wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh csgoserver
		echo "Running the installer.."
		./csgoserver install
		echo "Done! Type './csgoserver' to get started."
		break #Refer to https://linuxgsm.com/lgsm/csgoserver/
		;;
	21)
		zip -r backup.zip /path/to/folder1
		echo "Done! Created 'backup.zip'."
		break
		;;
	22) echo "Initiating MySQL Backup of all Databases.."
		mysqldump -u root -ptecmint --all-databases > all-databases.sql
		break
		;;
	23)
		echo "Sorry. This feature isn't ready yet. Please come back later!"
		break
		;;
	24)
		bash <(curl -Ss https://my-netdata.io/kickstart.sh)
		break #https://docs.netdata.cloud/packaging/installer/#one-line-installation
		;;
	25)
		echo "Sorry. This feature isn't ready yet. Please come back later!"
		break
		;;
	26)
		curl -O https://raw.githubusercontent.com/Angristan/openvpn-install/master/openvpn-install.sh
		chmod +x openvpn-install.sh
		./openvpn-install.sh
		break
		;;
	27)
		echo "Sorry. This feature isn't ready yet. Please come back later!"
		break
		;;
	28)
		echo "Sorry. This feature isn't ready yet. Please come back later!"
		break
		;;
	29)
		dpkg --add-architecture i386 
		apt-get update
		install libc6:i386 libstdc++6:i386
		wget http://cdn.primatelabs.com/Geekbench-3.4.2-Linux.tar.gz
		tar -zxvf Geekbench-3.4.2-Linux.tar.gz
		cd dist/Geekbench-3.4.2-Linux/
		./geekbench
		break #http://support.primatelabs.com/kb/geekbench/installing-geekbench-3-on-linux
		;;
	30)
		wget -qO- bench.sh | bash
		break
		;;				
	*)
		echo "Sorry, I don't understand. Please try again."
		;;
  esac
done
echo 
echo "Thank you for using Ympker's Serverkit! Please report any bugs on GitHub."


