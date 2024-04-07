#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=0699f67 \
    -t dub-test .
