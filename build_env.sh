#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=eb937f3 \
    -t dub-test .
