#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=059291d \
    -t dub-test .
