GLUON_SITE_PACKAGES := \
GLUON_SITE_PACKAGES := \
    gluon-alfred \
    gluon-autoupdater \
    gluon-banner \
    gluon-check-client-mesh \
    gluon-check-mesh \
    gluon-config-mode-autoupdater \
    gluon-config-mode-contact-info \
    gluon-config-mode-core \
    gluon-config-mode-geo-location \
    gluon-config-mode-hostname \
    gluon-config-mode-tunneldigger \
    gluon-ebtables-filter-multicast \
    gluon-ebtables-filter-ra-dhcp \
    gluon-luci-admin \
    gluon-luci-autoupdater \
    gluon-luci-node-role \
    gluon-luci-portconfig \
    gluon-luci-private-wifi \
    gluon-luci-wifi-config \
    gluon-mesh-batman-adv-15 \
    gluon-mesh-vpn-tunneldigger \
    gluon-migrate-vpn \
    gluon-neighbour-info \
    gluon-next-node \
    gluon-radvd \
    gluon-respondd \
    gluon-rfkill-disable
    gluon-setup-mode \
    gluon-ssid-changer \
    gluon-status-page \
    gluon-tunneldigger-watchdog \
    haveged
    iptables \
    iwinfo \
    rsk-nightswitch \

DEFAULT_GLUON_RELEASE := 2015.1.1-stable-2.1
# Allow overriding the release number from the command line

GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)
GLUON_PRIORITY ?= 0
GLUON_LANGS ?= en de
GLUON_REGION ?= eu
