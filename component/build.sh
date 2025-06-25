#!/bin/bash

componentize-py -d main.wit -w hello bindings some-world

cd /app
componentize-py -w hello -d /component/main.wit componentize --stub-wasi main -o /component/output.wasm -p . -p /wasi_deps
