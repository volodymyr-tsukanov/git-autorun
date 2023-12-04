#!/bin/bash

# Variables
TAB_SIZE=4
ROWS=64
COLS=64
VERSION="0.1"


# Methods
initialize(){
	ROWS=$(tput lines)
	COLS=$(tput cols)
	TAB_SIZE=$((COLS / 5))
}

awake(){
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
		i=$1	
	elif [ $# -ge 2 ]; then
		i=$1
		s=$2
	fi
	
	while [ $i -gt 0 ]; do
		printf "$s" $s
		i=$((i - 1))
	done
}

welcomePrint(){
	local welcomeText=("    ^    " "   /=\\   " "  =====  " " ------- " "---------" " _______ " "   Git   " " autorun " "---------" "/ * | * \\");
	local tabLng=$((COLS/2))
	tabLng=$((tabLng - 8))
	
	for element in "${welcomeText[@]}"; do
		printTab $tabLng
		echo "${element}"
	done
	
	infoPrint
}
infoPrint(){
	printf "\n\nGit autorun:\n"
	printTab $((TAB_SIZE / 2))
	echo "version: " $VERSION
}


run
