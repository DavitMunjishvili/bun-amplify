#!/bin/bash
docker login
docker buildx build --platform linux/arm64,linux/amd64 -t davitmunjishvili/bun-amplify:1.3.7 --push .
