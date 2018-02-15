#!/bin/bash

# allow root to build packages - override secchecks
#
export FORCE_UNSAFE_CONFIGURE=1
X=$(expr $(nproc) + 1)

# let's loop forever

while [ 1 ]
do

HEIGHT=20
WIDTH=45
CHOICE_HEIGHT=14
BACKTITLE="Gluon 2017.1 Firmware Builder"
TITLE="L2TP rhein-sieg modulares make"
MENU="Welche Architektur(en) willst Du bauen:"

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
        11 "clean output"
        12 "clean all")


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
            
            ;;
        3)
            echo "ar71xx-tiny ..."
            make -j$X V=s GLUON_TARGET=ar71xx-tiny clean;  make -j$X V=s GLUON_TARGET=ar71xx-tiny GLUON_BRANCH=stable
            
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

        11)
             echo "cleaning output"
             rm -r output/*
             ;;

        0)   echo "syncing git tree"
                git pull; make update
             ;;

         12)
             echo "cleaning up all targets ..."
                #  * ar71xx-generic
                make -j$X V=s GLUON_TARGET=ar71xx-generic clean
                #
                # * ar71xx-nand
                make -j$X V=s GLUON_TARGET=ar71xx-nand clean
                #
                # * ar71xx-tiny
                make -j$X V=s GLUON_TARGET=ar71xx-tiny clean
                #
                # * brcm2708-bcm2708
                make -j$X V=s GLUON_TARGET=brcm2708-bcm2708 clean
                #
                # * brcm2708-bcm2709
                make -j$X V=s GLUON_TARGET=brcm2708-bcm2709 clean
                #
                # * mpc85xx-generic
                make -j$X V=s GLUON_TARGET=mpc85xx-generic clean
                #
                # * x86-generic
                make -j$X V=s GLUON_TARGET=x86-generic clean
                #
                # * x86-geode
                make -j$X V=s GLUON_TARGET=x86-geode clean
                #
                # * x86-64
                make -j$X V=s GLUON_TARGET=x86-64 clean
                #
             ;;
           1) echo "all platforms ..."
                # Platforms:
                #
                #  * ar71xx-generic
                make -j$X V=s GLUON_TARGET=ar71xx-generic clean; make -j$X V=s GLUON_TARGET=ar71xx-generic GLUON_BRANCH=stable
                #
                #  * ar71xx-tiny
                make -j$X V=s GLUON_TARGET=ar71xx-tiny clean; make -j$X V=s GLUON_TARGET=ar71xx-tiny GLUON_BRANCH=stable
                #
                # * ar71xx-nand
                make -j$X V=s GLUON_TARGET=ar71xx-nand clean; make -j$X V=s GLUON_TARGET=ar71xx-nand GLUON_BRANCH=stable
                #
                # * brcm2708-bcm2708
                make -j$X V=s GLUON_TARGET=brcm2708-bcm2708 clean; make -j$X V=s GLUON_TARGET=brcm2708-bcm2708 GLUON_BRANCH=stable
                #
                # * brcm2708-bcm2709
                make -j$X V=s GLUON_TARGET=brcm2708-bcm2709 clean; make -j$X V=s GLUON_TARGET=brcm2708-bcm2709 GLUON_BRANCH=stable
                #
                # * mpc85xx-generic
                make -j$X V=s GLUON_TARGET=mpc85xx-generic clean; make -j$X V=s GLUON_TARGET=mpc85xx-generic GLUON_BRANCH=stable
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
                #  * ramips-mt7621
                 make -j$X V=s BROKEN=1 GLUON_TARGET=ramips-mt7621 GLUON_BRANCH=stable
                 #
                 # make stable.manifest
                make manifest GLUON_BRANCH=stable
                #
                # sign images
                contrib/sign.sh /usr/src/freifunk/gluon_lede/keys/secret.freifunk-siegburg output/images/sysupgrade/stable.manifest

            ;;

           *) echo "no choice ..."
                   exit 0
           ;;
esac


done # loop forever


