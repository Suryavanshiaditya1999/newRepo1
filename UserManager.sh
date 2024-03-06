#!/bin/bash

choice=$1
# groupname=$2
# username=$3

case $choice in
 addTeam)
 groupname=$2
 sudo groupadd $groupname
 echo "new group is added with name amigo"
 ;;
 addUser)
 username=$2
 groupname=$3
 sudo useradd $username
 sudo usermod -aG $groupname $username
 echo "new user $username is added in a group $groupname"
 current_username=$(whoami)
 chmod 751 /home/$current_username
sudo mkdir -p /home/$username/team /home/$username/ninja
sudo chmod 771 /home/$username/team /home/$username/ninja
;;
deleteTeam)
groupname=$2
sudo groupdel $groupname
echo "group $groupname is deleted from system"
;;
 deleteUser)
username=$2
sudo userdel -r $username
echo "User $username is deleted is deleted from system"
;;
changeUserPasswd)
username=$2
sudo passwd $username
;;
changeShell)
username=$2
new_shell=$3
sudo usermod -s $new_shell $username
echo "Shell for user $username changed to $new_shell"
;;
ls)
 list_type=$2
case $list_type in
User)
echo "list of users:"
cut -d: -f1 /etc/passwd
;;
Team)
echo "list of groups:"
cut -d: -f1 /etc/group
;;
*)
echo "Invalid list type. Please specify 'User' or 'Team'."
;;
*)
echo "invalid choice"
;;
esac
