#!/bin/bash
set -e

if [ -z "$1" ]; then
    local config_dir=/config
    local data_dir=/data
    if [ ! -d "$config_dir" ]; then
        mkdir "$config_dir"
    fi
    if [ ! -d "$data_dir" ]; then
        mkdir "$data_dir"
    fi
    # permissions...
    #exec ...
else
    exec "$@"
fi
