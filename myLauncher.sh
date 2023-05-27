#!/bin/bash


if [ ! -e "/home/teliute/build-JUST_HLL_Robomaster_CV-Desktop_Qt_5_12_2_GCC_64bit-Release/JUST_HLL_Robomaster_CV" ];
then
	./compile.sh
fi

while :
do
	# get the PID of pocess
	stillRunning=$(pidof "JUST_HLL_Robomaster_CV")
	
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

	# give hints
	if [ $numCam == 0 ]
	then
		echo "No cameras detected"
		echo
	fi

	if [ $numSerial == 0 ]
	then
		echo "No serials detected"
		echo
	fi

	# execute the application
	if [ $numCam == 0 ] || [ $numSerial == 0 ];
	then 
		if [ "$stillRunning" ]	
		then
			kill $(pidof "JUST_HLL_Robomaster_CV")	
		fi
	elif [ "$stillRunning" ];
	then
		echo "JUST_HLL_Robomaster_CV was already started by another way"
		echo "Kill it and then start up by this shell, otherwise this will loop out this message annoyingly"
		echo "PID of JUST_HLL_Robomaster_CV:" $(pidof "JUST_HLL_Robomaster_CV")
		echo
	else
		echo "JUST_HLL_Robermaster_CV was not started"
		echo "Starting service ..."
		gnome-terminal -x bash -c "/home/teliute/build-JUST_HLL_Robomaster_CV-Desktop_Qt_5_12_2_GCC_64bit-Release/JUST_HLL_Robomaster_CV"
		echo "JUST_HLL_Robomaster_CV was started"
		echo
	fi	
	sleep 1
done
