#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=d88b7b9 \
    -t dub-test .
