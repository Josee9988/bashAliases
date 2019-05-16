# **ALIASESJOSE**

---

Shell script that adds several aliases to your '*~/bash_aliases*' file.

You should check that in your '*~/.bashrc*' you have:

```` bash
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
````

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

    It also allows lowercase in the name of the folder

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

### System

- **sudos**: Instead of sudo -s
- **hibernate**: Instead of systemctl hibernate
- **suspend**: Instead of systemctl suspend

### Git

- **gts**: For git status
- **gta**: For git add -a
- **gtm "$1"**: For git commit -m
- **gtl**: For git color formatted with colors
- **gtp**: For git push
