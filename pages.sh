#!/bin/sh

#
# Prepare workspace for GitHub pages commit
#

resume="resume.html"
index="index.html"
docx="resume.docx"
tempdocx="temp.docx"

if [ -f "$resume" ]; then
    rm $resume
fi

if [ -f "$tempdocx" ]; then
    rm $docx
    rm $tempdocx
fi

`/usr/bin/make -s` || (echo "make failed $?"; exit 1)

mv ./$docx ./$tempdocx

git checkout gh-pages

mv ./$resume ./$index
mv ./$tempdocx ./$docx

git status
git diff --ignore-space-at-eol
