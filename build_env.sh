#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=5e58fc0 \
    -t dub-test .
