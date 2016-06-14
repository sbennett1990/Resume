#!/bin/sh

resume="resume.html"
index="index.html"
git="/cygdrive/c/Program\ Files/Git/mingw64/bin/git"

if [ -f "$resume" ]; then
    rm $resume
fi

`/usr/bin/make -s html` || (echo "make failed $?"; exit 1)

$git checkout gh-pages

cp ./$resume ./$index

