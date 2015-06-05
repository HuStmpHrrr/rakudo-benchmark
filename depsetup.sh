#!/bin/bash

if ! hash git; then
    echo 'git is required to be installed!' >&2
    exit 1
fi

if ! hash perl6; then
    echo 'perl6 is required to be installed!' >&2
    exit 1
fi

if ! hash panda; then
    echo 'installing panda...'
    git clone --recursive git://github.com/tadzik/panda.git
    cd panda
    perl6 bootstrap.pl
fi

panda install Bench
