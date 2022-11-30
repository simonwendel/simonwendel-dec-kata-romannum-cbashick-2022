load 'fixture_setup.bash'

ick2roman() {
    echo "$1" | $BIN_DIR/ick2roman | xargs
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
