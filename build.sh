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

ROOT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
BIN_DIR=$ROOT_DIR/bin
SRC_DIR=$ROOT_DIR/src

mkdir -p $BIN_DIR
gcc -o $BIN_DIR/num2ick $SRC_DIR/num2ick.c
ick -b $SRC_DIR/ick2roman.i && mv $SRC_DIR/ick2roman $BIN_DIR
