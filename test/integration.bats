load 'setup.bash'

integration() {
    $BIN_DIR/num2ick "$1" | $BIN_DIR/ick2roman | xargs
}

@test "integration should convert number to roman numerals." {
    test() {
        run integration "$1"
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
