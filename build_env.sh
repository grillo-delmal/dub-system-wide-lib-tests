#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=cb01957 \
    -t dub-test .
