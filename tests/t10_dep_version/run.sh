#!/usr/bin/bash

set -e
set -x

# Copy local stuff to rw folder

mkdir -p /opt/src
rsync -r /opt/orig/local/ /opt/src/

# Build test
cd /opt/src/app
for d in ./deps/*/ ; do
    dub add-local $d --cache=local
done

dub run --skip-registry=all --cache=local
