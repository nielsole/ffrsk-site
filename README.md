# ffsu-site
tools for building firmware images from gluon 2017.x / 2018.x / 2019.x / 2020.x / 2021.x / 2022.x

# Usage

## Cloning Gluon

1. Clone the gluon repo.
2. Checkout the release you want to use
2. `cd gluon`

## Adding ffrsk-site

```
gluon# git clone git@github.com:Freifunk-Rhein-Sieg/ffrsk-site.git site
```

## Adding freifunk-packages

```
gluon# cd package
gluon/package# git clone git@github.com:Freifunk-Rhein-Sieg/freifunk-packages.git
gluon/package# ln -s freifunk-packages/gluon* .
gluon/package# ln -s freifunk-packages/nightswitch 
```

## Applying patches

Sometimes there are multiple patches with the same content for different versions.
Carefully select which patches you want to apply.
Example:

```
$ pwd
gluon/ffrsk-site
$ cat patches/103-mac8011-iwfull.patch | git patch
$ cat patches/package/102-fix-respondd-rsk.patch | git apply
```
