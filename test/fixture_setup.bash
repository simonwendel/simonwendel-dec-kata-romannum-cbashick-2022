ROOT_DIR=$BATS_TEST_DIRNAME/..
BIN_DIR=$ROOT_DIR/bin
SRC_DIR=$ROOT_DIR/src

function setup() {
    load '../node_modules/bats-support/load'
    load '../node_modules/bats-assert/load'
    $ROOT_DIR/build.sh
}
