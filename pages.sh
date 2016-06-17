#!/bin/sh

#
# Prepare workspace for GitHub pages commit
#

resume="resume.html"
index="index.html"
docx="resume.docx"
tempdocx="temp.docx"
pdf="resume.pdf"
temppdf="temp.pdf"

if [ -f "$resume" ]; then
    rm $resume
fi

if [ -f "$tempdocx" ]; then
    rm $docx
    rm $tempdocx
fi

if [ -f "$temppdf" ]; then
    rm $pdf
    rm $temppdf
fi

`/usr/bin/make -s` || (echo "make failed $?"; exit 1)

mv ./$docx ./$tempdocx
mv ./$pdf ./$temppdf

git checkout gh-pages

mv ./$resume ./$index
mv ./$tempdocx ./$docx
mv ./$temppdf ./$pdf

git status
git diff --ignore-space-at-eol
