#!/usr/bin/expect

#**************************************************************************************************
#  enter root permission and shut down
#
#  Create  by HuangCaohui <1915589872@qq.com> 
# 
#  Date: 2019-5-16
#
#
#  Updated by HuangCaohui <1915589872@qq.com>
#  Date: 2019-5-18
#
#
#**************************************************************************************************

#Executing shell scripts under expect
spawn su

#Set timeout time to 1s
set timeout 1

#Judge shell scripts return
expect "密码："
send "123456\r"

send "./choose.sh\r"

#stay in the child process and continue typing
interact
