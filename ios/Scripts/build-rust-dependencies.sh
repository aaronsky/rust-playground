#!/bin/bash

function ios_archs_to_triples()
{
    local triples=()
    for arch in "$@"; do
        case $arch in
            arm64) triples+=("aarch64-apple-ios")
                ;;
            armv7) triples+=("armv7-apple-ios")
                ;;
            armv7s) triples+=("armv7s-apple-ios")
                ;;
            x86_64) triples+=("x86_64-apple-ios")
                ;;
            i386) triples+=("i386-apple-ios")
                ;;
        esac
    done
    echo "${triples[@]}"
}

PROJECT_ROOT="$PROJECT_DIR/../"
ENV_FILE="$PROJECT_ROOT/.env"

if [ -f "$ENV_FILE" ]; then
    # shellcheck disable=1090
    # shellcheck disable=2039
    source "$ENV_FILE"
fi

TARGET_TRIPLES=$(ios_archs_to_triples "${ARCHS[@]}" | tr ' ' ',')

RUST_DIR="$PROJECT_ROOT/rust/"
cd "$RUST_DIR" || exit 1

if [ "$CONFIGURATION" = "Debug" ]; then
    echo "Building triples ($TARGET_TRIPLES) in debug mode"
    cargo lipo --targets "$TARGET_TRIPLES"
else
    echo "Building triples ($TARGET_TRIPLES) in release mode"
    cargo lipo --release --targets "$TARGET_TRIPLES"
fi
