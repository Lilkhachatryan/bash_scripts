#!/etc/shells/bin/sh

function min() {
	if [ $1 -le $2 ]
	then
		echo "$1"
	else 
		echo "$2"
	fi
}

function max() {
	if [ $1 -ge  $2 ]
	then
                echo $1
        else 
                echo $2
        fi
}

minVal=$(min $1 $(min $2 $3))

maxVal=$(max $1 $(max $2 $3))

echo "min - $minVal"

echo "max - $maxVal"
