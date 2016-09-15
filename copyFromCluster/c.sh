#!/usr/bin/expect
set timeout 3
#set from [lindex $argv 0];
set from [lindex $argv 0];

#send_user "copy from $from to $to.\r"
#copy to shared.
spawn ssh middle

expect "linjun"
send "su cluster\r"

expect "Password:"
send "cluster510\r"

expect "cluster"
send "cd ~/linjunhao/Projects\r"
#
expect "cluster"
send "cd $from\r"

#copy from shared to destination
expect "cluster"
send "echo cluster510|sudo -S chown -R cluster:cluster /home/linjunhao/shared/*\r"
#
expect "cluster"
send "echo cluster510|sudo -S mv /home/linjunhao/shared/* ./\r"
send "\r"
interact
#expect eof
