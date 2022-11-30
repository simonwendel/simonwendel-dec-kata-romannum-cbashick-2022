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

load 'fixture_setup.bash'

@test "ickie_numerals wraps errors." {
    failing() {
        run $ROOT_DIR/ickie_numerals.sh "$1"
        assert_failure
        assert_output 'Usage: ./ickie_numerals <number>'
    }

    failing
    failing 'a'
    failing '1a'
    failing '1 2'
}

@test "ickie_numerals should convert number to roman numerals." {
    assert() {
        run $ROOT_DIR/ickie_numerals.sh "$1"
        assert_success
        assert_output "$2"
    }

    assert    1 'I'
    assert    2 'II'
    assert    3 'III'
    assert    4 'IV'
    assert    5 'V'
    assert    9 'IX'
    assert   21 'XXI'
    assert   42 'XLII'
    assert   50 'L'
    assert  100 'C'
    assert  500 'D'
    assert  666 'DCLXVI'
    assert 1000 'M'
}
