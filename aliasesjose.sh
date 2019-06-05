#!/bin/bash
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
# SCRIPT:        aliasesjose.sh
# USAGE:        ./aliasesjose.sh
# PURPOSE:       Shell script that adds 'cd(..'s), 'updatef' and 'cleanf', 'updateff', 'extract', faster folder navigation, 
#				'mariadb' start/stop/status commands in .bash_aliases file, git commands gta gtm gtp gtl
#				system commands suspend hibernate. sudos instead of sudo -s. extract commands, counting lines of types of file, etc...
# TITLE:        aliasesjose.sh
# AUTHOR:       Jose Gracia
# VERSION:      1.5
# NOTES:        If none of the aliases work check that in your ~/.bashrc you have a line like: . ~/.bash_aliases which is surrounded by an if. 
#				If this is not in your linux distro add it yourself.
# BASH_VERSION: GNU bash, version 4.4.19(1)-release (x86_64-pc-linux-gnu)
# LICENSE:      GNU General Public License v3.0
# GITHUB:       https://github.com/Josee9988/
# MAIL:         jgracia9988@gmail.com
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

bold=`echo -en "\e[1m"`
default=`echo -en "\e[39m"`
normal=`echo -en "\e[0m"`
underline=`echo -en "\e[4m"`
purple=`echo -en "\e[35m"`
blink=`echo -en "\e[5m"`
red=`echo -en "\e[31m"`
line='. ~/.bash_aliases'
file=~/.bashrc



echo "We will create aliases in your ${blink}${purple}~/.bash_aliases${normal} file."



echo ""
echo "" >> ~/.bash_aliases
echo "### Jose's bashrc modification ###" >> ~/.bash_aliases
##  ADDING UPDATEF, CLEANF AND UPDATEFF ##
echo "" >> ~/.bash_aliases
echo "#updatef and cleanf must be executed as 'Superuser$'" >> ~/.bash_aliases
echo "#updatef Will check for updates for normal software installed and also for your distro and after all" >> ~/.bash_aliases
echo "#cleanf will clean trash that you don't really need and will check if any installation has gone through any error." >> ~/.bash_aliases
echo "Adding ${red}updatef${normal} command"
echo "alias updatef='echo "Downloading software" && echo "" && apt-get update && echo "Updating distro" && echo "" && apt dist-upgrade && echo "" && echo "Upgrading software" && echo "" && apt-get upgrade'" >> ~/.bash_aliases
echo "Adding ${red}cleanf${normal} command"
echo "alias cleanf='echo "Cleaning trash..." && rm -rf /tmp/* && echo "" && apt-get autoclean && rm -rf ~/.local/share/Trash/* && echo "" && echo "Removing and checking failed installations" && echo "" && apt-get autoremove && apt-get clean && apt-get check && apt install -f'" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
echo "# For all the update and upgrades and after that cleans your system. Updatef + cleanf all in one command" >> ~/.bash_aliases
echo "alias updateff='updatef && cleanf'" >> ~/.bash_aliases



echo ""
##  ADDING ..'s  ## 
echo "This file includes ${red}${bold}cd${normal} commands which makes going back from folders much faster."
echo "Example: ${red}...${normal} now equals to cd ../../../ (you can write from ${red}two${normal} dots to ${red}five${normal} dots)"
read -p "Do you wish to install ${red}${bold}cd${normal} aliases? [Yy/Nn] " yn
case $yn in
	[Yy]* ) 
echo "## Get rid of command not found ##" >> ~/.bash_aliases
echo "alias cd..='cd ..'" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
echo "## A quick way to move backwards from the current directory ##" >> ~/.bash_aliases
echo "alias ..='cd ..'" >> ~/.bash_aliases
echo "alias ...='cd ../../'" >> ~/.bash_aliases
echo "alias ....='cd ../../../'" >> ~/.bash_aliases 
echo "alias .....='cd ../../../../'" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
;;
[Nn]* ) echo "Not installing ${bold}cd${normal}" ;;
* ) echo "Please answer yes or no. Your installation now will continue not installing ${bold}cd${normal}";;
esac



echo ""
##  EXTRACT ##
echo "You can also install '${red}extract${normal}', which will uncompress almost any kind of compressed file, you will not need to worry what command uncompresses which file, just '${red}${bold}extract${normal}'"
read -p "Do you wish to install ${red}${bold}extract${normal} aliases? [Yy/Nn] " yn
case $yn in
	[Yy]* ) 
echo "## Use only 'extract' for most of your compressed files. ##" >> ~/.bash_aliases
echo "extract () { " >> ~/.bash_aliases
echo "   if [ -f \$1 ] ; then " >> ~/.bash_aliases
echo "       case \$1 in " >> ~/.bash_aliases
echo "           *.tar.bz2)   tar xvjf \$1    ;; " >> ~/.bash_aliases
echo "           *.tar.gz)    tar xvzf \$1    ;; " >> ~/.bash_aliases
echo "           *.bz2)       bunzip2 \$1     ;; " >> ~/.bash_aliases
echo "           *.rar)       unrar x \$1     ;; " >> ~/.bash_aliases
echo "           *.gz)        gunzip \$1      ;; " >> ~/.bash_aliases
echo "           *.tar)       tar xvf \$1     ;; " >> ~/.bash_aliases
echo "           *.tbz2)      tar xvjf \$1    ;; " >> ~/.bash_aliases
echo "           *.tgz)       tar xvzf \$1    ;; " >> ~/.bash_aliases 
echo "           *.zip)       unzip \$1       ;; " >> ~/.bash_aliases
echo "           *.Z)         uncompress \$1  ;; " >> ~/.bash_aliases
echo "           *.7z)        7z x \$1        ;; " >> ~/.bash_aliases
echo "           *)           echo 'do not know how to extract \$1...' ;; " >> ~/.bash_aliases
echo "       esac " >> ~/.bash_aliases
echo "   else " >> ~/.bash_aliases
echo "       echo '\$1 is not a valid file, or has spaces in it!' " >> ~/.bash_aliases
echo "   fi " >> ~/.bash_aliases
echo " } " >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
;;
[Nn]* ) echo "Not installing ${bold}extract${normal}" ;;
* ) echo "Please answer yes or no. Your installation now will continue not installing ${bold}extract${normal}";;
esac



echo ""
##  MARIADB.SERVICE ##
echo "We also have 'mariadb' (start/stop/status/use) shortcuts"
read -p "Do you wish to install ${red}${bold}mariadb${normal} aliases? [Yy/Nn] " yn
case $yn in
	[Yy]* ) 
echo "# For starting mariadb.service " >> ~/.bash_aliases
echo "alias startmaria='systemctl start mariadb.service' " >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
echo "# For stopping mariadb.service " >> ~/.bash_aliases
echo "alias stopmaria='systemctl stop mariadb.service' " >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
echo "# For knowing the status of mariadb.service " >> ~/.bash_aliases 
echo "alias statusmaria='systemctl status mariadb.service' " >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
echo "# Using mysql with root " >> ~/.bash_aliases
echo "alias usemaria='mysql -u root -p' " >> ~/.bash_aliases
;;
[Nn]* ) echo "Not installing ${bold}mariadb${normal}" ;;
* ) echo "Please answer yes or no. Your installation now will continue not installing ${bold}mariadb${normal}";;
esac



##	SUDO	##
echo "# might fix some sudo + alias problems" >> ~/.bash_aliases
echo " alias sudo='sudo '" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
echo "# An alias to save some miliseconds of your time :) " >> ~/.bash_aliases
echo "alias sudos='sudo -s' " >> ~/.bash_aliases
echo "alias suspend='systemctl suspend'" >> ~/.bash_aliases
echo "alias hibernate='systemctl hibernate'" >> ~/.bash_aliases



## FAST NAVIGATION TO COMMON FOLDERS	##
echo "" >> ~/.bash_aliases  
echo "# dont write again ~/... " >> ~/.bash_aliases 
echo "alias cdDesktop='cd ~/Desktop/' " >> ~/.bash_aliases
echo "alias cdDocuments='cd ~/Documents/' " >> ~/.bash_aliases
echo "alias cdDownloads='cd ~/Downloads/' " >> ~/.bash_aliases
echo "alias cdTrash='cd ~/.local/share/Trash/' " >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
echo "alias cddesktop='cd ~/Desktop/' " >> ~/.bash_aliases 
echo "alias cddocuments='cd ~/Documents/' " >> ~/.bash_aliases
echo "alias cddownloads='cd ~/Downloads/' " >> ~/.bash_aliases
echo "alias cdtrash='cd ~/.local/share/Trash/' " >> ~/.bash_aliases
echo "" >> ~/.bash_aliases



echo ""
##  GIT COMMANDS ##
echo "We also have 'git' (status/add/commit/push/log) shortcuts"
read -p "Do you wish to install ${red}${bold}git${normal} aliases? [Yy/Nn] " yn
case $yn in
	[Yy]* ) 
echo "# Git" >> ~/.bash_aliases
echo "alias gts='git status'" >> ~/.bash_aliases
echo "alias gta='git add -A'" >> ~/.bash_aliases
echo "alias gtm='git commit -m '$1''" >> ~/.bash_aliases
echo "alias gtp='git push'" >> ~/.bash_aliases
echo "alias gtl='git log --color --graph --pretty=format:\"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\" --abbrev-commit --'" >> ~/.bash_aliases
echo "" >> ~/.bash_aliases
;;
[Nn]* ) echo "Not installing ${bold}mariadb${normal}" ;;
* ) echo "Please answer yes or no. Your installation now will continue not installing ${bold}mariadb${normal}";;
esac



echo "Adding some extra feaures you might like..."
##	COUNT LINES	##
echo "##	COUNT LINES	##"
echo "clines () { " >> ~/.bash_aliases
echo "	if [ -z '\$1' ]; then" >> ~/.bash_aliases
echo "        echo 'At least give one file type by parameter'" >> ~/.bash_aliases
echo "        elif  [ -z '\$2' ]; then" >> ~/.bash_aliases
echo "            find -type f -name "*.$1" -o -name "*.$2" | xargs wc -l | sort -n" >> ~/.bash_aliases
echo "        elif  [ -z '\$3' ]; then" >> ~/.bash_aliases
echo "            find -type f -name "*.$1" -o -name "*.$2" -o -name "*.$3" | xargs wc -l | sort -n" >> ~/.bash_aliases
echo "        elif  [ -z '\$4' ]; then" >> ~/.bash_aliases
echo "            find -type f -name "*.$1" -o -name "*.$2" -o -name "*.$3" -o -name "*.$4" | xargs wc -l | sort -n" >> ~/.bash_aliases
echo "        elif  [ -z '\$5' ]; then" >> ~/.bash_aliases
echo "            find -type f -name "*.$1" -o -name "*.$2" -o -name "*.$3" -o -name "*.$4" -o -name "*.$5" | xargs wc -l | sort -n" >> ~/.bash_aliases
echo "	fi" >> ~/.bash_aliases
echo "} " >> ~/.bash_aliases
echo "">> ~/.bash_aliases



##	neofetch	##
echo "alias sysinfo='neofetch'">> ~/.bash_aliases
echo "">> ~/.bash_aliases



##	Checking if .bash_aliases is enabled in .bashrc file	##
if ! grep -q -x -F -e "$line" <"$file"; then
	echo "Enabling .bash_aliases in your .bashrc file"
    echo "" >> "$file"
	echo "if [ -f ~/.bash_aliases ]; then" >> "$file"
    printf '%s\n' "$line" >>"$file"
	echo "fi" >> "$file"
	echo "" >> "$file"
fi



# Updating bash_aliases, so we can use the aliases without rebooting.
echo ""
echo "Updating bashrc..."
source ~/.bash_aliases
. ~/.bash_aliases
source ~/.bashrc
. ~/.bashrc



##	MENSAJES FINALES	##
echo ""
echo "${bold}All done.${normal} "
echo "To try them out please type or '${bold}updateff${normal}', '${bold}updatef${normal}' or '${bold}cleanf${normal}' this three only always as a ${bold}${underline}Superuser${normal}."
echo "To use '${bold}updatef${normal}', or '${bold}updateff${normal}' or '${bold}cleanf${normal}' first use ${red}sudo -s${normal} or neither will work"
echo ""
echo "You can use '${bold}updateff${normal}' to use 'updatef' and 'cleanf' at once!"
echo ""
echo "To use the ${bold}cd's${normal} just write from one to five dots '${bold}.${normal}' '${bold}..${normal}' '${bold}...${normal}' '${bold}....${normal}' '${bold}.....${normal}' to navigate back to folders."
echo ""
echo "If you want to use the ${bold}extract${normal}, write it and after a compressed file (${bold}.rar, bz2, tar.gz${normal}, etc). Ex: extract compressed.rar"
echo ""
echo "To use the ${bold}mariadb${normal} commands just type '${bold}startmaria${normal}', '${bold}stopmaria${normal}' or '${bold}statusmaria${normal}' to start, stop or know the status of ${underline}mariadb.service${normal} "
echo "Or ${bold}usemaria${normal} for using mysql in root mode with password"
echo ""
echo "For using the ${bold}git${normal} commands use: ${red}gts${normal} for git status. ${red}gta${normal} for git add -A ${red}gtm ${bold}'your message'${normal} for git commit -m  ${red}gtp${normal} for git push and ${red}gtl${normal} for git log."
echo ""
echo "Also try ${bold}sudos${normal} instead of '${bold}sudo -s${normal}'. Use ${bold}suspend${normal} or ${bold}hibernate${normal} instead of systemctl suspend/hibernate."
echo "Don't ever do cd ~/Desktop or cd ~/.local/share/Trash/... now just use ${red}cdDesktop${normal} or ${red}cdDocuments${normal} or ${red}cdTrash${normal}..."
echo ""
echo "Use ${bold}cLines${normal} and give from 1 to 5 tipe of files and it will count all the lines"
echo ""
echo ""
echo "You will find more information and more detailed in the ${purple}README.MD${normal} file :)"
echo "${bold}${underline}https://github.com/Josee9988/bashrcralias${normal}"
echo "Thanks for using ${underline}Jose's .bash_aliases modification${normal}"

exit
