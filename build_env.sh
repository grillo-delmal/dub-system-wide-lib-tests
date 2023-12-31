#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=2c8ceb9 \
    -t dub-test .
