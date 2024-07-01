#! /usr/bin/env bash
set -eu

# Ensure we're in the repo root
cd "$( cd "$( dirname "$(realpath -m "${BASH_SOURCE[0]}")" )" && pwd )/..";

bash_bundler bundle -e devcontainer/main.sh -o docker-devcontainer;
chown "${_UID:-$(id -u)}:${_GID:-$(id -g)}" /plugin/docker-devcontainer;
chmod 0755 /plugin/docker-devcontainer;
