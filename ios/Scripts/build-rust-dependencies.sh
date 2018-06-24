#!/bin/sh

PROJECT_ROOT="$PROJECT_DIR/../"
ENV_FILE="$PROJECT_ROOT/.env"

if [ -f "$ENV_FILE" ]; then
    # shellcheck disable=1090
    # shellcheck disable=2039
    source "$ENV_FILE"
fi

RUST_DIR="$PROJECT_ROOT/rust/"

cd "$RUST_DIR" || exit 1

if [ "$CONFIGURATION" = "Debug" ]; then
    echo "Building in debug mode"
    cargo lipo
else
    echo "Building in release mode"
    cargo lipo --release
fi