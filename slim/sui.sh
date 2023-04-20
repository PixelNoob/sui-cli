#!/bin/bash

if [ "$1" = "sui-cli" ]; then
    export SUI_BINARY=/usr/local/bin/sui
    shift
    exec "$SUI_BINARY" "$@"
elif [ "$1" = "sui-tool" ]; then
    export SUI_TOOL_BINARY=/usr/local/bin/sui-tool
    shift
    exec "$SUI_TOOL_BINARY" "$@"
else
    echo "Unknown command: $1"
    exit 1
fi
