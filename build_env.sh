#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=2ea8838 \
    -t dub-test .
