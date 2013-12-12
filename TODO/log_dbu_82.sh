#! /usr/bin/expect
set user dailybuild
set password dailybuild@82
set dst 10.12.190.82

set timeout 10
spawn ssh -l $user $dst
expect {
"(yes/no)" {send "yes\r"; exp_continue}
"password:" {send "$password\r"}
}
interact
