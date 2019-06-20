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

echo "#!/bin/bash" >>$fileAlias

echo "### Jose's bashrc modification ###" >>$fileAlias

echo "${red}${bold}updatef${normal} and ${red}${bold}cleanf${normal} aliases, updates and upgrades your system and cleans it."
read -p "Do you wish to install ${red}${bold}updatef and cleanf${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	##  ADDING UPDATEF, CLEANF AND UPDATEFF ##
	{
		echo ""
		echo "#updatef and cleanf must be executed as 'Superuser$'"
		echo "#updatef Will check for updates for normal software installed and also for your distro and after all"
		echo "#cleanf will clean trash that you don't really need and will check if any installation has gone through any error."
		echo "alias updatef='echo "Downloading software" && echo "" && apt-get update && echo "Updating distro" && echo "" && apt dist-upgrade && echo "" && echo "Upgrading software" && echo "" && apt-get upgrade'"
		echo "alias cleanf='echo "Cleaning trash..." && rm -rf /tmp/* && echo "" && apt-get autoclean && echo "" && echo "Removing and checking failed installations" && echo "" && apt-get autoremove && apt-get clean && apt-get check && apt install -f'"
		echo ""
		echo "# For all the update and upgrades and after that cleans your system. Updatef + cleanf all in one command"
		echo "alias updateff='updatef && cleanf'"
	} >>$fileAlias
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
	{
		echo ""
		echo "## Get rid of command not found ##"
		echo "alias cd..='cd ..'"
		echo ""
		echo "## A quick way to move backwards from the current directory ##"
		echo "alias ..='cd ..'"
		echo "alias ...='cd ../../'"
		echo "alias ....='cd ../../../'"
		echo "alias .....='cd ../../../../'"
		echo ""
	} >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}cd${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}cd${normal}" ;;
esac

echo ""
##  EXTRACT ##
echo "You can also install '${red}${bold}extract${normal}', which will uncompress almost any kind of compressed file, you will not need to worry what command uncompresses which file, just '${red}${bold}extract${normal}'"
read -p "Do you wish to install ${red}${bold}extract${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	{
		echo "## Use only 'extract' for most of your compressed files. ##"
		echo "extract () { "
		echo "   if [ -f \"\$1\" ] ; then "
		echo "       case \"\$1\" in "
		echo "           *.tar.bz2)   tar xvjf \"\$1\"    ;; "
		echo "           *.tar.gz)    tar xvzf \"\$1\"    ;; "
		echo "           *.bz2)       bunzip2 \"\$1\"     ;; "
		echo "           *.rar)       unrar x \"\$1\"     ;; "
		echo "           *.gz)        gunzip \"\$1\"      ;; "
		echo "           *.tar)       tar xvf \"\$1\"     ;; "
		echo "           *.tbz2)      tar xvjf \"\$1\"    ;; "
		echo "           *.tgz)       tar xvzf \"\$1\"    ;; "
		echo "           *.zip)       unzip \"\$1\"       ;; "
		echo "           *.Z)         uncompress \"\$1\"  ;; "
		echo "           *.7z)        7z x \"\$1\"        ;; "
		echo "           *)           echo \"do not know how to extract \$1 ...\" ;; "
		echo "       esac "
		echo "   else "
		echo "       echo \"\$1 is not a valid file, or has spaces in it!\" "
		echo "   fi "
		echo " } "
		echo ""
	} >>$fileAlias
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
	{
		echo "# For starting mariadb.service "
		echo "alias startmaria='systemctl start mariadb.service' "
		echo ""
		echo "# For stopping mariadb.service "
		echo "alias stopmaria='systemctl stop mariadb.service' "
		echo ""
		echo "# For knowing the status of mariadb.service "
		echo "alias statusmaria='systemctl status mariadb.service' "
		echo ""
		echo "# Using mysql with root "
		echo "alias usemaria='mysql -u root -p' "
	} >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}mariadb${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}mariadb${normal}" ;;
esac
echo ""

## FAST NAVIGATION TO COMMON FOLDERS	##
read -p "Do you wish to install ${red}${bold}easy common folder navigation${normal} aliases? [Yy/Nn] " yn
case $yn in
[Yy]*)
	{
		echo ""
		echo "# dont write again ~/... "
		echo "alias cdDesktop='cd ~/Desktop/' "
		echo "alias cdDocuments='cd ~/Documents/' "
		echo "alias cdDownloads='cd ~/Downloads/' "
		echo "alias cdTrash='cd ~/.local/share/Trash/' "
		echo ""
		echo "alias cddesktop='cd ~/Desktop/' "
		echo "alias cddocuments='cd ~/Documents/' "
		echo "alias cddownloads='cd ~/Downloads/' "
		echo "alias cdtrash='cd ~/.local/share/Trash/' "
		echo ""
	} >>$fileAlias
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
	{
		echo "# Git"
		echo "alias gts='git status'"
		echo "alias gta='git add -A'"
		echo "alias gtm='git commit -m '$1''"
		echo "alias gtp='git push'"
		echo "alias gtl='git log --color --graph --pretty=format:\"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\" --abbrev-commit --'"
		echo ""
		echo "#Create GitHub repository from terminal using GitHub API, with curl"
		echo "gtCreate () {"
		echo "    cancel=false"
		echo "    unset email"
		echo "    unset name"
		echo "    unset description"
		echo ""
		echo "    echo \"We will create a GitHub repository from scratch' you will need to have installed 'curl' and 'git'. \""
		echo "    echo """
		echo ""
		echo "    while [ -z \"\$email\" ]; do"
		echo "        read -p 'Username or email address of your Github account: ' email"
		echo "    done"
		echo "    while [ -z \"\$name\" ]; do"
		echo "        read -p 'Name of the new repository: ' name"
		echo "    done"
		echo "    while [ -z \"\$description\" ]; do"
		echo "        read -p 'Description of the new repository: ' description"
		echo "    done"
		echo ""
		echo '    read -p "Do you wish to make the repository private?[Yy/Nn]: " yn'
		echo "    case \$yn in"
		echo "    [Yy]* )"
		echo "        curl -u \"\$email\" https://api.github.com/user/repos -d '{\"name\":\"'\"\$name\"'\",\"private\":\"true\",\"description\":\"'\"\$description\"'\"}'"
		echo "        ;;"
		echo "    [Nn]* )"
		echo "        curl -u \"\$email\" https://api.github.com/user/repos -d '{\"name\":\"'\"\$name\"'\",\"description\":\"'\"\$description\"'\"}'"
		echo "        ;;"
		echo "    * ) echo 'Please answer yes or no. Your installation will be aborted. Try again'"
		echo "        cancel=true"
		echo "        ;;"
		echo "    esac"
		echo ""
		echo "    #creating local folder and initializating git"
		echo "    if [ \$cancel == false ]; then"
		echo "    	mkdir -pv \"\$name\""
		echo "    	if cd \"\$name\"; then echo \"Ok\"; else echo \"Fail when executing cd \$name\" exit; fi"
		echo "    	git init"
		echo "    fi"
		echo "}"
		echo ""
	} >>$fileAlias
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
	{
		echo "##	COUNT LINES	##"
		echo "clines () { "
		echo "	if [ -z \"\$1\" ]; then"
		echo "		echo 'At least give one file type by parameter'"
		echo "	elif  [ -z \"\$2\" ]; then"
		echo "		find -type f -name \"*.\$1\" -o -name \"*.\$2\" | xargs wc -l | sort -n"
		echo "	elif  [ -z \"\$3\" ]; then"
		echo "		find -type f -name \"*.\$1\" -o -name \"*.\$2\" -o -name \"*.\$3\" | xargs wc -l | sort -n"
		echo "	elif  [ -z \"\$4\" ]; then"
		echo "		find -type f -name \"*.\$1\" -o -name \"*.\$2\" -o -name \"*.\$3\" -o -name \"*.\$4\" | xargs wc -l | sort -n"
		echo "	elif  [ -z \"\$5\" ]; then"
		echo "		find -type f -name \"*.\$1\" -o -name \"*.\$2\" -o -name \"*.\$3\" -o -name \"*.\$4\" -o -name \"*.\$5\" | xargs wc -l | sort -n"
		echo "	fi"
		echo "} "
		echo ""
	} >>$fileAlias
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
	{
		echo "alias sysinfo='neofetch'"
		echo ""
	} >>$fileAlias
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
	{
		echo ""
		echo "alias temp='sensors'"
		echo ""
	} >>$fileAlias
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
	{
		echo "#Extra linux commands"
		echo "alias mkdir='mkdir -pv'"
		echo "alias ping='time ping -c 7'"
		echo "alias rm='rm -v'"
		echo "alias mv='mv -v'"
		echo "alias calc='bc -l'"
		echo ""
		echo "# might fix some sudo + alias problems"
		echo "alias sudo='sudo '"
		echo ""
		echo "# An alias to save some miliseconds of your time :) "
		echo "alias sudos='sudo -s' "
		echo "alias suspend='systemctl suspend'"
		echo "alias hibernate='systemctl hibernate'"
		echo "alias defrag='sudo e4defrag -vc '\"\$1\"''"
		echo "alias sysinf='cat /etc/os-release'"
		echo "alias ram='free -h'"
		echo "dusage() {"
		echo "	du -hsBM \"\$1\"* | sort -n"
		echo "}"
		echo ""
	} >>$fileAlias
	;;
[Nn]*) echo "Not installing ${bold}extra system linux${normal}" ;;
*) echo "Please answer yes or no. Your installation now will continue not installing ${bold}extra system linux${normal}" ;;
esac
echo "#End of Jose's bashrc modification" >>$fileAlias

##	Checking if .bash_aliases is enabled in .bashrc file	##
if ! grep -q -x -F -e "$lineSearch" <"$file"; then
	echo ""
	echo "${underline}Enabling${normal} .bash_aliases in your .bashrc file"
	echo "" >>$file
	echo "if [ -f ~/.bash_aliases ]; then" >>$file
	printf '%s\n' "$line" >>$file
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
echo "We recomend you to ${bold}restart${normal} your ${underline}terminal${normal} and ${bold}read${normal} the ${underline}README${normal} file in github to check the aliases."
echo ""
echo "You will find more information and in the ${bold}${purple}README.MD${normal} file :)"
echo ""
echo "${bold}${underline}https://github.com/Josee9988/bashrcralias${normal}"
echo ""
echo "Thanks for using ${underline}Jose's .bash_aliases modification${normal}"
echo ""

exit
