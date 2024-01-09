#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=8faab63 \
    -t dub-test .
