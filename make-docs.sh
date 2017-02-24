#!/bin/sh
#
# Generate the GitHub Pages

set -e

function fix_html () {
	local _html=$1

	sed -i.orig '/<title>/c <title>Scott Bennett</title>' ${_html}
	sed -i.orig '/<title>/a \<link rel="stylesheet" type="text/css" href="style/style.css">' ${_html}
}

resume_html="resume.html"
index_html="index.html"
css="style.css"
docx="resume.docx"
pdf="resume.pdf"

(make html -s) || (echo "make failed $?"; exit 1)

# edit the resultant html because lowdown can't do everything
fix_html $resume_html

# put files in the right folder
cp ./style/$css ./docs/style
mv ./$resume_html ./docs/$index_html
mv ./$pdf ./docs/$pdf
mv ./$docx ./docs/$docx

#git status
#git diff --ignore-space-at-eol
