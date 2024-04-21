#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=2f918df \
    -t dub-test .
