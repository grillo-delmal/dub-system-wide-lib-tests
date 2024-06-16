#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=6610ddf \
    -t dub-test .
