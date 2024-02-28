#!/usr/bin/expect

set PDYm1 [lindex $argv 0]
#/usr/bin/expect<<EOF
set timeout 600
spawn sftp daobs@61.56.11.112
expect "password:"
send "Cwb+12345678\r"
expect "sftp>"
send "cd daobs\r"
expect "sftp>"
#send "lcd /lfs/h2/emc/da/noscrub/Shastri.Paturi/forCWB/\r"  
send "put -r /lfs/h2/emc/da/noscrub/Shastri.Paturi/forCWB/$PDYm1\r"
expect "sftp>"
send "exit\r"
interact

