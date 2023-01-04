#!/usr/bin/bash

podman build \
    --build-arg DUB_COMMIT=dcbfcf2 \
    -t dub-test .