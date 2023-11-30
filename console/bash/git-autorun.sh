#!/bin/bash

# Variables
welcomeText="Git Autorun"

TAB_SIZE=4
ROWS=64
COLS=64
VERSION="0.1"


# Methods
initialize(){
	ROWS=$(tput lines);
	COLS=$(tput cols);
	TAB_SIZE=$((COLS / 5));
}

awake(){
	welcomePrint;
}

run(){
	initialize;
	awake;
}


printTab(){
	local i=$TAB_SIZE;
	local s=" ";
	
	if [ $# -eq 1 ]; then
		i=$1;	
	elif [ $# -ge 2 ]; then
		i=$1;
		s=$2;
	fi
	
	while [ $i -gt 0 ]; do
		printf "$s" $s;
		i=$((i - 1));
	done
}

welcomePrint(){
	local width=$((COLS / 2));
	local height=$((ROWS / 2));
	local h_center=$((ROWS + 8));
	local v_center=$((COLS + 8));
	
	local h3=$((height / 3))
	local r=0;
	local c=$((h_center - 1));
	local s=0;
	local headText="________";
	local tailText="========";
	local leftText="/---/";
	local rightText="\\---\\";
	
	printTab $h_center;
	echo $headText;
	while [ $r -lt $height ]; do
		if [ $r -lt $h3 ]; then
			printTab $c;
			printf "%s" $leftText;
			printTab $s;
			printf "%s\n" $rightText;
			
			s=$((s + 2));
			c=$((c - 1));
		elif [ $r -eq $h3 ]; then
			c=$((c + 1));
			# s=$((s + 1));
			printTab $c;
			printf "|--|";
			local textLng=${#welcomeText};
			local diff=$((s - textLng));
			if [ $diff -gt 0 ]; then
				local diff2=$((diff / 2));
				printTab $diff2;
				printf "%s" $welcomeText;
				printTab $((diff - diff2));
			else
				printf "%s" ${welcomeText:0:s};
			fi
			printf "|--|\n";
			s=$((s - 2));
		else
			printTab $c;
			printf "%s" $rightText;
			printTab $s;
			printf "%s\n" $leftText;
			
			s=$((s - 2));
			c=$((c + 1));
		fi
		
		r=$((r + 1));
	done
	printTab $h_center;
	echo $tailText;
}


run
