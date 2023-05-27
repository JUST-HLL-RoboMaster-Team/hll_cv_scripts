#!/bin/bash

#**************************************************************************************************
#  compile .pro project files
#
#  Create  by HuangCaohui <1915589872@qq.com> 
# 
#  Date: 2019-5-17
#
#
#  Updated by HuangCaohui <1915589872@qq.com>
#  Date: 2019-5-18
#
#
#**************************************************************************************************

if [ -e "build-JUST_HLL_Robomaster_CV-Desktop_Qt_5_12_2_GCC_64bit-Release" ]
then
	rm -r build-JUST_HLL_Robomaster_CV-Desktop_Qt_5_12_2_GCC_64bit-Release
fi

if [ -e "/home/teliute/JUST_HLL_Robomaster_CV/Makefile" ]
then
	rm -r /home/teliute/JUST_HLL_Robomaster_CV/Makefile
fi

cd JUST_HLL_Robomaster_CV
qmake JUST_HLL_Robomaster_CV.pro
make clean
make -j8
