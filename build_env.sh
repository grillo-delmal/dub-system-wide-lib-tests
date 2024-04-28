#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=89252c8 \
    -t dub-test .
