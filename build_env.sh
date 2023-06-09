#!/usr/bin/bash

podman build \
    --build-arg DUB_COMMIT=bff9000 \
    -t dub-test .
