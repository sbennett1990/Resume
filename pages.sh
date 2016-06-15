#!/bin/sh

#
# Prepare workspace for GitHub pages commit
#

resume="resume.html"
index="index.html"

if [ -f "$resume" ]; then
    rm $resume
fi

`/usr/bin/make -s html` || (echo "make failed $?"; exit 1)

git checkout gh-pages

mv ./$resume ./$index

git status
git diff --ignore-space-at-eol
