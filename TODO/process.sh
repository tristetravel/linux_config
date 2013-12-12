#!/bin/bash

SCRIPT_NAME=$(basename $0)
SCRIPT_DIR=$(cd "$(dirname $0)"; pwd)
SCRIPT_DIR_NAME=$(basename "${SCRIPT_DIR}")



WORK_DIR=$1
START_TIME=0
END_TIME=0
CUR_DATE=$(date +%Y%m%d)

OUT_FILE_NAME_EQUIPED="equip"
OUT_FILE_NAME_ALL="all"

TARGET_FILE="tb_role_info"

function Start()
{
    echo "start export"
    START_TIME=$(date '+%s')
}

function End()
{
    echo "done"
    END_TIME=$(date '+%s')
}

function main()
{
    if [ $# -eq 1 ]
    then
		Start
        WORKDIR=$1
        cd ${SCRIPT_DIR}/${WORKDIR}
		FILES=($(find . -name "${TARGET_FILE}*" -mtime -1))
		echo ${FILES}
		for file in ${FILES[@]}
		do
			echo ${file}
			${SCRIPT_DIR}/data_export_tool ${file} ../${OUT_FILE_NAME_EQUIPED}_${CUR_DATE} ../${OUT_FILE_NAME_ALL}_${CUR_DATE} 
		done
		End
		COST=$(expr ${END_TIME} - ${START_TIME})
        echo "cost"${COST}
    else
        echo "paremeter error"
    fi
}

main $1
