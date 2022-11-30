#!/usr/bin/env bats

function setup() {
    load './node_modules/bats-support/load'
    load './node_modules/bats-assert/load'

    mkdir -p bin
    gcc -o bin/intercalify intercalify.c
}

intercalify() {
    ./bin/intercalify $1
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
