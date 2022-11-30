load 'setup.bash'

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
