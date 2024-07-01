#! /usr/bin/env bash
set -eu

# Ensure we're in the repo root
cd "$( cd "$( dirname "$(realpath -m "${BASH_SOURCE[0]}")" )" && pwd )/..";

docker run --rm -it -e "_UID=$(id -u)" -e "_GID=$(id -g)" -v "$PWD:/plugin" -w /plugin golang sh -c "
    go install github.com/malscent/bash_bundler@latest;
    apt update && apt install -y --no-install-recommends entr;
    while true; do clear && find devcontainer -type f | entr -dr scripts/bundle.sh; done;
"
