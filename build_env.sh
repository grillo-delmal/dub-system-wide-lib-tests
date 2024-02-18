#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=ca4c2ce \
    -t dub-test .
