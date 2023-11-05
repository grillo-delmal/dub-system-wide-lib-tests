#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=fc0726e \
    -t dub-test .
