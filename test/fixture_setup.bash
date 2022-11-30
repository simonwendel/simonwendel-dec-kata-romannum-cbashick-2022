ROOT_DIR=$BATS_TEST_DIRNAME/..
BIN_DIR=$ROOT_DIR/bin
SRC_DIR=$ROOT_DIR/src

function setup() {
    load '../node_modules/bats-support/load'
    load '../node_modules/bats-assert/load'

    mkdir -p $BIN_DIR
    gcc -o $BIN_DIR/num2ick $SRC_DIR/num2ick.c
    ick -b $SRC_DIR/ick2roman.i && mv $SRC_DIR/ick2roman $BIN_DIR
}
