#!/bin/bash

echo "Setting minimal profile"
rustup set profile minimal

echo "Defaulting to stable"
rustup default stable

echo "Installing cargo-skyline."
cargo install --git https://github.com/raytwo/cargo-skyline --branch std-change

echo "Updating skyline std (this may take a minute, with no output)"
cargo skyline update-std

echo "Installing python3"
apt-get update && apt-get install -y python3

echo "Clearing out unnecessary cargo files"
rm -rf ~/.cargo/skyline/toolchain/skyline/share/doc/*

echo "Setup complete."