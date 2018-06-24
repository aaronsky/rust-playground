#!/bin/sh

PROJECT_DIR=$(git rev-parse --show-toplevel)

rustup override set nightly

rustup target add aarch64-apple-ios
rustup target add armv7-apple-ios
rustup target add armv7s-apple-ios
rustup target add i386-apple-ios
rustup target add x86_64-apple-ios

echo "export PATH=$HOME/.cargo/bin:$PATH" >> "$PROJECT_DIR/.env"
