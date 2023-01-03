#!/usr/bin/bash

podman build \
    --build-arg DUB_COMMIT=1330c9d \
    -t dub-test .