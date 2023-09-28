#!/bin/bash

text=''
char=''

while getopts ":s:c:" o; do
    case "${o}" in
        s)
            text=${OPTARG}
            ;;
        c)
            char=${OPTARG}
            ;;
        *)
	    echo "Usage: $0 [-s <text>] [-c <character>]"
	    exit 1
            ;;
    esac
done

if [ -n "$char" ]; then
	box_width=$(( ${#text} + 4 ))

	for ((i=0; i<box_width; i++)); do
		echo -n "$char"
	done

	echo
	echo "$char" "$text" "$char"

	for ((i=0; i<box_width; i++)); do
		echo -n "$char"
	done
	echo
else
	echo "$text"
fi
