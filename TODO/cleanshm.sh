#! /bin/bash

NAME=$1
#list
SHM_TABLE=(`ipcs | awk -F " " -v OWNER="${NAME}" '$3 == OWNER {print $2}'`)

echo ${SHM_TABLE[@]}

#clean
for item in ${SHM_TABLE[@]}
do
    ipcrm -m ${item}
    echo "clean ${item}"
done

