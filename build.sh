#!/bin/bash
set -e

# Defaults
BUILD_TOOL=""
TARGET=""
HERCULES_TAG="latest"
MVSCE_TAG="latest"
TK4_TAG="latest"
LIST_TAGS=false

# Parse flags
while [[ $# -gt 0 ]]; do
  case "$1" in
    --use-docker)
      BUILD_TOOL="docker"
      shift
      ;;
    --hercules-tag)
      HERCULES_TAG="$2"
      shift 2
      ;;
    --mvsce-tag)
      MVSCE_TAG="$2"
      shift 2
      ;;
    --tk4-tag)
      TK4_TAG="$2"
      shift 2
      ;;
    --list-tags)
      LIST_TAGS=true
      shift
      ;;
    tk4|hercules|mvsce|all)
      TARGET="$1"
      shift
      ;;
    *)
      echo "❌ Unknown argument: $1"
      echo
      echo "Usage: $0 [--use-docker] [--hercules-tag tag] [--mvsce-tag tag] [--tk4-tag tag] [--list-tags] [tk4|hercules|mvsce|all]"
      exit 1
      ;;
  esac
done

# List local image tags and exit
if [[ "$LIST_TAGS" == true ]]; then
  echo "📦 Available tags for each image:"
  echo
  docker image ls | grep -E 'hercules-local|hercules-mvsce-local|tk4-mvs' || echo "No tagged images found."
  exit 0
fi

# Detect platform if BUILD_TOOL not explicitly set
if [[ -z "$BUILD_TOOL" ]]; then
  case "$(uname)" in
    Darwin) BUILD_TOOL="podman" ;;
    Linux)  BUILD_TOOL="docker" ;;
    *)      echo "❌ Unsupported OS: $(uname)"; exit 1 ;;
  esac
fi

echo "💡 Using build tool: $BUILD_TOOL"
echo "💡 Building target: ${TARGET:-all}"
echo "🔖 Hercules tag: $HERCULES_TAG"
echo "🔖 MVSCE tag:    $MVSCE_TAG"
echo "🔖 TK4 tag:      $TK4_TAG"

# Image names with tags
hercules_image="hercules-local:${HERCULES_TAG}"
mvsce_image="hercules-mvsce-local:${MVSCE_TAG}"
tk4_image="tk4-mvs:${TK4_TAG}"

# Paths
TK4_DIR="tk4_build"
MVSCE_DIR="mvsce_build"

# Build functions
build_hercules() {
  echo "🔨 Building Hercules base image: ${hercules_image}"
  $BUILD_TOOL build -t "${hercules_image}" -f "${MVSCE_DIR}/Dockerfile.hercules" "${MVSCE_DIR}"
}

build_mvsce() {
  echo "📦 Building MVSCE image: ${mvsce_image}"
  $BUILD_TOOL build -t "${mvsce_image}" -f "${MVSCE_DIR}/Dockerfile.mvsce" "${MVSCE_DIR}"
}

build_tk4() {
  echo "🛠️  Building TK4-MVS image: ${tk4_image}"
  $BUILD_TOOL buildx build --platform linux/amd64 -t "${tk4_image}" --load "${TK4_DIR}"
}

# Build dispatch
case "${TARGET:-all}" in
  hercules)
    build_hercules
    ;;
  mvsce)
    build_mvsce
    ;;
  tk4)
    build_tk4
    ;;
  all)
    build_hercules
    build_mvsce
    build_tk4
    ;;
esac
