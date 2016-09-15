#!/usr/bin/expect
set timeout 3
#set from [lindex $argv 0];
set to [lindex $argv 0];

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
send "cd $to\r"

#copy from shared to destination
expect "cluster"
send "echo cluster510|sudo -S chown -R cluster:cluster /home/linjunhao/shared/*\r"
#
expect "cluster"
#rsync -a arhives mode; -I: don't skip files.
send "rsync -aI /home/linjunhao/shared/* ./\r"
#send "echo cluster510|sudo -S mv -u /home/linjunhao/shared/* ./\r"

expect "cluster"
send "echo cluster510|sudo -S rm -rf /home/linjunhao/shared/*\r"

expect "cluster"
send "ls\r"
interact
#expect eof
