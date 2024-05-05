#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=ae08003 \
    -t dub-test .
