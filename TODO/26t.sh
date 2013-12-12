#! /bin/bash

cd ./server/testclient

if [ $# -gt 0 ];then 
sed -i "1c reconnect $1" login
fi

./zone_test tcp://10.12.234.26:8080 ../../libsrc/protocol/client_proto/
