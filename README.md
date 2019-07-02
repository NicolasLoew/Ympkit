Welcome to Ympker's Multi-Purpose Server Kit (***Ympkit***) for mainly Debian/Ubuntu based systems.  This kit is a collection of scripts that will help you managing common tasks of your Debian/Ubuntu Server.  It has been inspired by lots of cool projects from awesome-selfhosted etc..

**IMPORTANT**:

This script is heavily dependant on other projects as it will just clone and execute them for the most part.  This means, if a problem occurs your best bet is to check out the respective Github source (can be found as #comment in the script). I take NO RESPONSIBILITY for the accuracy, functionality and integrity of this Kit, nor for any harm that is caused by it or any of the linked scripts. YOU alone will be responsible when using this script!

Usage instructions:

wget --no-check-certificate https://raw.githubusercontent.com/NicolasLoew/Ympkit/master/setup.sh

chmod +x setup.sh

sh setup.sh

---
**Why I made this script:**  Since I have yet to find something like Centminmod/VPSSIM for Debian/Ubuntu, I decided to roll my own (in a way) to faciliate/speed up tasks. It will let you run various tasks/scripts (which atleast I would use frequently) by entering the specific number. While some system taks/setups will be fully automated this will rarely be the case. So it won’t be an unattendant install script but rather pulling the required scripts from other Github projects and initializing the setup process in which you would then obviously need to take over and go along.  It will always name the used source (#commented) in case you run into any issues so you can look for ways to fix this or report it accordingly.  It will also show the supported Distro versions before pulling & running the setup script.

So far this is just an idea of mine as of course… I could navigate to GitHub and copy the setup scripts etc myself everytime but this just faciliates some tasks and saves time. It is meant to ease my personal workflow, but you are free to make suggestions as well. I will most likely put it on GitHub as soon as I have a working version and add more “features” over time. I will also do my best to remove dead projects in the kit to keep things running smoothly. To that end, feel free to open an issue on my Github if a setup script of my kit stops working or is abandoned without me noticing. I’ll remove it swiftly. 

**Credits**:
I'd like to thank each and everyone that has contributed to the project or inspired me here on GitHub, on HB or LET. Also a BIG THANK YOU to the people that have made and continue to contribute to  [awesome-selfhosted](https://github.com/Kickball/awesome-selfhosted) . You guys are awesome!

Special Thanks to: Wolveix
