#!/bin/bash
# SCRIPT:bashrc_updatesandcleans.sh
# USAGE:./bashrc_updatesandcleans.sh
# Jose Gracia
# GITHUB: https://github.com/Josee9988/
# If wanting to contact please mail me at: jgracia9988@gmail.com
# Shell script that adds 'updatef' and 'cleanf' commands in .bashrc file.


bold=`echo -en "\e[1m"`
default=`echo -en "\e[39m"`
normal=`echo -en "\e[0m"`
underline=`echo -en "\e[4m"`
purple=`echo -en "\e[35m"`
blink=`echo -en "\e[5m"`
red=`echo -en "\e[31m"`

echo "Remember to execute this script as a '${blink}${bold}${underline}Superuser${normal}' and the following alias wich will be created in your ${purple}.bashrc${normal} file"
echo ""
sleep 1s
echo "Adding comments..."
echo "" >> ~/.bashrc
echo "#updatef and cleanf must be executed as '${bold}Superuser${normal}'" >> ~/.bashrc
echo "#updatef Will check for updates for normal software installed and also for your distro and after all" >> ~/.bashrc
echo "#cleanf will clean trash that you don't really need and will check if any installation has gone through any error." >> ~/.bashrc
echo "Adding ${red}updatef${normal} command"
echo "alias updatef='echo "Downloading software" && echo "" && apt-get update && echo "Updating distro" && echo "" && apt dist-upgrade && echo "" && echo "Upgrading software" && echo "" && apt-get upgrade'" >> ~/.bashrc
echo "Adding ${red}cleanf${normal} command"
echo "alias cleanf='echo "Cleaning trash..." && echo "" && apt-get autoclean && rm -rf ~/.local/share/Trash/* && echo "" && echo "Removing and checking failed installations" && echo "" && apt-get autoremove && apt-get clean && apt-get check && apt install -f'" >> ~/.bashrc
echo "" >> ~/.bashrc
source ~/.bashrc
. ~/.bashrc
echo ""
echo "All done. "
echo "To try them out please type '${bold}updatef${normal}' or '${bold}cleanf${normal}' always as a ${bold}${underline}Superuser${normal}"
echo ""
echo "If it is not working at first... please try to re-login in as a ${bold}Superuser${normal} or just re-loging in your user."
echo "If both don't succeed just reboot."
echo "Thanks for using ${underline}Jose's .bashrc modification${normal}"
exit