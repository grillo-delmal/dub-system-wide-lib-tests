#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=9655378 \
    -t dub-test .
