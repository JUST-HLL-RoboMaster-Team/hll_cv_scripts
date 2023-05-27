#!/bin/bash

#**************************************************************************************************
#  obtain hardware and process parameters
#
#  Create  by HuangCaohui <1915589872@qq.com> 
# 
#  Date: 2019-5-18
#
#
#  Updated by HuangCaohui <1915589872@qq.com>
#  Date: 2019-5-18
#
#
#**************************************************************************************************

	
# get the number of cameras
CAMPATH=/dev/video
declare -i numCam=0
for((i=0; i<=32; i=i+1))
do
	test -c ${CAMPATH}${i} && numCam=numCam+1
done
echo $numCam" Cameras"

# get the number of serials
SERIALPATH=/dev/ttyUSB
declare -i numSerial=0

for((j=0; j<=32; j=j+1))
do
	test -c ${SERIALPATH}${j} && numSerial=numSerial+1
done
echo $numSerial" Serials"	

# Get the PID of pocess 
echo "PID of myLauncher:" $(ps -e | grep myLauncher | awk '{printf $1}')
echo "PID of JUST_HLL_Robomaster_CV:" $(pidof "JUST_HLL_Robomaster_CV")

