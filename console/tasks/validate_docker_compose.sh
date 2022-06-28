#!/usr/bin/env bash
set -euo pipefail

# shellcheck source=/dev/null
source "$COMPONENTS_DIR"/print_message.sh

CONFIG_IS_VALID=$($DOCKER_COMPOSE config -q && echo true || echo false)

if [[ $CONFIG_IS_VALID == false ]]; then
    if [[ $MACHINE == "mac" ]]; then
        print_error "\nDocker is not properly configured or docker is not runnig. Please execute:\n"
    else
        print_error "\nDocker is not properly configured. Please execute:\n\n\n"
    fi
    print_default "  $COMMAND_BIN_NAME setup\n"
    exit 1
fi
