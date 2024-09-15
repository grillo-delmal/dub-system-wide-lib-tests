#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=6e14b65 \
    -t dub-test .
