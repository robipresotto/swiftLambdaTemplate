#!/bin/bash

set -eu

# 1. Creates the image/dependencies to build the lambda runtime
docker build -t swift-lambda-builder . && \

# 2. Build the aws lambda runtime
docker run \
       --rm \
       --volume "$(pwd)/:/src" \
       --workdir "/src/" \
       swift-lambda-builder \
       swift build --product $1 -c release && \

# 3. Copy libs and creates the symlink
docker run \
       --rm \
       --volume "$(pwd)/:/src" \
       --workdir "/src/" \
       swift-lambda-builder \
       scripts/package.sh $1
