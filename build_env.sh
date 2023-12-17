#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=afaf10a \
    -t dub-test .
