#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=665173f \
    -t dub-test .
