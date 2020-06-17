#!/bin/bash

# allow root to build packages - override secchecks
#
export FORCE_UNSAFE_CONFIGURE=1

#
# for debugging
# X=1
#
# no debugging
X=$(expr $(nproc) + 1)
#

# let's loop forever

while [ 1 ]
do

HEIGHT=20
WIDTH=45
CHOICE_HEIGHT=14
BACKTITLE="Gluon 2020.x Firmware Builder"
TITLE="L2TP rhein-sieg modulares make"
MENU="Welche Architektur(en) willst Du bauen:"

#### Please set GLUON_TARGET to a valid target. Gluon supports the following targets:
#### gluon 2020.2 ff.
#### * ar71xx-generic
#### * ar71xx-tiny
#### * ar71xx-nand
#### * ath79-generic
#### * brcm2708-bcm2708
#### * brcm2708-bcm2709
#### * ipq40xx-generic
#### * ipq806x-generic
#### * lantiq-xrx200
#### * lantiq-xway
#### * mpc85xx-generic
#### * mpc85xx-p1020
#### * ramips-mt7620
#### * ramips-mt7621
#### * ramips-mt76x8
#### * ramips-rt305x
#### * sunxi-cortexa7
#### * x86-generic
#### * x86-geode
#### * x86-legacy
#### * x86-64


OPTIONS=(0 "make update"
        1 "all platforms"
        2 "ar71xx-generic"
        3 "ar71xx-tiny"
        4 "ar71xx-nand"
        5 "brcm2708-bcm2708"
        6 "brcm2708-bcm2709"
        7 "mpc85xx-generic"
        8 "x86-generic"
        9 "x86-geode"
        10 "x86-64"
	11 "ar71xx-mikrotik"
	12 "brcm2708-bcm2710"
	13 "ipq40xx--generic"
	14 "ipq806x-generic"
	15 "mvebu-cortexa9"
	16 "ramips-mt7620"
	17 "ramips-mt7621"
	18 "ramips-mt76x8"
	19 "ramips-rt305x"
	20 "sunxi-cortexa7"

        98 "clean output"
        99 "clean all")


CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)






clear
case $CHOICE in
        2)
            echo "ar71xx-generic ..."
            make -j$X V=s GLUON_TARGET=ar71xx-generic clean; make -j$X V=s GLUON_TARGET=ar71xx-generic GLUON_BRANCH=stable
            #make V=s GLUON_TARGET=ar71xx-generic
            ;;
        3)
            echo "ar71xx-tiny ..."
            make -j$X V=s GLUON_TARGET=ar71xx-tiny clean;  make -j$X V=s GLUON_TARGET=ar71xx-tiny GLUON_BRANCH=stable
            # make V=s GLUON_TARGET=ar71xx-tiny
            ;;
        4)
            echo "ar71xx-nand ..."
            make -j$X V=s GLUON_TARGET=ar71xx-nand clean; make -j$X V=s GLUON_TARGET=ar71xx-nand GLUON_BRANCH=stable
            ;;

        5)
            echo "brcm2708-bcm2708 ..."
           make -j$X V=s GLUON_TARGET=brcm2708-bcm2708 clean; make -j$X V=s GLUON_TARGET=brcm2708-bcm2708 GLUON_BRANCH=stable
            ;;

        6)
            echo "brcm2708-bcm2709 ..."
            make -j$X V=s GLUON_TARGET=brcm2708-bcm2709 clean; make -j$X V=s GLUON_TARGET=brcm2708-bcm2709 GLUON_BRANCH=stable
           ;;

        7)
            echo "mpc85xx-generic"
            make -j$X V=s GLUON_TARGET=mpc85xx-generic clean; make -j$X V=s GLUON_TARGET=mpc85xx-generic GLUON_BRANCH=stable
            ;;

        8)
             echo "x86-generic"
             make -j$X V=s GLUON_TARGET=x86-generic clean; make -j$X V=s GLUON_TARGET=x86-generic GLUON_BRANCH=stable
             ;;

        9)
             echo "x86-geode"
             make -j$X V=s GLUON_TARGET=x86-geode clean; make -j$X V=s GLUON_TARGET=x86-geode GLUON_BRANCH=stable
             ;;

        10)
             echo "x86-64"
             make -j$X V=s GLUON_TARGET=x86-64 clean; make -j$X V=s GLUON_TARGET=x86-64 GLUON_BRANCH=stable

             ;;

        98)
             echo "cleaning output"
             rm -r output/*
             ;;

        0)   echo "syncing git tree"
                git pull; make update
             # echo "adding gl-mifi to targets"
	     #   ./add_gl_mifi.sh
	     #echo "patching respondd multicast address"
             #   ./fix-respondd-rsk.sh


             ;;

         99)
             echo "cleaning up all targets ..."
                for TARGET in $(make list-targets); do
  			make clean GLUON_TARGET=$TARGET
		done 

                
		
             ;;
           1) echo "all platforms ..."
                # Platforms:
                #
                #  * ar71xx-generic
                make -j$X V=s GLUON_TARGET=ar71xx-generic clean; make -j$X V=s GLUON_TARGET=ar71xx-generic GLUON_BRANCH=stable
                #
		# * ar71xx-mikrotik
		#make -j$X V=s BROKEN=1 GLUON_TARGET=ar71xx-mikrotik  clean; make -j$X V=s BROKEN=1 GLUON_TARGET=ar71xx-mikrotik GLUON_BRANCH=stable
                #
                # * ar71xx-nand
                make -j$X V=s GLUON_TARGET=ar71xx-nand clean; make -j$X V=s GLUON_TARGET=ar71xx-nand GLUON_BRANCH=stable
		#
                #  * ar71xx-tiny
                make -j$X V=s GLUON_TARGET=ar71xx-tiny clean; make -j$X V=s GLUON_TARGET=ar71xx-tiny GLUON_BRANCH=stable
                #
 		#  * ath79-generic 
	        make -j$X V=s GLUON_TARGET=ath79-generic clean; make -j$X V=s GLUON_TARGET=ath79-generic GLUON_BRANCH=stable	
 		#	
		# * brcm2708-bcm2708
                make -j$X V=s GLUON_TARGET=brcm2708-bcm2708 clean; make -j$X V=s GLUON_TARGET=brcm2708-bcm2708 GLUON_BRANCH=stable
                #
                # * brcm2708-bcm2709
                make -j$X V=s GLUON_TARGET=brcm2708-bcm2709 clean; make -j$X V=s GLUON_TARGET=brcm2708-bcm2709 GLUON_BRANCH=stable
                #
                # * brcm2708-bcm2710
                make -j$X V=s GLUON_TARGET=brcm2708-bcm2710 clean; make -j$X V=s GLUON_TARGET=brcm2708-bcm2710 GLUON_BRANCH=stable
                #
		# * ipq40xx-generic
		make -j$X V=s BROKEN=1 GLUON_WLAN_MESH_11s_BROKEN=1 GLUON_TARGET=ipq40xx-generic clean;  make -j$X V=s BROKEN=1 GLUON_WLAN_MESH_11s_BROKEN=1 GLUON_TARGET=ipq40xx-generic GLUON_BRANCH=stable		
		#
		# * ipq806x-generic
		make -j$X V=s BROKEN=1 GLUON_WLAN_MESH_11s_BROKEN=1 GLUON_TARGET=ipq806x-generic clean;  make -j$X V=s BROKEN=1 GLUON_WLAN_MESH_11s_BROKEN=1 GLUON_TARGET=ipq806x-generic GLUON_BRANCH=stable		
		# * lantiq-xrx200
		make -j$X V=s GLUON_TARGET=lantiq-xrx200 clean; make -j$X V=s GLUON_TARGET=lantiq-xrx200 GLUON_BRANCH=stable
		# * lantiq-xway
		make -j$X V=s GLUON_TARGET=lantiq-xway clean; make -j$X V=s GLUON_TARGET=lantiq-xway GLUON_BRANCH=stable
		#
                # * mpc85xx-generic
                make -j$X V=s GLUON_TARGET=mpc85xx-generic clean; make -j$X V=s GLUON_TARGET=mpc85xx-generic GLUON_BRANCH=stable
		#
                # * mpc85xx-p1020
		make -j$X V=s GLUON_TARGET=mpc85xx-p1020 clean; make -j$X V=s GLUON_TARGET=mpc85xx-p1020 GLUON_BRANCH=stable
                #
		# * mvebu-cortexa9
                make -j$X V=s GLUON_TARGET=mvebu-cortexa9 clean; make -j$X V=s GLUON_TARGET=mvebu-cortexa9 GLUON_BRANCH=stable
                #
		#  * ramips-mt7620
		make -j$X V=s GLUON_TARGET=ramips-mt7620 clean; make -j$X V=s GLUON_TARGET=ramips-mt7620 GLUON_BRANCH=stable
		#
                #  * ramips-mt7621 
                make -j$X V=s GLUON_TARGET=ramips-mt7621 clean; make -j$X V=s BROKEN=1 GLUON_TARGET=ramips-mt7621 GLUON_BRANCH=stable
		#
		#  * ramips-mt76x8
		make -j$X V=s GLUON_TARGET=ramips-mt76x8 clean; make -j$X V=s GLUON_TARGET=ramips-mt76x8 GLUON_BRANCH=stable
	 	#
		#  * ramips-rt305x
		make -j$X V=s GLUON_TARGET=ramips-rt305x clean; make -j$X V=s GLUON_TARGET=ramips-rt305x GLUON_BRANCH=stable
		#
		#  * sunxi-cortexa7
		make -j$X V=s GLUON_TARGET=sunxi-cortexa7 clean; make -j$X V=s GLUON_TARGET=sunxi-cortexa7 GLUON_BRANCH=stable
		#
                # * x86-generic
                make -j$X V=s GLUON_TARGET=x86-generic clean; make -j$X V=s GLUON_TARGET=x86-generic GLUON_BRANCH=stable
                #
                # * x86-geode
                make -j$X V=s GLUON_TARGET=x86-geode clean; make -j$X V=s GLUON_TARGET=x86-geode GLUON_BRANCH=stable
                #
                # * x86-64
                make -j$X V=s GLUON_TARGET=x86-64 clean; make -j$X V=s GLUON_TARGET=x86-64 GLUON_BRANCH=stable
                #
	       	# * x86-legacy
	        make -j$X V=s GLUON_TARGET=x86-legacy clean; make -j$X V=s GLUON_TARGET=x86-legacy GLUON_BRANCH=stable	
		#

    	 	# make stable.manifest
                make manifest GLUON_BRANCH=stable
                #
                # sign images
                contrib/sign.sh /usr/src/freifunk/gluon_openwrt/keys/secret.freifunk-siegburg output/images/sysupgrade/stable.manifest

		# build factory image for archer c50v4
		./makearcherc50v4factory.sh
            ;;

           *) echo "no choice ..."
                   exit 0
           ;;
esac


done # loop forever

