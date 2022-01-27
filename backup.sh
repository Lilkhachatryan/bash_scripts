#!/bin/sh

if [ $# != 2 ]; then
        echo "$0 <file> <time>"
        exit 1
fi

backup_dest="./backup_dist"

backup_dir=$1

# Create archive filename.
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

for entry in $(find ./backup_dist/ -type f)
do
  	echo "entry - ${entry}"
	val1=($(md5sum $backup_dest/$archive_file))
	val2=($(md5sum $entry))

	echo val1 $val1
	echo val2 $val2

	if [ $val1 = $val2 ] 
	then
		echo "file name is already taken"
	else
		tar -zcvf $backup_dest/$archive_file $backup_dir
	fi
done

find $backup_dest -mindepth 1 -mtime +5 -delete

$(*/2 * * * * ./Documents/DevOps/bash_scripts/backup.sh -with args)

# restore - tar -tzvf /mnt/backup/host-Monday.tgz

