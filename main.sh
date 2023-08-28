#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://gitlab.com/Jhyub/supergfxctl-plasmoid -b v1.3.0
cp -rvf ./debian ./supergfxctl-plasmoid/
cd ./supergfxctl-plasmoid/

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
