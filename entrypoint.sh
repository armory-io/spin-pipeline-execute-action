#!/bin/bash -ex

if [ -z "$INPUT_APPLICATION" ]; then
    echo "application name must be supplied to use this action."
    exit 1
fi

if [ -z "$INPUT_PIPELINE" ]; then
    echo "pipeline name must be supplied to use this action."
    exit 1
fi

if [ -z "$INPUT_CONFIGDATA" ]; then
    echo "spin cli configuration must be supplied to use this action."
    exit 1
fi

additional_args=""

if [ ! -z "$INPUT_PARAMETERFILE" ]; then
    additional_args="$additional_args --parameter-file $INPUT_PARAMETERFILE"
fi

# write configuration to default location
echo "$INPUT_CONFIGDATA" > ${HOME}/.spinconfig
spin pipeline execute \
    --application "$INPUT_APPLICATION" \
    --name "$INPUT_PIPELINE" \
    --config ${HOME}/.spinconfig
    $additional_args