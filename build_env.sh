#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=6deb4e3 \
    -t dub-test .
