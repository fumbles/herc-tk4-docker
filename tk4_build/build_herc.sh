#!/bin/bash

echo "Building....."
echo "Trying command: \"podman buildx build --platform linux/amd64 -t tk4-herc --load .\""
# docker build -t tk4-herc . //If using linux and not on an arm mac
podman buildx build --platform linux/amd64 -t tk4-herc --load .
