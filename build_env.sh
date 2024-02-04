#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=164d55d \
    -t dub-test .
