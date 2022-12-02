#!/bin/bash

# ICKIE NUMERALS - a convoluted way of converting numbers to roman numerals
# Copyright (C) 2022  Simon Wendel
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

trap error_handler ERR
function error_handler() {
    echo 'Usage: ./ickie_numerals.sh <number>' >/dev/stderr
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
