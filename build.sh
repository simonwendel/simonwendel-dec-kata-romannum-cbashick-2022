#!/bin/bash
ROOT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
BIN_DIR=$ROOT_DIR/bin
SRC_DIR=$ROOT_DIR/src

mkdir -p $BIN_DIR
gcc -o $BIN_DIR/num2ick $SRC_DIR/num2ick.c
ick -b $SRC_DIR/ick2roman.i && mv $SRC_DIR/ick2roman $BIN_DIR
