#!/bin/bash
## A quick bash script to quickly Change Directory(cd) in an 'Upward' direction

## INSTALL: 
## just copy this file into your home dir, or wherever you want
# sudo chmod +x $HONE/cds.sh
## then add this line to your .bashrc file to create an alias command (remove the # )
# alias cds='. $HOME/cds.sh'


SCRIPT_PATH=$(pwd) # path of the script is located
SCRIPT_NAME=$0   # $0 is the name of the script
HELP=false 
REVERSE=false
NUMBER=false
EXACT=false
DIRS_ARRAY=[]
arg_1=""

shopt -s expand_aliases
shopt -s nocasematch 
alias cd1s="cd .."

##############################
##### FUNCTIONS ##############
##############################

# usage print out function
function usage () {
   cat <<EOF
Usage: $SCRIPT_NAME  [ ' ' OR '-' OR ':'  ][ INTEGER OR STRING ]

## TAKES ONE ARGUMENT ONLY

    ?   		:displays this help
    STRING		:searches the PATH for the closest similar match ignoring cases, then Changes Directory to the match dir.
   -STRING		:just like the above but in reverse order, from root->down, cannot be used with ':'
   :NUMBER 	    :tries the param as a number and changes directory upward [NUMBER] times until hits root, cannot be used with '-', falls back to string if NAN
   ,STRING		:searches the PATH for an exact match, still IGNORE CASES for the moment, then changes directory to the match dir.

Example usage: 
				$ cds mydir
				$ cds -mydir
				$ cds :4
				$ cds ,myDir
				$ cds -,myDir SAME AS $ cds ,-myDir
				
EOF
}

# checks the argument if number or not
function check_it () {
# splits the pwd path into an arry using the '/' as delimiter
IFS='/' read -a DIRS_ARRAY <<< "$SCRIPT_PATH"

if [[ $NUMBER == true ]]; then
  if [[ "$arg_1" =~ ^[0-9]+$ ]]; then 
    cds_nb
  else
    echo "[WARN] argument '$arg_1' after ':' was not an integer, treated as a string..."
    cds_str
  fi
else 
  cds_str
fi
}

function cds_nb () {
if [[ $arg_1 < ${#DIRS_ARRAY[@]} ]]; then  
  for (( n = 0 ; n < $arg_1; n++ )) do 
    cd1s
  done
else
	cd '/'
fi
}

function cds_str () {
if [[ "$SCRIPT_PATH" == *$arg_1*   ]]; then 
	if [[ $REVERSE == true && $EXACT == false ]]; then
	  cds_str_rvrs_handle
	elif [[ $REVERSE == false && $EXACT == false ]]; then
	  cds_str_handle
	elif [[  $REVERSE == true && $EXACT == true ]]; then
	  cds_str_rvrs_exact_handle	
	elif [[ $REVERSE == false && $EXACT == true ]]; then
	  cds_str_exact_handle
	fi
else
	echo "[ERROR]: No *match* to *$arg_1* found in '$SCRIPT_PATH'"
fi
}

function cds_str_handle () { 
PATH_TO=""
for (( i = ${#DIRS_ARRAY[@]} - 1 ; i > 0  ; i-- )) do
 if [[ "${DIRS_ARRAY[$i]}" == *$arg_1* ]]; then
    for (( j = 1 ; j <= i ; j++ )) do
	  PATH_TO="$PATH_TO/${DIRS_ARRAY[$j]}"
	done
	cd $PATH_TO
    break
  fi
done 
}

function cds_str_exact_handle () { 
PATH_TO=""
for (( i = ${#DIRS_ARRAY[@]} - 1 ; i > 0  ; i-- )) do
 if [[ "${DIRS_ARRAY[$i]}" == $arg_1 ]]; then
    for (( j = 1 ; j <= i ; j++ )) do
	  PATH_TO="$PATH_TO/${DIRS_ARRAY[$j]}"
	done
	cd $PATH_TO
    break
  fi
done 
}

function cds_str_rvrs_handle () { 
PATH_TO=""
for (( i = 1; i < ${#DIRS_ARRAY[@]} ; i++ )) do
 PATH_TO="$PATH_TO/${DIRS_ARRAY[$i]}"
 if [[ "${DIRS_ARRAY[$i]}" == *$arg_1* ]]; then
	cd $PATH_TO
    break
  fi
done 
}

function cds_str_rvrs_exact_handle () {
PATH_TO=""
for (( i = 1; i < ${#DIRS_ARRAY[@]} ; i++ )) do
 PATH_TO="$PATH_TO/${DIRS_ARRAY[$i]}"
 if [[ "${DIRS_ARRAY[$i]}" == $arg_1 ]]; then
	cd $PATH_TO
    break
  fi
done
}

if [[ $# == 0 ]]; then
	cd
elif [[ $# == 1 ]]; then
  case $1 in
	-h)  HELP=true; usage ;;
	-,*) REVERSE=true; EXACT=true; arg_1=`echo "$1" | sed 's/-,//1'`;;
        ,-*) REVERSE=true; EXACT=true; arg_1=`echo "$1" | sed 's/,-//1'`;;
	,*)	 EXACT=true; REVERSE=false; arg_1=`echo "$1" | sed 's/,//1'`;;
	-*)  REVERSE=true; arg_1=`echo "$1" | sed 's/-//1'` ;;
	:*)  NUMBER=true; arg_1=`echo "$1" | sed 's/://1'` ;; 
	'?')   HELP=true; usage ;;
	*)   arg_1=$1 ;;
  esac
else
	echo "[ERROR] cds takes only ONE argument"; usage;  
fi

if [[ $HELP == false ]]; then
  check_it
fi
