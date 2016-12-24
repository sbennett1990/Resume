#!/bin/sh

#
# Prepare the GitHub Pages
#

set -e

resume_html	= "resume.html"
index_html	= "index.html"
docx		= "resume.docx"
pdf		= "resume.pdf"

if [ -f "$resume_html" ]; then
    rm $resume_html
fi

if [ -f "$index_html" ]; then
    rm $index_html
fi

if [ -f "$docx" ]; then
    rm $docx
fi

if [ -f "$pdf" ]; then
    rm $pdf
fi

`/usr/bin/make -s` || (echo "make failed $?"; exit 1)

mv ./$resume_html ./$index_html
mv ./$index_html ./docs/$index_html
mv ./$docx ./docs/$docx
mv ./$pdf ./docs/$pdf

git status
#git diff --ignore-space-at-eol
