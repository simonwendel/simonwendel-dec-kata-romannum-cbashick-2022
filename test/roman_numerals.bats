#!/usr/bin/env bats

BIN_DIR=$BATS_TEST_DIRNAME/../bin
SRC_DIR=$BATS_TEST_DIRNAME/../src

function setup() {
    load '../node_modules/bats-support/load'
    load '../node_modules/bats-assert/load'

    mkdir -p $BIN_DIR
    gcc -o $BIN_DIR/num2ick $SRC_DIR/num2ick.c
    ick -b $SRC_DIR/ick2roman.i && mv $SRC_DIR/ick2roman $BIN_DIR
}

num2ick() {
    $BIN_DIR/num2ick $1
}

ick2roman() {
    echo "$1" | $BIN_DIR/ick2roman | xargs
}

roman_numerals() {
    $BIN_DIR/num2ick "$1" | $BIN_DIR/ick2roman | xargs
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

@test "ick2roman should convert spelled out number to roman numerals" {
    test() {
        run ick2roman "$1"
        assert_success
        assert_output "$2"
    }

    test 'ONE TWO' 'XII'
    test 'FOUR TWO' 'XLII'
    test 'SIX SIX SIX' 'DCLXVI'
}

@test "roman_numerals should convert number to roman numerals." {
    test() {
        run roman_numerals "$1"
        assert_success
        assert_output "$2"
    }

    test    1 'I'
    test    2 'II'
    test    3 'III'
    test    4 'IV'
    test    5 'V'
    test    9 'IX'
    test   21 'XXI'
    test   42 'XLII'
    test   50 'L'
    test  100 'C'
    test  500 'D'
    test  666 'DCLXVI'
    test 1000 'M'
}
