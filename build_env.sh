#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=ef0bf93 \
    -t dub-test .
