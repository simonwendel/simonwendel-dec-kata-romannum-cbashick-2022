#!/bin/bash
BIN_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)/bin
$BIN_DIR/num2ick "$1" | $BIN_DIR/ick2roman | xargs