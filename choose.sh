#!/bin/bash

#**************************************************************************************************
#  offer shutdown options
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

echo "1	shutdown now"
echo "2	reboot"
read -p "input a number:" num
echo

if [ $num == 1 ];
then
	shutdown -h now
elif [ $num == 2 ];
then
	shutdown -r now
else
	echo "Please input a number between 1 and 2!!!"
fi
