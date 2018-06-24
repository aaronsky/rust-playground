# Rust Playground App

Currently does not work, but stands as an example of cross-compiled Rust on iOS and Android for personal use.

The goal for this project is to get the Rust compiler running on iOS/Android for something similar to the [Rust Playground](https://github.com/integer32llc/rust-playground) on web. Currently only iOS is technically supported by a cross-compilation step, and the linking is rudimentary. 

# Setup

Run `./bin/bootstrap.sh` in your terminal. This assumes you already have Rustup and a nightly build installed. 

# `.env`

The bootstrap script creates a `.env` file in your project root. This file is automatically loaded as part of the iOS (and eventually Android) build process while compiling Rust and allows you to pass in required environment variables. It should not be checked into source control. 

# License

This project is licensed under Apache-2.0. 
