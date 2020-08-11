# Makefile for generating different formats of my resume

DOCS=	docs
HTML=	${DOCS}/index.html
STYLE=	${DOCS}/style.css

#all: html pdf docx txt

html: index.html
index.html: ${HTML}
	sed -i -f html.sed ${DOCS}/$@

pdf: resume.pdf
resume.pdf: ${HTML}
	cat ${HTML} | wkhtmltopdf \
        --no-pdf-compression \
        --user-style-sheet ${DOCS}/pdf.css \
        --disable-external-links \
        --margin-top 5 \
        --margin-bottom 5 \
        --margin-left 15 \
        --margin-right 15 \
        - ${DOCS}/$@

site: html docx
	cp $(ST)/style.css ./docs/style/style.css
	mv resume.html ./docs/index.html
#	mv resume.pdf  ./docs
	mv resume.docx ./docs
