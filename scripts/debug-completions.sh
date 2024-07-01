#! /usr/bin/env bash
set -eu

# Ensure we're in the repo root
cd "$( cd "$( dirname "$(realpath -m "${BASH_SOURCE[0]}")" )" && pwd )/..";

if test -f /usr/share/bash-completion/completions/docker; then
    # shellcheck disable=SC2154
    trap 'code=$?; sudo sed -i "s@> /tmp/docker-cli-completions.log@ /dev/null@" /usr/share/bash-completion/completions/docker; exit $code' EXIT;
    echo -n "" > /tmp/docker-cli-completions.log;
    sudo sed -ri 's@"\$\{resultArray\[\*\]\}" 2> /dev/null@"${resultArray[*]}" | tee -a /tmp/docker-cli-completions.log 2>> /tmp/docker-cli-completions.log@' /usr/share/bash-completion/completions/docker;
    echo "Open a new terminal to test the \`docker devcontainer\` CLI plugin";
    echo "Output:";
    tail -f /tmp/docker-cli-completions.log;
fi
