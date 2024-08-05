#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=fe3c077 \
    -t dub-test .
