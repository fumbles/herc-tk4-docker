#!/bin/bash

echo "Building....."
echo "Trying command: \"podman buildx build --platform linux/amd64 -t tk4-mvs --load .\""
# docker build -t tk4-mvs . //If using linux and not on an arm mac
podman buildx build --platform linux/amd64 -t tk4-mvs --load .
