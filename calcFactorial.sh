#!/bin/sh
echo "Enter number"

read number

res=1

for (( i=1; i <= ${number}; i++ )) 
do
	res=$(( $res * $i ))
done

echo "${res}"

echo "--------"

function factorial {
	typeset n=$1
	
	if [[ $n < 2 ]] 
	then
		echo 1
		return
	fi

	echo $(( n * $(factorial $((n-1))) ))
}

echo "$(factorial $number)"
