#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=84cab2a \
    -t dub-test .
