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
