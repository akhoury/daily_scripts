#!/bin/bash
shopt -s expand_aliases
alias cdoneup="cd .."
for ((n=0;n<$1;n++))
do 
	cdoneup
done
