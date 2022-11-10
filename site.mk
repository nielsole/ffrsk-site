GLUON_SITE_PACKAGES := \
    gluon-autoupdater \
    gluon-config-mode-autoupdater \
    gluon-config-mode-contact-info \
    gluon-config-mode-core \
    gluon-config-mode-geo-location \
    gluon-config-mode-hostname \
    gluon-config-mode-mesh-vpn \
    gluon-core \
    gluon-banner \
    gluon-check-client-mesh \
    gluon-check-mesh \
    gluon-ebtables \
    gluon-ebtables-filter-multicast \
    gluon-ebtables-filter-ra-dhcp \
    gluon-ebtables-source-filter \
    gluon-ebtables-limit-arp \
    gluon-web-admin \
    gluon-web-autoupdater \
    gluon-web-network \
    gluon-web-private-wifi \
    gluon-web-wifi-config \
    gluon-mesh-batman-adv-15 \
    gluon-mesh-vpn-tunneldigger \
    gluon-neighbour-info \
    gluon-radvd \
    gluon-respondd \
    respondd-module-airtime \
    gluon-setup-mode \
    gluon-ssid-changer \
    gluon-status-page \
    gluon-status-page-mesh-batman-adv \
    haveged \
    iwinfo \
    iw-full \
    rsk-nightswitch \
    gluon-rsk-speedlimit \
    gluon-rsk-block-mesh \
    gluon-rsk-config \
    gluon-ping-check \
    rsk-robinson


DEFAULT_GLUON_RELEASE := stable-3.6.0
# Allow overriding the release number from the command line

GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)
GLUON_PRIORITY ?= 0
GLUON_LANGS ?= de en
GLUON_REGION ?= eu
# Build ATH10K images
GLUON_ATH10K_MESH ?= 11s
GLUON_WLAN_MESH ?= 11s

# Do build images for deprecated devices
GLUON_DEPRECATED ?= full
