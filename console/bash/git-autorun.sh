#!/bin/bash

# Variables
welcomeText="Git autorun"

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
	local width=$((COLS / 3));
	local height=$((ROWS / 3));
	local h_center=$((ROWS / 3));
	local v_center=$((COLS / 3));
	
	local h2=$((height / 2))
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
		if [ $r -lt $v_center ]; then
			printTab $c;
			printf "%s" $leftText;
			printTab $s;
			printf "%s lt\n" $rightText;
			
			s=$((s + 2));
			
			c=$((c - 1));
		elif [ $r -eq $h2 ]; then
			printTab $c;
			printf "|---|";
			printTab $((width - 11));
			printf "%s" $welcomeText;
			printTab $((width - 11));
			printf "|---| \n";
		elif [ $r -gt $h2 ]; then
			printTab $c;
			printf "%s" $rightText;
			printTab $r;
			printf "%s rt\n" $leftText;
			
			s=$((s - 2));
			
			c=$((c + 1));
		fi
		
		r=$((r + 1));
	done
	printTab $h_center;
	echo $tailText;
}


run
