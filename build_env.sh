#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=33f3ceb \
    -t dub-test .
