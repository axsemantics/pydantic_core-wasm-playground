#!/bin/bash

componentize-py -d main.wit -w string-actor-sync bindings some-world

cd /app
componentize-py -w string-actor-sync -d /component/main.wit componentize --stub-wasi main -o /component/output.wasm -p .
# same with:  -p /wasi_deps
