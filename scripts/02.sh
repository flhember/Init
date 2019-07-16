#!/bin/bash

read -p "Entrer nom d'utilisateur:" user
id -u "$user" > /dev/null 2>&1
if [ "$?" = "0" ];
then
	echo "Utilisateur valide"
else
	echo "Utilisateur invalide" && exit
fi
if [ "-z" $(sudo pgrep -u "$user") 2>/dev/null ];
then
	echo "Utilisateur pas logue" && exit
else
	echo "Utilisateur logue"
fi
sudo passwd -l $user
sudo killall -KILL -u "$user"
sudo userdel -r -f "$user"
if [ "-z" $(cat /etc/passwd | grep "$user") ];
then
	echo "Utilisateur bien surpprime"
else
	echo "Utilisateur pas surpprime"
fi
exit
