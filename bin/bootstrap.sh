#!/bin/sh

PROJECT_DIR=$(git rev-parse --show-toplevel)

rustup override set nightly

rustup target add aarch64-apple-ios
rustup target add armv7-apple-ios
rustup target add armv7s-apple-ios
rustup target add i386-apple-ios
rustup target add x86_64-apple-ios

cargo install cargo-lipo 2> /dev/null

ENV_FILE="$PROJECT_DIR/.env"

if [ -f "$ENV_FILE" ]; then
    echo "Skipped creating a new .env file in the root as one already exists."
else
    echo 'export PATH=$HOME/.cargo/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export NDK_HOME=$ANDROID_HOME/ndk-bundle' > "$ENV_FILE"
    echo "Created .env file in project root. Enter other environment variables that Xcode or Gradle ought to know about."
fi

