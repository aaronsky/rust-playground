#!/bin/sh

PROJECT_ROOT="$PROJECT_DIR/../"
ENV_FILE="$PROJECT_ROOT/.env"

if [ -f $ENV_FILE ]; then
    source $ENV_FILE
fi

RUST_DIR="$PROJECT_ROOT/rust/"

cd $RUST_DIR
make ios
