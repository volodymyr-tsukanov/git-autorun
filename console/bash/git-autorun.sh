#!/bin/bash

# Variables
welcomeText="/---/ Git autorun \\---\\"

TAB_SIZE=4
ROWS=64
COLS=64


# Methods
initialize(){
	ROWS=$(tput lines)
	COLS=$(tput cols)
	TAB_SIZE=$((COLS / 5))
	echo "initialized"
}

awake(){
	echo "awake"
	
	welcomePrint
}

run(){
	initialize
	awake
}


printTab(){
	local i=$TAB_SIZE
	local s=" "
	
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
	printTab $((COLS / 3))
	echo $welcomeText
}


run