#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=a8da51e \
    -t dub-test .
