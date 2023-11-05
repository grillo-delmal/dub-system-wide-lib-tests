#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=6e6bf4a \
    -t dub-test .
