#!/bin/sh


#for arg; do
#	echo "$arg"
#done

args=( "$@" )
len=${#args[@]}

if [ $len -lt 2 ] 
then
	echo "Need to provide at leat 2 args"
	exit 1
fi

min=$1
max=$1
  

for (( i = 1; i < ${#args[@]}; i++ ))
do	
	item=${args[$i]}
	
	if [ $item -gt $max ]
        then
                max=$item
        fi

	if [ $item -lt $min ] 
	then
		min=$item
	fi

done

echo "max - ${max}"
echo "min - ${min}"
