#!/bin/bash
ROOT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
BIN_DIR=$ROOT_DIR/bin
N2I=$BIN_DIR/num2ick
I2R=$BIN_DIR/ick2roman

if [ ! -f "$N2I" ] || [ ! -f "$I2R" ]; then
    $ROOT_DIR/build.sh
fi

$N2I "$1" | $I2R | xargs
