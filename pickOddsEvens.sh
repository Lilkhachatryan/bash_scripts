#!/bin/sh

args=( "$@")

sorted=($(printf '%s\n' "${args[@]}"|sort))

re='^[0-9]+$'
odds=()
evens=()

for i in ${sorted[@]} 
do 
	if ! [[ $i =~ $re ]]
	then
		echo "error: Not a number"; exit 1
	fi	


	if [ $(( $i % 2)) -eq 0 ]
	then
		 evens+=($i)
	else
		odds+=($i)
	fi	
done

echo "odds - ${odds[@]}"
echo "evens - ${evens[@]}"

