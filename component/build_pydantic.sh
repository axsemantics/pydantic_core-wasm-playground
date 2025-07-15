#!/bin/bash

# add rust to path
. "$HOME/.cargo/env"

mkdir -p /component/output
rm -rf wasi-wheels
git clone https://github.com/benbrandt/wasi-wheels
cd wasi-wheels
export OPENSSL_INCLUDE_DIR=/usr/include/openssl
export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu/
rustup target add wasm32-wasip1
cargo run -- install-build-tools
cargo run -- build pydantic-core 2.33.2 --python-versions py3-12
# cargo run -- generate-index benbrandt/wasi-wheels

# wheel place:
# ./packages/pydantic_core-2.33.2/dist/pydantic_core-2.33.2-cp312-cp312-wasi_0_0_0_wasm32.whl

# install wheel
pip install --target /wasi_deps --platform any --platform wasi_0_0_0_wasm32 --python-version "3.12" --only-binary :all: `find . -name \*cp312-cp312-wasi_0_0_0_wasm32.whl`
