#! /usr/bin/expect

set user naruto
set password naruto_2014
set dst 10.12.190.83

set timeout 10
spawn ssh -l $user -o TCPKeepAlive=yes $dst
expect {
"(yes/no)" {send "yes\r"; exp_continue}
"password:" {send "$password\r"}
}
interact
