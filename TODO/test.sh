#! /bin/bash

cd ./server/testclient

if [ $# -gt 0 ];then 
sed -i "1c reconnect $1" login
fi

./zone_test tcp://10.12.190.83:8062 ../../libsrc/protocol/client_proto/
