#!/usr/bin/env bash

podman build \
    --build-arg DUB_COMMIT=a1172d256446814948221e9b275ca95afa4588af \
    -t dub-test .
