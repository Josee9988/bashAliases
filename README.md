# **ALIASESJOSE**

*My personal aliases.*

---

Shell script that adds several aliases to your '*~/bash_aliases*' file.

If it is not working you may check that in your '*~/.bashrc*' file you have:

```` bash
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
````

Although its meant to be checked automatically by the script.

---

## **Aliases avalaible:**

### For updating and cleaning your system

- **updatef**: For updating and upgrading your system and distro.
- **cleanf**: For cleaning trash and checking if the installations are correct.
- **updateff**: For using *updatef* and then *cleanf* (recommended).

### Easy navigation with *cd*

- **cd..**: So you will not miss if you don't add that space.
- **..**: For going back 1 folders.
- **...**: For going back 2 folders.
- **....**: For going back 3 folders.
- **.....**: For going back 4 folders.

### Easy navigation to main folders

`It also allows lowercase in the name of the folder ex: cddesktop`

- **cdDesktop**: to go to the desktop
- **cdDocuments**: to go to documents
- **cdDownloads**: to go to donwloads
- **cdTrash**: to go to the trash

### Easy extract

- **extract $1**: Use extract + your compressed file and it will use the right decompressor. (.tar.bz2, .tar.gz, .bz2, .rar, .gz, .tar, .tbz2, .tgz, .zip, .z, .7z).

### Mariadb.service (mysql)

- **startmaria**: For starting mariadb.service
- **stopmaria**: For stopping mariadb.service
- **statusmaria**: For knowing the status of mariadb.service
- **usemaria**: For joining mysql as a root using password

### Git

- **gts**: For git status
- **gta**: For git add -a
- **gtm "$1"**: For git commit -m
- **gtl**: For git color formatted with colors
- **gtp**: For git push

### Counting lines

`Example: "clines java css html": will output the number of lines of all the files that are *.java, *.css or *.html. Searched recursively through all subdirectories`

- **clines 'extension'**: Counts the lines of 1 file extension.
- **clines 'extension' 'extension'**: Counts the lines of 2 different file extensions.
- **clines 'extension' 'extension'**: Counts the lines of 3 different file extensions.
- **clines 'extension' 'extension'**: Counts the lines of 4 different file extensions.
- **clines 'extension' 'extension'**: Counts the lines of 5 different file extensions.

### Extra linux system

- **sudos**: Instead of sudo -s
- **hibernate**: Instead of systemctl hibernate
- **suspend**: Instead of systemctl suspend
- **mkdir**: For mkdir -pv
- **ping**: For time ping -c 7
- **calc**: For bc -l
- **rm**: For rm -v
- **mv**: For mv -v

### Extra programs

- **sysinfo**: An alias for 'neofetch'.
- **temp**: An alias for 'sensors'.
