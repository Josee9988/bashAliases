#!/bin/bash
# SCRIPT:aliasesjose.sh
# USAGE:./aliasesjose.sh
# Jose Gracia
# GITHUB: https://github.com/Josee9988/
# If wanting to contact please mail me at: jgracia9988@gmail.com
# Shell script that adds 'cds', 'updatef' and 'cleanf' commands in .bash_aliases file.

bold=`echo -en "\e[1m"`
default=`echo -en "\e[39m"`
normal=`echo -en "\e[0m"`
underline=`echo -en "\e[4m"`
purple=`echo -en "\e[35m"`
blink=`echo -en "\e[5m"`
red=`echo -en "\e[31m"`

echo ""
echo "Remember to execute aliases '${bold}updatef${normal}' or '${bold}cleanf${normal}' as a '${blink}${bold}${underline}Superuser${normal}' will be created in your ${purple}.bash_aliases${normal} file."

echo ""
echo "Adding comments..."
echo "" >> ~/.bash_aliases
echo "#updatef and cleanf must be executed as 'Superuser$'" >> ~/.bash_aliases
echo "#updatef Will check for updates for normal software installed and also for your distro and after all" >> ~/.bash_aliases
echo "#cleanf will clean trash that you don't really need and will check if any installation has gone through any error." >> ~/.bash_aliases
echo "Adding ${red}updatef${normal} command"
echo "alias updatef='echo "Downloading software" && echo "" && apt-get update && echo "Updating distro" && echo "" && apt dist-upgrade && echo "" && echo "Upgrading software" && echo "" && apt-get upgrade'" >> ~/.bash_aliases
echo "Adding ${red}cleanf${normal} command"
echo "alias cleanf='echo "Cleaning trash..." && echo "" && apt-get autoclean && rm -rf ~/.local/share/Trash/* && echo "" && echo "Removing and checking failed installations" && echo "" && apt-get autoremove && apt-get clean && apt-get check && apt install -f'" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases


echo "This file also includes ${red}${bold}cd${normal} commands which makes going back from folders much faster."
read -p "Do you wish to install ${red}${bold}cd${normal} aliases? [Yy/Nn]" yn
case $yn in
 [Yy]* ) 
# cd commands
echo "Adding cd commands"
echo "cd commands will help you going back from folders."
echo "Example: ${red}...${normal} now equals to cd ../../../ (you can write from ${red}two${normal} dots to ${red}five${normal} dots)"
echo "## get rid of command not found ##" >> ~/.bash_aliases
echo "alias cd..='cd ..'" >> ~/.bash_aliases
echo " " >> ~/.bash_aliases
echo "## a quick way to get out of current directory ##" >> ~/.bash_aliases
echo "alias ..='cd ..'" >> ~/.bash_aliases
echo "alias ...='cd ../../../'" >> ~/.bash_aliases
echo "alias ....='cd ../../../../'" >> ~/.bash_aliases 
echo "alias .....='cd ../../../../'" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
;;
[Nn]* ) echo "Not installing ${bold}cd${normal}" ;;
* ) echo "Please answer yes or no. Your installation now will continue not installing ${bold}cd${normal}";;
esac

echo "Updating files..."
source ~/.bash_aliases
. ~/.bash_aliases

echo ""
echo "All done. "
echo "To try them out please type '${bold}updatef${normal}' or '${bold}cleanf${normal}' always as a ${bold}${underline}Superuser${normal}."
echo "To use '${bold}updatef${normal}' or '${bold}cleanf${normal}' first use ${red}sudo -s${normal} or neither will work"
echo ""
echo "To try the ${bold}cd${normal} commands you ${underline}dont${normal} need to be logged in as Superuser"
echo ""
echo "If it is not working at first... please try to re-login in as a ${bold}Superuser${normal} or just re-loging in your user."
echo "If both don't succeed just reboot."
echo ""
echo "Thanks for using ${underline}Jose's .bash_aliases modification${normal}"



exit