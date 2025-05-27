#!/bin/bash

set -e

hercules_image="hercules-local"
mvsce_image="hercules-mvsce-local"

# Build Hercules image
build_hercules() {
    echo "🔨 Building Hercules base image: ${hercules_image}"
    docker build -t "${hercules_image}" -f Dockerfile.hercules .
}

# Build MVSCE image
build_mvsce() {
    echo "📦 Building MVSCE image: ${mvsce_image}"
    docker build -t "${mvsce_image}" -f Dockerfile.mvsce .
}

# Help message
usage() {
    echo "Usage: $0 [hercules|mvsce|all]"
    echo
    echo "  hercules   Build only the Hercules base image"
    echo "  mvsce      Build only the MVSCE image"
    echo "  all        Build both Hercules and MVSCE (default)"
    exit 1
}

# Main logic
case "$1" in
    hercules)
        build_hercules
        ;;
    mvsce)
        build_mvsce
        ;;
    all|"")
        build_hercules
        build_mvsce
        ;;
    *)
        usage
        ;;
esac

