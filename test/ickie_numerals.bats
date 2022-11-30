load 'fixture_setup.bash'

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
