#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=5a9e230 \
    -t dub-test .
