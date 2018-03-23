#!/bin/bash

echo Enter Batch year
read year
mkdir data/y$year
cd data/y$year
for roll in `seq 14001 14900`;
do
	mkdir $roll
	cd $roll
	curl https://oa.cc.iitk.ac.in/Oa/Jsp/OAServices/IITk_SrchRes.jsp\?typ\=stud\&numtxt\=$roll\&sbm\=Y >tmp1
	# URL


	awk '/: <\/b>/,/<\/p>/' tmp1 > tmp2
	#tmp file for scraping usable information

	name=$(awk '/Name: <\/b>/,/<\/p>/' tmp2 | cut -d \< -f-1 |  sed -e 's/^[ \t]*//' )
	size=${#name}
	if [ $size == 2 ]
	then
		rm tmp1 tmp2
		cd ..
		rm -rf $roll
		break
	else
		echo Name ":" $name >> logfile
		echo Roll ":" $roll >>logfile
		program=$(awk '/Program: <\/b>/,/<\/p>/' tmp2 | cut -d \< -f-1 | sed -e 's/^[ \t]*//' )
		echo Program ":" $program >>logfile
		dept=$(awk '/Department: <\/b>/,/<\/p>/' tmp2 | cut -d \< -f-1 | sed -e 's/^[ \t]*//' )
		echo Department ":" $dept >>logfile
		inf=$(awk '/Info: <\/b>/,/<br>/' tmp2 | cut -d \< -f-1 | sed -e 's/^[ \t]*//' )
		echo Info ":" $inf >>logfile
		email=$(grep "mailto" tmp2 | cut -d "\"" -f2 | cut -d ":" -f2-)
		echo Email ":" $email >>logfile
		blood=$(awk '/Group:<\/b>/,/<!--</' tmp2 | cut -d \< -f-1 | sed -e 's/^[ \t]*//' )
		echo Blood Group ":" $blood >> logfile
		gender=$( awk '/Gender:<\/b>/,/<b> Co/' tmp2 | cut -d \< -f-1 | sed -e 's/^[ \t]*//' )
		echo Gender ":" $gender >>logfile
		#displaying the information
	fi
	rm tmp1 tmp2
	#removing the temp files
	cd ..
done
cd ..
cd ..

