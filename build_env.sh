#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=a87d3cc \
    -t dub-test .
