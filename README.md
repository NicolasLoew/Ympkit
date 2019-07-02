Welcome to Ympker's Multi-Purpose Server Kit (***Ympkit***) for mainly Debian/Ubuntu based systems.  This kit is a collection of scripts that will help you managing common tasks of your Debian/Ubuntu Server.  It has been inspired by lots of cool projects from awesome-selfhosted etc..

**IMPORTANT**:

This script is heavily dependant on other projects as it will just clone and execute them for the most part. This means, if a problem occurs your best bet is to check out the respective Github source (can be found as #comment in the script). I take NO RESPONSIBILITY for the accuracy, functionality and integrity of this Kit, nor for any harm that is caused by it or any of the linked scripts. YOU alone will be responsible when using this script!

Usage instructions:

```
curl https://raw.githubusercontent.com/NicolasLoew/Ympkit/master/setup.sh | bash
```

---
**Why I made this script:**
Since I have yet to find something like Centminmod/VPSSIM for Debian/Ubuntu, I decided to somewhat facilitate what those fantastic projects do, but on Debian/Ubuntu. This toolkit lets you run various tasks without needing to remember the command structure. For the most part, it won’t be an unattended install script, but rather it'll pull the required scripts from other Github projects and initialize the setup process in which you would then need to take over and manually finish the setup process. I will always name the used source (#commented) in case you run into any issues so you can look for ways to fix this or report it accordingly. It will also show the supported distro versions before pulling & running the setup script.

So far, this is just an idea of mine. I could navigate to GitHub and copy the setup scripts everytime, but this will ultimately save time and make things easier. It is meant to improve my personal workflow, but please feel free to give input. I will do my best to remove dead projects in the kit, to keep things running smoothly. To that end, please open an issue if a setup script stops working (or if the project is abandoned).

**Credits**:
I'd like to thank each and everyone that has contributed to the project or inspired me here on GitHub, on [HB](https://hostballs.com/t/ympkers-multipurpose-kit-for-debian-based-servers/2399) or [LET](https://lowendtalk.com). Also a BIG THANK YOU to the people that have made and continue to contribute to  [awesome-selfhosted](https://github.com/Kickball/awesome-selfhosted). You guys are awesome!

Special thanks to: [Wolveix](https://github.com/Wolveix)