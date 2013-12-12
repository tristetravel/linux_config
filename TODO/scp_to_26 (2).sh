#! /usr/bin/expect
set user tristeding
set password tristeding
set dst 10.12.234.26

set path /data/tristeding/kihan/zonesvr/bin/
set home /data/tristeding/

#set src [lindex $argv 0]
set src server/zonesvr/zonesvr

set src_name [exec basename $src]

set cmd "cd $path../script && ./admin.sh stop && cp $home$src_name $path$src_name && ./admin.sh start"

set timeout 15
spawn rsync -avuzp $src $user@$dst:~/$src_name
expect {
"(yes/no)" {send "yes\r"; exp_continue}
"password:" {send "$password\r"}

# "*$" {send "cd ~/kihan/zonesvr/script/ && ./admin.sh stop && mv ~/$src $path$src && ./admin start\r"}
}

 expect "total"

set timeout 10
spawn ssh -l $user $dst $cmd

expect {
"(yes/no)" {send "yes\r"; exp_continue}
"password:" {send "$password\r"}
}

expect "OK"


