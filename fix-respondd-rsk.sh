#!/bin/bash
patch -p1 < patches/package/101-add-respondd-clientdev.patch
grep 'ff02::2:1001 $meshdevs $clientdevs'  package/gluon-respondd/files/etc/init.d/gluon-respondd

