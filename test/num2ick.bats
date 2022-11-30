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

num2ick() {
    $BIN_DIR/num2ick $1
}

@test 'num2ick should exit with error given no number' {
    run num2ick
    assert_failure 1
}

@test 'num2ick should exit with error given something that is not a number' {
    run num2ick 2a
    assert_failure 2
}

@test 'num2ick should spell out words given a number' {
    run num2ick 9876543210
    assert_success
    assert_output 'NINER EIGHT SEVEN SIX FIVE FOUR THREE TWO ONE OH'
}
