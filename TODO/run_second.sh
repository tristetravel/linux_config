#! /bin/bash

. common.sh

ERROR=$(grep error ${QQ_OPENID})

if [ ${ERROR} != " " ]; then
    echo qq_openid has error,please check the file line has "send idip error" and resolve this
    echo ${ERROR}
else
    ./trans_data.py ${RECHARGE_DATA} ${LEVEL_DATA} ${DATA} ${QQ_OPENID}
fi



