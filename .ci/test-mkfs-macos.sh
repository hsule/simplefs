#!/usr/bin/env bash

set -e

IMAGE=test.img
IMAGESIZE=50
MKFS=mkfs.simplefs

function build_mkfs()
{
    make $MKFS
}

function run_tests()
{
    dd if=/dev/zero of=$IMAGE bs=1M count=$IMAGESIZE status=none
    ./$MKFS $IMAGE
}

build_mkfs
run_tests
