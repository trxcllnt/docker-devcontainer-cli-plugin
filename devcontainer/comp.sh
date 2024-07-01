#! /usr/bin/env bash

_devcontainer_comp() {
    local -;
    set -euo pipefail;
    echo "${COMMANDS[*]:1}";
    echo "-h --help";
}
