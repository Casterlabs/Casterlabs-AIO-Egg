#!/bin/bash

TARGETARCH="arm64"

sudo docker build \ 
    --build-arg TARGETOS=linux \ 
    --build-arg $TARGETARCH \ 
    --tag e3ndr/java11-node16-go1_18:$TARGETARCH \ 
    ./java11-node16-go1_18

sudo docker build \ 
    --build-arg TARGETOS=linux \ 
    --build-arg $TARGETARCH \ 
    --tag e3ndr/java8-node16-go1_18:$TARGETARCH \ 
    ./java8-node16-go1_18



TARGETARCH="amd64"

sudo docker build \ 
    --build-arg TARGETOS=linux \ 
    --build-arg $TARGETARCH \ 
    --tag e3ndr/java11-node16-go1_18:$TARGETARCH \ 
    ./java11-node16-go1_18

sudo docker build \ 
    --build-arg TARGETOS=linux \ 
    --build-arg $TARGETARCH \ 
    --tag e3ndr/java8-node16-go1_18:$TARGETARCH \ 
    ./java8-node16-go1_18
