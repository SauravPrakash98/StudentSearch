#!/bin/bash

echo Student Search
cd data
zero=0
while [ $zero == 0 ]
do

	echo "Press enter "1" to search by Roll , "2" for Name , "3" for Hall , "4" for Department , "5" for email "
	read var
	if [ $var == 1 ]; then
		echo Enter the Roll Number
		read Roll
		p="Roll : $Roll"
	elif [ $var == 2 ]; then
		echo Enter the Name
		read name
		q="Name : $name"
	elif [ $var == 3 ]; then
		echo Enter the Hall no.
		read hall
		rs="Info : HALL$hall"
	elif [ $var == 4 ]; then
		echo Enter the Department
		read dept
		s="Department : $dept"
	elif [ $var == 5 ]; then
		echo Enter the Email Id
		read emailid
		t="Email : $emailid"
	fi
	echo Press 1 to show result or 0 to add more infomation
	read final
	if [ $final == 1 ]
       	then
		break
	fi
done
grep -rih -B1 -A6 "$p" | grep -ih -A7 "$q" |  grep -ih -B4 -A3 "$rs" |  grep -ih -B3 -A4 "$s" |  grep -ih -B5 -A2 "$t"

