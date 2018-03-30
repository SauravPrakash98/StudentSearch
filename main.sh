#!/bin/bash
clear
echo -e "                                 \e[1m\e[32m Student Search\n\e[0m"
cd data
zero=0
while [ $zero == 0 ]
do

	echo -e "\e[93mPress "1" to search by Roll , "2" for Name , "3" for Hall , "4" for Department , "5" for email \e[0m"
	read var
	if [ $var == 1 ]; then
		echo -e "\e[94mEnter the Roll Number \e[0m"
		read Roll
		while [ -z "$Roll" ]
		do
			echo -e "\e[91mPlease enter correct Roll number again\e[0m"
			read Roll
		done
		p="Roll : $Roll"
		
	elif [ $var == 2 ]; then
		echo -e "\e[94mEnter the Name\e[0m"
		read name
		while [ -z "$name" ]
		do
			echo -e "\e[91mPlease enter correct Name again\e[0m"
			read name
		done
		q="Name : $name"
	elif [ $var == 3 ]; then
		echo -e "\e[94mEnter the Hall no.\e[0m"
		read hall
		while [ -z "$hall" ]
		do
			echo -e "\e[91mPlease enter correct hall again\e[0m"
			read hall
		done
		rs="Info : HALL$hall"
	elif [ $var == 4 ]; then
		echo -e "\e[94mEnter the Department\e[0m"
		read dept
		while [ -z "$dept" ]
		do
			echo -e "\e[91mPlease enter correct Department again\e[0m"
			read dept
		done
		s="Department : $dept"
	elif [ $var == 5 ]; then
		echo -e "\e[94mEnter the Email Id\e[0m"
		read emailid
		while [ -z "$emailid" ]
		do
			echo  -e "\e[91mPlease enter correct EmailID again\e[0m"
			read emailid
		done
		t="Email : $emailid"
	fi
	echo -e "\e[93mPress 1 to show result or 0 to add more infomation\e[0m"
	read final
	if [ $final == 1 ]
       	then
		break
	fi
done
grep -rih -B1 -A6 "$p" | grep -ih -A7 "$q" |  grep -ih -B4 -A3 "$rs" |  grep -ih -B3 -A4 "$s" |  grep -ih -B5 -A2 "$t"

