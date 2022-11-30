#!/bin/bash

trap error_handler ERR
function error_handler() {
    echo 'Usage: ./ickie_numerals <number>' >/dev/stderr
    exit -1
}

ROOT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
BIN_DIR=$ROOT_DIR/bin
N2I=$BIN_DIR/num2ick
I2R=$BIN_DIR/ick2roman

if [ ! -f "$N2I" ] || [ ! -f "$I2R" ]; then
    $ROOT_DIR/build.sh
fi

OUT=$($N2I "$1")
OUT=$(echo $OUT | $I2R 2>/dev/null)
echo $OUT | xargs
