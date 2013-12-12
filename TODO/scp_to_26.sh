#! /usr/bin/expect
set user tristeding
set password tristeding
set dst 10.12.234.26
set src [lindex $argv0]

set timeout 10
spawn scp $src $user@$dst:~
expect {
"(yes/no)" {send "yes\r"; exp_continue}
"password:" {send "$password\r"}
}
interact
