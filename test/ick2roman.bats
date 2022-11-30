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

ick2roman() {
    echo "$1" | $BIN_DIR/ick2roman | xargs
}

@test "ick2roman should convert spelled out number to roman numerals" {
    assert() {
        run ick2roman "$1"
        assert_success
        assert_output "$2"
    }

    assert 'ONE TWO' 'XII'
    assert 'FOUR TWO' 'XLII'
    assert 'SIX SIX SIX' 'DCLXVI'
}
