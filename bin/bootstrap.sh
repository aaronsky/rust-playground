#!/bin/sh

PROJECT_DIR=$(git rev-parse --show-toplevel)

rustup update

rustup target add aarch64-apple-ios armv7-apple-ios armv7s-apple-ios i386-apple-ios x86_64-apple-ios

cargo install cargo-lipo 2> /dev/null

ENV_FILE="$PROJECT_DIR/.env"

if [ -f "$ENV_FILE" ]; then
    echo "Skipped creating a new .env file in the root as one already exists."
else
    # shellcheck disable=2016
    echo 'export PATH=$HOME/.cargo/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export NDK_HOME=$ANDROID_HOME/ndk-bundle' > "$ENV_FILE"
    echo "Created .env file in project root. Enter other environment variables that Xcode or Gradle ought to know about."
fi

