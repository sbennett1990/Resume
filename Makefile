# Makefile for generating different formats of my resume

DOCS=	docs
HTML=	${DOCS}/index.html
STYLE=	${DOCS}/style.css

#all: html pdf docx txt

html: resume.html
resume.html: $(ST)/style.css resume.md
	lowdown -s -o $@ resume.md
	sed -i -f html.sed $@

pdf: resume.pdf
resume.pdf: html
	sed -f pdf.sed resume.html | wkhtmltopdf \
        --no-pdf-compression \
        --margin-top 15 \
        --margin-bottom 0 \
        --margin-left 15 \
        --margin-right 15 \
        - ${DOCS}/$@

site: html docx
	cp $(ST)/style.css ./docs/style/style.css
	mv resume.html ./docs/index.html
#	mv resume.pdf  ./docs
	mv resume.docx ./docs
