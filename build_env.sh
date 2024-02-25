#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=dd9e2f6 \
    -t dub-test .
