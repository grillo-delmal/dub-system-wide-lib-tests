#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=d529b1b \
    -t dub-test .
