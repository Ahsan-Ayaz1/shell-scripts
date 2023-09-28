#!/bin/bash

STRING="$@"
width=${#STRING}

for ((i=1; i<=2; i++))
do

    for ((j=1; j<=$width+4; j++))
    do
        echo -n "*"
    done
    echo ""
    if [ $i -eq 1 ]; then
	echo -n '* '
	echo -n $STRING
	echo  ' *'
    fi

done
