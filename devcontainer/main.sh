#! /usr/bin/env bash

# shellcheck disable=SC2317

_docker_devcontainer() {
    local -;
    set -euo pipefail;

    if [[ "$1" == "docker-cli-plugin-metadata" ]]; then
        cat <<________EOF
{
     "SchemaVersion": "0.1.0",
     "Vendor": "Paul Taylor",
     "Version": "v1.0.0",
     "ShortDescription": "Development Containers CLI (https://containers.dev)"
}
________EOF
        return 0
    fi

    local COMMANDS=(devcontainer);

    # Source all the subcommands
    source ./comp.sh;
    source ./help.sh;
    source build/comp.sh;
    source build/help.sh;
    source build/main.sh;

    _devcontainer_main() {
        _devcontainer_help;
    }

    local _COMP=;
    if [[ "$1" == "__completeNoDesc" ]]; then
        _COMP=1;
        shift;
    fi

    local _HELP=;
    if [[ " $* " == *" -h "* ]] || [[ " $* " == *" --help "* ]]; then
        _HELP=1;
    fi

    local -r PATTERN="@($(
        tr -d '[:space:]' <<< "${COMMANDS[*]/%/ |}" \
    | rev | cut -d'|' -f1 --complement | rev
    ))";

    shopt -s extglob;

    local COMMAND=devcontainer;

    # shellcheck disable=SC2254
    case "${1:-devcontainer}" in
        $PATTERN)
            COMMAND="${1:-devcontainer}";
            shift;;
    esac

    shopt -u extglob;

    if test -n "${_COMP:-}"; then
        COMMAND+="_comp";
    elif test -n "${_HELP:-}"; then
        COMMAND+="_help";
    else
        COMMAND+="_main";
    fi

    # set -ex
    # echo "$@" >&2

    eval "_$COMMAND $*";
}

_docker_devcontainer "$@";
