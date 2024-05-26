#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=e172da4 \
    -t dub-test .
