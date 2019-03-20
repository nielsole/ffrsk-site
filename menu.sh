#!/bin/bash

# allow root to build packages - override secchecks
#
export FORCE_UNSAFE_CONFIGURE=1

# let's loop forever

while [ 1 ]
do

HEIGHT=20
WIDTH=45
CHOICE_HEIGHT=14
BACKTITLE="Gluon 2018.2.x Firmware Builder"
TITLE="L2TP rhein-sieg modulares make"
MENU="Welche Architektur(en) willst Du bauen:"
#
# STABLE:
# * ar71xx-generic
# * ar71xx-tiny
# * ar71xx-nand
# * brcm2708-bcm2708    
# * brcm2708-bcm2709
# * mpc85xx-generic
# * ramips-mt7621
# * sunxi-cortexa7
# * x86-generic
# * x86-geode
# * x86-64
# * ipq40xx
# * ramips-mt7620
# * ramips-mt76x8
# * ramips-rt305x
#
# non-stable: 
#
#  BROKEN:
# * ar71xx-mikrotik    # BROKEN: no sysupgrade support 
# * brcm2708-bcm2710   # BROKEN: Untested
# * ipq806x            # BROKEN: unstable wifi drivers 
# * mvebu-cortexa9      # BROKEN: No AP+IBSS or 11s support
#
# GLUON_WLAN_MESH_11s_BROKEN:
# * ipq40xx
# * ramips-mt7620
# * ramips-mt76x8
# * ramips-rt305x 


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
        13 "ipq40xx"
        14 "ipq806x"
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
            make V=s GLUON_TARGET=ar71xx-generic clean; make V=s GLUON_TARGET=ar71xx-generic GLUON_BRANCH=stable
            #make V=s GLUON_TARGET=ar71xx-generic
            ;;
        3)
            echo "ar71xx-tiny ..."
            make V=s GLUON_TARGET=ar71xx-tiny clean;  make V=s GLUON_TARGET=ar71xx-tiny GLUON_BRANCH=stable
            # make V=s GLUON_TARGET=ar71xx-tiny
            ;;
        4)
            echo "ar71xx-nand ..."
            make V=s GLUON_TARGET=ar71xx-nand clean; make V=s GLUON_TARGET=ar71xx-nand GLUON_BRANCH=stable
            ;;

        5)
            echo "brcm2708-bcm2708 ..."
           make V=s GLUON_TARGET=brcm2708-bcm2708 clean; make V=s GLUON_TARGET=brcm2708-bcm2708 GLUON_BRANCH=stable
            ;;

        6)
            echo "brcm2708-bcm2709 ..."
            make V=s GLUON_TARGET=brcm2708-bcm2709 clean; make V=s GLUON_TARGET=brcm2708-bcm2709 GLUON_BRANCH=stable
           ;;

        7)
            echo "mpc85xx-generic"
            make V=s GLUON_TARGET=mpc85xx-generic clean; make V=s GLUON_TARGET=mpc85xx-generic GLUON_BRANCH=stable
            ;;

        8)
             echo "x86-generic"
             make V=s GLUON_TARGET=x86-generic clean; make V=s GLUON_TARGET=x86-generic GLUON_BRANCH=stable
             ;;

        9)
             echo "x86-geode"
             make V=s GLUON_TARGET=x86-geode clean; make V=s GLUON_TARGET=x86-geode GLUON_BRANCH=stable
             ;;

        10)
             echo "x86-64"
             make V=s GLUON_TARGET=x86-64 clean; make V=s GLUON_TARGET=x86-64 GLUON_BRANCH=stable
            ;;

        98)
             echo "cleaning output"
             rm -r output/*
             ;;

        0)   echo "syncing git tree"
                git pull; make update
             ;;

         99)
             echo "cleaning up all targets ..."
                #  * ar71xx-generic
                make V=s GLUON_TARGET=ar71xx-generic clean
                #
                # * ar71xx-nand
                make V=s GLUON_TARGET=ar71xx-nand clean
                #
                # * ar71xx-tiny
                make V=s GLUON_TARGET=ar71xx-tiny clean
                #
                # * ar71xx-mikrotik
                make V=s GLUON_TARGET=ar71xx-mikrotik clean
                #
                # * brcm2708-bcm2708
                make V=s GLUON_TARGET=brcm2708-bcm2708 clean
                #
                # * brcm2708-bcm2709
                make V=s GLUON_TARGET=brcm2708-bcm2709 clean
                #
                # * mpc85xx-generic
                make V=s GLUON_TARGET=mpc85xx-generic clean
                #
                # * x86-generic
                make V=s GLUON_TARGET=x86-generic clean
                #
                # * x86-geode
                make V=s GLUON_TARGET=x86-geode clean
                #
                # * x86-64
                make V=s GLUON_TARGET=x86-64 clean
                #
                # *  ar71xx-mikrotik
                make V=s GLUON_TARGET=ar71xx-mikrotik clean
                #
                # * brcm2708-bcm2710
                make V=s GLUON_TARGET=brcm2708-bcm2710 clean
                #
                # * ipq40xx
                make V=s GLUON_TARGET=ipq40xx clean
                #
                # * ipq806x
                make V=s GLUON_TARGET=ipq806x clean
                #
                # * mvebu-cortexa9
                make V=s GLUON_TARGET=mvebu-cortexa9 clean
                #
                # * ramips-mt7620
                 make V=s GLUON_TARGET=ramips-mt7620 clean
                #
                # * ramips-mt7621
                make V=s GLUON_TARGET=ramips-mt7621 clean
                #
                # * ramips-mt76x8
                make V=s GLUON_TARGET=ramips-mt76x8 clean
                #
                # * ramips-rt305x
                 make V=s GLUON_TARGET=ramips-rt305x clean
                #
                # * sunxi-cortexa7
                 make V=s GLUON_TARGET=sunxi-cortexa7 clean

             ;;

           1) echo "all platforms ..."
                # Platforms:
                #
                #  * ar71xx-generic
                make V=s GLUON_TARGET=ar71xx-generic clean; make V=s GLUON_TARGET=ar71xx-generic GLUON_BRANCH=stable
                #
                #  * ar71xx-tiny
                make V=s GLUON_TARGET=ar71xx-tiny clean; make V=s GLUON_TARGET=ar71xx-tiny GLUON_BRANCH=stable
                #
                # * ar71xx-nand
                make V=s GLUON_TARGET=ar71xx-nand clean; make V=s GLUON_TARGET=ar71xx-nand GLUON_BRANCH=stable
                #
                # * ar71xx-mikrotik
                make V=s BROKEN=1 GLUON_TARGET=ar71xx-mikrotik  clean; make V=s BROKEN=1 GLUON_TARGET=ar71xx-mikrotik GLUON_BRANCH=stable
                #
                # * brcm2708-bcm2708
                make V=s GLUON_TARGET=brcm2708-bcm2708 clean; make V=s GLUON_TARGET=brcm2708-bcm2708 GLUON_BRANCH=stable
                #
                # * brcm2708-bcm2709
                make V=s GLUON_TARGET=brcm2708-bcm2709 clean; make V=s GLUON_TARGET=brcm2708-bcm2709 GLUON_BRANCH=stable
                #
                # * mpc85xx-generic
                make V=s GLUON_TARGET=mpc85xx-generic clean; make V=s GLUON_TARGET=mpc85xx-generic GLUON_BRANCH=stable
                #
                # * x86-generic
                make V=s GLUON_TARGET=x86-generic clean; make V=s GLUON_TARGET=x86-generic GLUON_BRANCH=stable
                #
                # * x86-geode
                make V=s GLUON_TARGET=x86-geode clean; make V=s GLUON_TARGET=x86-geode GLUON_BRANCH=stable
                #
                # * x86-64
                make V=s GLUON_TARGET=x86-64 clean; make V=s GLUON_TARGET=x86-64 GLUON_BRANCH=stable
                #
                #  * ramips-mt7620
                make V=s GLUON_TARGET=ramips-mt7620 clean; make V=s GLUON_TARGET=ramips-mt7620 GLUON_BRANCH=stable
                #
                #  * ramips-mt7621
                 make V=s BROKEN=1 GLUON_TARGET=ramips-mt7621 GLUON_BRANCH=stable
                #
                #  * ramips-mt76x8
                make V=s GLUON_TARGET=ramips-mt76x8 clean; make V=s GLUON_TARGET=ramips-mt76x8 GLUON_BRANCH=stable
                #
                #  * sunxi-cortexa7
                make V=s GLUON_TARGET=sunxi-cortexa7 clean; make V=s GLUON_TARGET=sunxi-cortexa7 GLUON_BRANCH=stable
                #
                #
                # * ipq40xx
                 make V=s BROKEN=1 GLUON_WLAN_MESH_11s=1 GLUON_TARGET=ipq40xx clean;  make V=s BROKEN=1 GLUON_WLAN_MESH_11s=1 GLUON_TARGET=sunxi-cortexa7 GLUON_BRANCH=stable


                # make stable.manifest
                make manifest GLUON_BRANCH=stable
                #
                # sign images
                contrib/sign.sh /usr/src/freifunk/gluon_openwrt/keys/secret.freifunk-siegburg output/images/sysupgrade/stable.manifest
            ;;

           *) echo "no choice ..."
                   exit 0
           ;;
esac


done # loop forever

