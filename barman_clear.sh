#!/bin/bash
#Author: Damian Golał

#Obsługa flagi -n
while getopts n: flag
do
    case "${flag}" in
        n) name=${OPTARG};;
    esac
done

list=/tmp/failed_backups_list
path=/storage/barman-backup
SUM=0

#Tworzenie spisu FAILED BACKUPS
barman list-backup $name |grep FAILED > $list

#Dostosowanie pliku
sed -i "s/$name //" $list
sed -i 's/ - FAILED//' $list

#Usuwanie backupów
cd $path/$name/base
xargs -I{} rm -r "{}" < $list

#Log
SUM=$(wc -l < $list)
echo "[$(date)] Removed ${SUM} failed ${name} Barman backups." >> /var/log/barman_clear

#Czyszczenie listy
rm -rf $list
