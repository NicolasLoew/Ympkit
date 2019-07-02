#!/usr/bin/env bash
printf "\\e[93m=== Ympkit v0.0.1 ==="
printf "\\n=== https://github.com/NicolasLoew/Ympkit ===\\e[0m"
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
    printf "\\n\\e[36mInstalling any missing dependencies.\\n\\e[94m"
    yum -q -y install epel-release
    yum -q -y update && yum -q -y upgrade
    yum -q -y install curl htop nano nload unzip zip 
    ;;
  '"Debian GNU/Linux"' | '"Linux Mint"' | '"Ubuntu"')
    printf "\\n\\e[36mInstalling any missing dependencies.\\n\\e[94m"
    apt-get -qq -y update && apt-get -qq -y upgrade
    apt-get -qq -y install curl htop nano nload unzip zip
    ;;
  'macOS')
    if [ ! $(command -v brew) ]; then
      printf "\\nIt doesn't look like you have brew installed.\\nFind out more here: https://brew.sh/.\\n"
      exit
    else
      brew_binary=$(command -v brew)
    fi
    printf "\\n\\e[36mInstalling any missing dependencies.\\n\\e[94m"
    "$brew_binary" update && "$brew_binary" upgrade
    "$brew_binary" install curl htop nano nload unzip zip
    ;;
  *)
    printf "\\nIt doesn't look like your distro is supported.\\nCreate an issue here: https://github.com/NicolasLoew/Ympkit/issues/new\\n"
    exit
    ;;
esac
curl -O https://raw.githubusercontent.com/NicolasLoew/Ympkit/master/serverkit.sh 2>/dev/null
chmod u+x serverkit.sh

printf "\\n\\e[32mSetup completed!\\nRun the toolkit via: ./serverkit.sh\\n"