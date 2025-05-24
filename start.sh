#!/bin/bash

# Detect platform and architecture crap...
OS=$(uname -s)
ARCH=$(uname -m)

echo "Detected OS: $OS"
echo "Detected ARCH: $ARCH"

# Determine container runtime
if [[ "$OS" == "Darwin" && "$ARCH" == "arm64" ]]; then
    echo "Running on Apple Silicon (ARM Mac)..."
    my_docker="podman"
elif [[ "$OS" == "Linux" ]]; then
    echo "Running on Linux..."
    my_docker="docker"
else
    echo "Unsupported platform: $OS $ARCH"
    exit 1
fi

# Run Docker Compose (or Podman Compose)
$my_docker compose -f docker-compose.yml up -d

sleep 1
$my_docker ps --format "table {{.Image}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}" | grep tk4
