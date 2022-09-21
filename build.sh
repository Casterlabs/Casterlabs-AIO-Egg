#!/bin/bash

sudo docker buildx build \
    --platform linux/arm64,linux/amd64
    --tag e3ndr/java11-node16-go1_18:$TARGETARCH \
    ./java11-node16-go1_18

sudo docker buildx build \
    --platform linux/arm64,linux/amd64
    --tag e3ndr/java8-node16-go1_18:$TARGETARCH \
    ./java8-node16-go1_18
