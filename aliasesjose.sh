#!/bin/bash
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
# SCRIPT:        aliasesjose.sh
# USAGE:        ./aliasesjose.sh
# PURPOSE:       Shell script that adds 'cd(..'s), 'updatef' and 'cleanf', 'updateff', 'extract', faster folder navigation,
#				'mariadb' start/stop/status commands in .bash_aliases file, git commands gta gtm gtp gtl, and gtCreate
#				system commands suspend hibernate. sudos instead of sudo -s. extract commands, counting lines of types of file, etc...
# TITLE:        aliasesjose.sh
# AUTHOR:       Jose Gracia
# VERSION:      1.5
# NOTES:        If none of the aliases work check that in your ~/.bashrc you have a line like: . $fileAlias which is surrounded by an if.
#				If this is not in your linux distro add it yourself.
# BASH_VERSION: GNU bash, version 4.4.19(1)-release (x86_64-pc-linux-gnu)
# LICENSE:      GNU General Public License v3.0
# GITHUB:       https://github.com/Josee9988/
# MAIL:         jgracia9988@gmail.com
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

bold=$(echo -en "\e[1m")
normal=$(echo -en "\e[0m")
underline=$(echo -en "\e[4m")
purple=$(echo -en "\e[35m")
blink=$(echo -en "\e[5m")
red=$(echo -en "\e[31m")
line='. ~/.bash_aliases'
lineSearch='if [ -f ~/.bash_aliases ]; then'
file=~/.bashrc
fileAlias=~/.bash_aliases

echo "We will create aliases in your ${blink}${purple}$fileAlias${normal} file."

echo ""
echo "" >>$fileAlias
echo "### Jose's bashrc modification ###" >>$fileAlias

echo "${red}${bold}updatef${normal} and ${red}${bold}cleanf${normal} aliases, updates and upgrades your system and cleans it."
read -p "Do you wish to install ${red}${bold}updatef and cleanf${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	##  ADDING UPDATEF, CLEANF AND UPDATEFF ##
	echo "" >>$fileAlias
	echo "#updatef and cleanf must be executed as 'Superuser$'" >>$fileAlias
	echo "#updatef Will check for updates for normal software installed and also for your distro and after all" >>$fileAlias
	echo "#cleanf will clean trash that you don't really need and will check if any installation has gone through any error." >>$fileAlias
	echo "alias updatef='echo "Downloading software" && echo "" && apt-get update && echo "Updating distro" && echo "" && apt dist-upgrade && echo "" && echo "Upgrading software" && echo "" && apt-get upgrade'" >>$fileAlias
	echo "alias cleanf='echo "Cleaning trash..." && rm -rf /tmp/* && echo "" && apt-get autoclean && echo "" && echo "Removing and checking failed installations" && echo "" && apt-get autoremove && apt-get clean && apt-get check && apt install -f'" >>$fileAlias
	echo "" >>$fileAlias
	echo "# For all the update and upgrades and after that cleans your system. Updatef + cleanf all in one command" >>$fileAlias
	echo "alias updateff='updatef && cleanf'" >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}updatef cleanf${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}updatef cleanf${normal}" ;;
esac

echo ""
##  ADDING ..'s  ##
echo "This file includes ${red}${bold}cd${normal} commands which makes going back from folders much faster."
echo "Example: ${red}...${normal} now equals to cd ../../../ (you can write from ${red}two${normal} dots to ${red}five${normal} dots)"
read -p "Do you wish to install ${red}${bold}cd${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	echo "" >>$fileAlias
	echo "## Get rid of command not found ##" >>$fileAlias
	echo "alias cd..='cd ..'" >>$fileAlias
	echo "" >>$fileAlias
	echo "## A quick way to move backwards from the current directory ##" >>$fileAlias
	echo "alias ..='cd ..'" >>$fileAlias
	echo "alias ...='cd ../../'" >>$fileAlias
	echo "alias ....='cd ../../../'" >>$fileAlias
	echo "alias .....='cd ../../../../'" >>$fileAlias
	echo "" >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}cd${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}cd${normal}" ;;
esac

echo ""
##  EXTRACT ##
echo "You can also install '${red}extract${normal}', which will uncompress almost any kind of compressed file, you will not need to worry what command uncompresses which file, just '${red}${bold}extract${normal}'"
read -p "Do you wish to install ${red}${bold}extract${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	echo "## Use only 'extract' for most of your compressed files. ##" >>$fileAlias
	echo "extract () { " >>$fileAlias
	echo "   if [ -f \$1 ] ; then " >>$fileAlias
	echo "       case \$1 in " >>$fileAlias
	echo "           *.tar.bz2)   tar xvjf \$1    ;; " >>$fileAlias
	echo "           *.tar.gz)    tar xvzf \$1    ;; " >>$fileAlias
	echo "           *.bz2)       bunzip2 \$1     ;; " >>$fileAlias
	echo "           *.rar)       unrar x \$1     ;; " >>$fileAlias
	echo "           *.gz)        gunzip \$1      ;; " >>$fileAlias
	echo "           *.tar)       tar xvf \$1     ;; " >>$fileAlias
	echo "           *.tbz2)      tar xvjf \$1    ;; " >>$fileAlias
	echo "           *.tgz)       tar xvzf \$1    ;; " >>$fileAlias
	echo "           *.zip)       unzip \$1       ;; " >>$fileAlias
	echo "           *.Z)         uncompress \$1  ;; " >>$fileAlias
	echo "           *.7z)        7z x \$1        ;; " >>$fileAlias
	echo "           *)           echo 'do not know how to extract \$1 ...' ;; " >>$fileAlias
	echo "       esac " >>$fileAlias
	echo "   else " >>$fileAlias
	echo "       echo '\$1 is not a valid file, or has spaces in it!' " >>$fileAlias
	echo "   fi " >>$fileAlias
	echo " } " >>$fileAlias
	echo "" >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}extract${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}extract${normal}" ;;
esac

echo ""
##  MARIADB.SERVICE ##
echo "We also have 'mariadb' (start/stop/status/use) shortcuts"
read -p "Do you wish to install ${red}${bold}mariadb${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	echo "# For starting mariadb.service " >>$fileAlias
	echo "alias startmaria='systemctl start mariadb.service' " >>$fileAlias
	echo "" >>$fileAlias
	echo "# For stopping mariadb.service " >>$fileAlias
	echo "alias stopmaria='systemctl stop mariadb.service' " >>$fileAlias
	echo "" >>$fileAlias
	echo "# For knowing the status of mariadb.service " >>$fileAlias
	echo "alias statusmaria='systemctl status mariadb.service' " >>$fileAlias
	echo "" >>$fileAlias
	echo "# Using mysql with root " >>$fileAlias
	echo "alias usemaria='mysql -u root -p' " >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}mariadb${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}mariadb${normal}" ;;
esac
echo ""

## FAST NAVIGATION TO COMMON FOLDERS	##
read -p "Do you wish to install ${red}${bold}easy common folder navigation${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	echo "" >>$fileAlias
	echo "# dont write again ~/... " >>$fileAlias
	echo "alias cdDesktop='cd ~/Desktop/' " >>$fileAlias
	echo "alias cdDocuments='cd ~/Documents/' " >>$fileAlias
	echo "alias cdDownloads='cd ~/Downloads/' " >>$fileAlias
	echo "alias cdTrash='cd ~/.local/share/Trash/' " >>$fileAlias
	echo "" >>$fileAlias
	echo "alias cddesktop='cd ~/Desktop/' " >>$fileAlias
	echo "alias cddocuments='cd ~/Documents/' " >>$fileAlias
	echo "alias cddownloads='cd ~/Downloads/' " >>$fileAlias
	echo "alias cdtrash='cd ~/.local/share/Trash/' " >>$fileAlias
	echo "" >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}easy common folder navigation${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}easy common folder navigation${normal}" ;;
esac

echo ""
##  GIT COMMANDS ##
echo "We also have 'git' (status/add/commit/push/log) shortcuts"
read -p "Do you wish to install ${red}${bold}git${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	echo "# Git" >>$fileAlias
	echo "alias gts='git status'" >>$fileAlias
	echo "alias gta='git add -A'" >>$fileAlias
	echo "alias gtm='git commit -m '$1''" >>$fileAlias
	echo "alias gtp='git push'" >>$fileAlias
	echo "alias gtl='git log --color --graph --pretty=format:\"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\" --abbrev-commit --'" >>$fileAlias
	echo "" >>$fileAlias
	echo "#Create GitHub repository from terminal using GitHub API, with curl" >>$fileAlias
	echo "gtCreate () {" >>$fileAlias
	echo "    cancel=false" >>$fileAlias
	echo "    unset email" >>$fileAlias
	echo "    unset name" >>$fileAlias
	echo "    unset description" >>$fileAlias
	echo "" >>$fileAlias
	echo "    echo \"We will create a GitHub repository from scratch' you will need to have installed 'curl' and 'git'. \"" >>$fileAlias
	echo "    echo """ >>$fileAlias
	echo "" >>$fileAlias
	echo "    while [ -z \$email ]; do" >>$fileAlias
	echo "        read -p 'Username or email address of your Github account: ' email" >>$fileAlias
	echo "    done" >>$fileAlias
	echo "    while [ -z \$name ]; do" >>$fileAlias
	echo "        read -p 'Name of the new repository: ' name" >>$fileAlias
	echo "    done" >>$fileAlias
	echo "    while [ -z \$description ]; do" >>$fileAlias
	echo "        read -p 'Description of the new repository: ' description" >>$fileAlias
	echo "    done" >>$fileAlias
	echo "" >>$fileAlias
	echo '    read -p "Do you wish to make the repository private?[Yy/Nn]: " yn' >>$fileAlias
	echo "    case \$yn in" >>$fileAlias
	echo "        [Yy]* )" >>$fileAlias
	echo "        curl -u \"\$email\" https://api.github.com/user/repos -d '{\"name\":\"'\$name'\",\"private\":\"true\",\"description\":\"'\$description'\"}'" >>$fileAlias
	echo "        ;;" >>$fileAlias
	echo "        [Nn]* )" >>$fileAlias
	echo "        curl -u \"\$email\" https://api.github.com/user/repos -d '{\"name\":\"'\$name'\",\"description\":\"'\$description'\"}'" >>$fileAlias
	echo "        ;;" >>$fileAlias
	echo "        * ) echo 'Please answer yes or no. Your installation will be aborted. Try again'" >>$fileAlias
	echo "        cancel=true" >>$fileAlias
	echo "        ;;" >>$fileAlias
	echo "    esac" >>$fileAlias
	echo "" >>$fileAlias
	echo "    #creating local folder and initializating git" >>$fileAlias
	echo "    if [ \$cancel == false ]; then" >>$fileAlias
	echo "    mkdir -pv \$name" >>$fileAlias
	echo "    cd \$name" >>$fileAlias
	echo "    git init" >>$fileAlias
	echo "    fi" >>$fileAlias
	echo "}" >>$fileAlias
	echo "" >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}git${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}git${normal}" ;;
esac

echo ""
##	COUNT LINES	##
echo "${red}clines${normal} counts the lines of a folder and it's subdirectories from selected file types"
read -p "Do you wish to install ${red}${bold}clines${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	echo "##	COUNT LINES	##" >>$fileAlias
	echo "clines () { " >>$fileAlias
	echo "	if [ -z \$1 ]; then" >>$fileAlias
	echo "        echo 'At least give one file type by parameter'" >>$fileAlias
	echo "        elif  [ -z \$2 ]; then" >>$fileAlias
	echo "            find -type f -name \"*.\$1\" -o -name \"*.\$2\" | xargs wc -l | sort -n" >>$fileAlias
	echo "        elif  [ -z \$3 ]; then" >>$fileAlias
	echo "            find -type f -name \"*.\$1\" -o -name \"*.\$2\" -o -name \"*.\$3\" | xargs wc -l | sort -n" >>$fileAlias
	echo "        elif  [ -z \$4 ]; then" >>$fileAlias
	echo "            find -type f -name \"*.\$1\" -o -name \"*.\$2\" -o -name \"*.\$3\" -o -name \"*.\$4\" | xargs wc -l | sort -n" >>$fileAlias
	echo "        elif  [ -z \$5 ]; then" >>$fileAlias
	echo "            find -type f -name \"*.\$1\" -o -name \"*.\$2\" -o -name \"*.\$3\" -o -name \"*.\$4\" -o -name \"*.\$5\" | xargs wc -l | sort -n" >>$fileAlias
	echo "	fi" >>$fileAlias
	echo "} " >>$fileAlias
	echo "" >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}mariadb${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}clines${normal}" ;;
esac
echo ""

##	neofetch	##
echo "${red}sysinfo${normal} is an alias for neofetch"
read -p "Do you wish to install ${red}${bold}sysinfo${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	echo "alias sysinfo='neofetch'" >>$fileAlias
	echo "" >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}sysinfo${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}sysinfo${normal}" ;;
esac
echo ""

##	Sensors	##
echo "${red}temp${normal} is an alias for sensors"
read -p "Do you wish to install ${red}${bold}temp${normal} alias? [Yy/Nn] " yn
case $yn in
[Yy]*)
	echo "" >>$fileAlias
	echo "alias temp='sensors'" >>$fileAlias
	echo "" >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}temp${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}temp${normal}" ;;
esac
echo ""

## Extra Linux	##
echo "A lot of common commands for ${red}linux terminal${normal}"
read -p "Do you wish to install ${red}${bold}extra system linux${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	echo "#Extra linux commands" >>$fileAlias
	echo "alias mkdir='mkdir -pv'" >>$fileAlias
	echo "alias ping='time ping -c 7'" >>$fileAlias
	echo "alias rm='rm -v'" >>$fileAlias
	echo "alias mv='mv -v'" >>$fileAlias
	echo "alias calc='bc -l'" >>$fileAlias
	echo "" >>$fileAlias
	echo "# might fix some sudo + alias problems" >>$fileAlias
	echo "alias sudo='sudo '" >>$fileAlias
	echo "" >>$fileAlias
	echo "# An alias to save some miliseconds of your time :) " >>$fileAlias
	echo "alias sudos='sudo -s' " >>$fileAlias
	echo "alias suspend='systemctl suspend'" >>$fileAlias
	echo "alias hibernate='systemctl hibernate'" >>$fileAlias
	echo "alias defrag='sudo e4defrag -vc '\$1''" >>$fileAlias
	echo "" >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}extra system linux${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}extra system linux${normal}" ;;
esac
echo "#End of Jose's bashrc modification" >>$fileAlias

##	Checking if .bash_aliases is enabled in .bashrc file	##
if ! grep -q -x -F -e "$lineSearch" <"$file"; then
	echo ""
	echo "${underline}Enabling${normal} .bash_aliases in your .bashrc file"
	echo "" >>"$file"
	echo "if [ -f ~/.bash_aliases ]; then" >>"$file"
	printf '%s\n' "$line" >>"$file"
	echo "fi" >>"$file"
	echo "" >>"$file"
fi

## Updating bash_aliases, so we can use the aliases without rebooting.	##
echo ""
echo "Updating bashrc's..."
source ~/.bash_aliases
. ~/.bash_aliases
source ~/.bashrc
. ~/.bashrc

##	Final echos	##
echo ""
echo "${bold}    ____  ____  _   ________"
echo "   / __ \/ __ \/ | / / ____/"
echo "  / / / / / / /  |/ / __/   "
echo " / /_/ / /_/ / /|  / /___   "
echo "/_____/\____/_/ |_/_____/   "
echo "                            "
echo "${normal}"
echo "We recomend you to ${bold}restart${normal} your ${underline}shell${normal} and ${bold}read${normal} the ${underline}README${normal} file in github to check the aliases."
echo ""
echo "You will find more information and in the ${bold}${purple}README.MD${normal} file :)"
echo "${bold}${underline}https://github.com/Josee9988/bashrcralias${normal}"
echo ""
echo "Thanks for using ${underline}Jose's .bash_aliases modification${normal}"
echo ""

exit
