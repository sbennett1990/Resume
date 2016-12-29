#!/bin/sh
#
# Prepare the GitHub Pages
#

set -e

resume_html	= "resume.html"
index_html	= "index.html"
docx		= "resume.docx"
pdf		= "resume.pdf"

`/usr/bin/make -s` || (echo "make failed $?"; exit 1)

mv ./$resume_html ./docs/$index_html
mv ./$docx ./docs/$docx
mv ./$pdf ./docs/$pdf

git status
#git diff --ignore-space-at-eol
