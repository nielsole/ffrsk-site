#!/bin/bash

bootfile="/usr/src/freifunk/Firmware/u-boot-loader/archer-c50-v4-boot.bin"
# echo $bootfile
gluonfile=`ls output/images/sysupgrade/ | grep archer-c50-v4`
# echo $gluonfile
factoryfile=`echo $gluonfile | sed -e 's/-sysupgrade//g'`
# echo $factoryfile
echo "$bootfile output/images/sysupgrade/$gluonfile > output/images/factory/$factoryfile"
cat $bootfile output/images/sysupgrade/$gluonfile > output/images/factory/$factoryfile

