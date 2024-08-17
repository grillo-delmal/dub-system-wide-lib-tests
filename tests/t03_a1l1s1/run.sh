#!/usr/bin/bash

set -e
set -x

# Copy local stuff to rw folder

mkdir -p /opt/src
rsync -r /opt/orig/local/ /opt/src/

# Build test
cd /opt/src/app
dub add-local /opt/src/lib2
dub build \
    $DUB_PARAMS \
    --cache=local --temp-build \
    --skip-registry=all \
    --compiler=ldc2

cp -r /tmp/.dub/build/app-~master/* out
cd out
# Run test
./app