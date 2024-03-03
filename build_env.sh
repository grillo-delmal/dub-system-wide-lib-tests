#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=30d39f8 \
    -t dub-test .
