#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=a86d81c \
    -t dub-test .
