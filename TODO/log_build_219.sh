#! /usr/bin/expect
set user tristeding
set password tristeding
set dst 10.12.75.219

set timeout 10
spawn ssh -l $user -o TCPKeepAlive=yes $dst
expect {
"(yes/no)" {send "yes\r"; exp_continue}
"password:" {send "$password\r"}
}
interact
