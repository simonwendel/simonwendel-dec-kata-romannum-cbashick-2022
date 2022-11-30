#!/usr/bin/env bats

function setup() {
    load './node_modules/bats-support/load'
    load './node_modules/bats-assert/load'

    mkdir -p bin
    gcc -o bin/intercalify intercalify.c
    ick -b to_roman.i && mv to_roman bin/
}

intercalify() {
    ./bin/intercalify $1
}

to_roman() {
    echo "$1" | ./bin/to_roman | xargs
}

@test 'intercalify should exit with error given no number' {
    run intercalify
    assert_failure 1
}

@test 'intercalify should exit with error given something that is not a number' {
    run intercalify 2a
    assert_failure 2
}

@test 'intercalify should spell out words given a number' {
    run intercalify 9876543210
    assert_success
    assert_output 'NINER EIGHT SEVEN SIX FIVE FOUR THREE TWO ONE OH'
}

@test "to_roman should convert spelled out number to roman numerals" {
    test() {
        run to_roman "$1"
        assert_success
        assert_output "$2"
    }

    test 'ONE TWO' 'XII'
    test 'FOUR TWO' 'XLII'
    test 'SIX SIX SIX' 'DCLXVI'
}