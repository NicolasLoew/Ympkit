#!/usr/bin/env bash
# A script made by Ympker@LET / Ympker@HB. This script basically only represents a collection of many cool projects that truly deserve the credits.
# The sources/projects will always be linked though.
HEADER_TEXT="\\e[93m=== Ympkit v0.2 - https://github.com/NicolasLoew/Ympkit ===\\e[0m\\nWelcome to Ympker's Multi-Purpose Server Kit. Use at your own risk.\\n\\n"
set -e
OS="`uname`"
case "$OS" in
  'FreeBSD' | 'Linux' | 'NetBSD' | 'OpenBSD')
    if [ ! -f "/etc/os-release" ]; then
      printf "\\nIt doesn't look like your distro is supported.\\nCreate an issue here: https://github.com/NicolasLoew/Ympkit/issues/new\\n"
      exit
    else
      distro=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
    fi
    ;;
  'Darwin')
    distro='macOS'
    ;;
  *)
    printf "\\nIt doesn't look like your distro is supported.\\nCreate an issue here: https://github.com/NicolasLoew/Ympkit/issues/new\\n"
    exit
    ;;
esac
case $distro in
  '"CentOS Linux"')
    packages="yum -q -y"
    ;;
  '"Debian GNU/Linux"' | '"Linux Mint"' | '"Ubuntu"')
    packages="apt-get -qq -y"
    ;;
  'macOS')
    if [ ! $(command -v brew) ]; then
      printf "\\nIt doesn't look like you have brew installed.\\nFind out more here: https://brew.sh/.\\n"
      exit
    else
      packages=$(command -v brew)
    fi
    ;;
  *)
    printf "\\nIt doesn't look like your distro is supported.\\nCreate an issue here: https://github.com/NicolasLoew/Ympkit/issues/new\\n"
    exit
    ;;
esac

function set_config(){
    ovalue=$(echo $1 | sed 's_/_\\/_g')
    nvalue=$(echo $2 | sed 's_/_\\/_g')
    sed -ie "s/$ovalue/$nvalue/g" "$3"
}

function func_config {
  printf "$HEADER_TEXT"
  printf "\\nWhat menu would you like to access?\\n"
  select option in "Backup Tasks (html, MySQL)" "Benchmarks (Bench.sh, GeekBench, ServerScope)" "Control Panels (HestiaCP, ISPConfig, Keyhelp)" "Game Servers (CS:GO, Minecraft)" "Monitoring (Netdata, ServerMon)" "System Tasks (Logs, SSH, Stats)" "Web Stacks (LAMP, LNMPA, Wordpress)" "Other (OpenVPN, OwnCloud, Seafile, Youtube-dl)" "Exit"
  do
    case "$option" in
      "Backup Tasks (html, MySQL)")
        printf "\\nWhich backup task do you want to run?\\n"
        select option in "html" "MySQL" "Exit"
        do
          case "$option" in
            "html")
				if [ -d "/var/www/html" ]; then
					printf "\\n\\nBacking up all /var/wwww/html to html.tar.gz\\n"
					tar cvzf html.tar.gz /var/www/html
				else
					printf "\\n\\n/var/www/html doesn't exist on your system.\\n"
				fi
				exit 0
             	;;
            "MySQL")
				printf "\\n\\nBacking up all MySQL databases to dump.sql\\n"
				mysqldump -u root -ptecmint --all-databases > dump.sql
				exit 0
				;;
            "Exit")
				exit 0
				;;
          esac
        done
        ;;
	  "Benchmarks (Bench.sh, GeekBench, ServerScope)")
        printf "\\nWhich benchmark do you want to run?\\n"
        select option in "Bench.sh" "GeekBench" "ServerScope" "Exit"
        do
          case "$option" in
            "Bench.sh")
				printf "\\n\\nDownloading Bench.sh...\\n"
				wget -qO- bench.sh | bash
				exit 0
             	;;
            "GeekBench")
				printf "\\n\\nDownloading GeekBench...\\n"
				dpkg --add-architecture i386 
				$packages update
				$packages install libc6:i386 libstdc++6:i386
				curl -O http://cdn.geekbench.com/Geekbench-4.3.3-Linux.tar.gz 2>/dev/null
				tar -zxvf Geekbench-4.3.3-Linux.tar.gz
				cd dist/Geekbench-4.3.3-Linux/ || exit
				./geekbench
				exit 0
				;;
			"ServerScope")
				printf "\\n\\nSorry, this hasn't been implemented yet.\\n"
				exit 0
             	;;
            "Exit")
				exit 0
				;;
          esac
        done
        ;;
	  "Control Panels (HestiaCP, ISPConfig, Keyhelp)")
        printf "\\nWhich control panel do you want to install?\\n"
        select option in "HestiaCP" "ISPConfig" "Keyhelp" "Exit"
        do
          case "$option" in
            "HestiaCP")
				printf "\\n\\nInstalling HestiaCP...\\n"
				curl https://raw.githubusercontent.com/hestiacp/hestiacp/master/install/hst-install.sh 2>/dev/null | bash
				exit 0
             	;;
            "ISPConfig")
				printf "\\n\\nDownloading and installing ISPConfig...\\n"
				cd /tmp || exit; wget --no-check-certificate -O installer.tgz "https://github.com/servisys/ispconfig_setup/tarball/master"; tar zxvf installer.tgz; cd ./*ispconfig* || exit; bash install.sh
				exit 0
				;;
			"Keyhelp")
				printf "\\n\\nDownloading and installing Keyhelp...\\n"
				curl https://install.keyhelp.de/get_keyhelp.php 2>/dev/null | bash
				exit 0
             	;;
            "Exit")
				exit 0
				;;
          esac
        done
        ;;
	  "Game Servers (CS:GO, Minecraft)")
        printf "\\nWhich game server do you want to install?\\n"
        select option in "CS:GO" "Minecraft" "Exit"
        do
          case "$option" in
            "CS:GO")
				printf "\\n\\nInstalling CS:GO server dependencies...\\n"
				dpkg --add-architecture i386
				$packages update
				$packages install bc binutils bsdmainutils bzip2 ca-certificates file gzip jq lib32gcc1 libstdc++6 libstdc++6:i386 mailutils postfix python tmux unzip util-linux
				printf "\\n\\nCreating user 'csgoserver'"
				adduser csgoserver
				su - csgoserver
				printf "\\nSetting up LGSM..."
				curl linuxgsm.sh https://linuxgsm.sh 2>/dev/null | bash csgoserver
				printf "\\nRunning the installer..."
				./csgoserver install
				pritnf "\\n\\nServer install successful!\\nRun './csgoserver' to get started."
				exit 0
             	;;
            "Minecraft")
				printf "\\n\\nInstalling Minecraft server dependencies...\\n"
				dpkg --add-architecture i386
				$packages update
				$packages install bc binutils bsdmainutils bzip2 gzip ca-certificates default-jre file jq mailutils postfix python tmux util-linux
				printf "\\n\\nCreating user 'mcserver'"
				adduser mcserver
				su - mcserver
				printf "\\nSetting up LGSM..."
				curl linuxgsm.sh https://linuxgsm.sh 2>/dev/null | bash mcserver
				printf "\\nRunning the installer..."
				./mcserver install
				pritnf "\\n\\nServer install successful!\\nRun './mcserver' to get started."
				exit 0
				;;
            "Exit")
				exit 0
				;;
          esac
        done
        ;;
	  "Monitoring (Netdata, ServerMon)")
        printf "\\nWhich monitoring utility do you want to install?\\n"
        select option in "Netdata" "ServerMon" "Exit"
        do
          case "$option" in
            "Netdata")
				printf "\\n\\nInstalling Netdata...\\n"
				curl https://my-netdata.io/kickstart.sh 2>/dev/null | bash
				exit 0
             	;;
            "ServerMon")
				printf "\\n\\nSorry, this hasn't been implemented yet.\\n"
				exit 0
				;;
            "Exit")
				exit 0
				;;
          esac
        done
        ;;
	  "System Tasks (Logs, SSH, Stats)")
        printf "\\nWhich monitoring utility do you want to install?\\n"
        select option in "CPU Info" "Kernel Info" "List Drives" "Network Monitor" "Resource Monitor" "SSH: Change Port" "SSH: Create Key Pair" "SSH: Disable Root Login" "Show System Log" "Update & Upgrade" "Exit"
        do
          case "$option" in
            "CPU Info")
				cat /proc/cpuinfo
				exit 0
				;;
			"Kernel Info")
				uname -a
				exit 0
				;;
			"List Drives")
				lsblk
				exit 0
				;;
			"Network Monitor")
				nload
				exit 0
				;;
			"Resource Monitor")
				htop
				exit 0
				;;
			"SSH: Change Port")
				printf "Search for 'Port' and change accordingly:\\n"
				sleep 3
				nano  /etc/ssh/sshd_config
				printf "Restarting SSH Service...\\n"
				/etc/init.d/ssh restart
				exit 0
				;;
			"SSH: Create Key Pair")
				printf "Creating the key pair...\\n"
				ssh-keygen
				exit 0
				;;
			"SSH: Disable Root Login")
				printf "Disabling root access and restarting SSH...\\n"
				set_config "PermitRootLogin yes" "PermitRootLogin no" "/etc/ssh/sshd_config"
				/etc/init.d/ssh restart
				exit 0
				;;
			"Show System Log")
				cat /var/log/syslog
				exit 0
				;;
			"Update & Upgrade")
				printf "Updating and upgrading all packages...\\n"
				$packages update && $packages upgrade
				exit 0
				;;
            "Exit")
				exit 0
				;;
          esac
        done
        ;;
	  "Web Stacks (LAMP, LNMPA, Wordpress)")
        printf "\\nWhich web stack do you want to setup?\\n"
        select option in "LAMP" "LNMPA" "Wordpress" "Exit"
        do
          case "$option" in
            "LAMP")
				printf "\\n\\nInstalling LAMP stack...\\nMake sure to take note of the MySQL root password, and to change it after the server reboots!\\n\\nRoot password: '3oxfkanf'\\n\\n"
				sleep 30
				wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz && tar xzf oneinstack-full.tar.gz && ./oneinstack/install.sh --apache_option 1 --apache_mpm_option 1 --apache_mode_option 1 --php_option 7 --phpcache_option 1 --phpmyadmin  --db_option 2 --dbinstallmethod 1 --dbrootpwd 3oxfkanf --pureftpd  --redis  --memcached  --iptables  --reboot 
				exit 0
             	;;
            "LNMPA")
				printf "\\n\\nInstalling LNMPA stack...\\nMake sure to take note of the MySQL root password, and to change it after the server reboots!\\n\\nRoot password: '3oxfkanf'\\n\\n"
				sleep 30
				wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz && tar xzf oneinstack-full.tar.gz && ./oneinstack/install.sh --nginx_option 1 --apache_option 1 --apache_mpm_option 1 --apache_mode_option 1 --php_option 7 --phpcache_option 1 --phpmyadmin  --db_option 2 --dbinstallmethod 1 --dbrootpwd 3oxfkanf --pureftpd  --redis  --memcached  --iptables  --reboot 
				exit 0
				;;
			"Wordpress")
				printf "\\nFor SSL via LE, run 'ee site create example.com --wp --letsencrypt' once EasyEngine has been installed\\nDownloading EasyEngine...\\n"
				curl https://rt.cx/ee4 2>/dev/null | bash
				exit 0
				;;
            "Exit")
				exit 0
				;;
          esac
        done
        ;;
	  "Other (OpenVPN, OwnCloud, Seafile, Youtube-dl)")
        printf "\\nWhich service do you want to setup?\\n"
        select option in "OwnCloud" "Seafile" "Youtube-dl" "Exit"
        do
          case "$option" in
			"OpenVPN")
				printf "\\n\\nInstalling OpenVPN via Anrgistan...\\n"
				curl https://raw.githubusercontent.com/Angristan/openvpn-install/master/openvpn-install.sh 2>/dev/null | bash
				exit 0
             	;;
            "OwnCloud")
				printf "\\n\\nSorry, this hasn't been implemented yet.\\n"
				exit 0
             	;;
            "Seafile")
				printf "\\n\\nSorry, this hasn't been implemented yet.\\n"
				exit 0
				;;
			"Youtube-dl")
				printf "\\n\\nSorry, this hasn't been implemented yet.\\n"
				exit 0
				;;
            "Exit")
				exit 0
				;;
          esac
        done
        ;;
      "Exit")
        exit 0
        ;;
    esac
  done
}

if [ -z "$1" ]; then
	func_config
else
	if [ "$1" = "update" ]; then
		curl https://raw.githubusercontent.com/NicolasLoew/Ympkit/master/setup.sh 2>/dev/null | bash
	else
		printf "Command not recognised.\\n"
	fi
fi
