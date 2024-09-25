#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=a1d23d0 \
    -t dub-test .
