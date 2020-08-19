# Makefile for generating different formats of my resume

DOCS=	docs
HTML=	${DOCS}/index.html
STYLE=	${DOCS}/style.css

#all: html pdf docx txt

html: index.html
index.html: ${HTML}
	sed -i -f html.sed ${DOCS}/$@

pdf: ScottBennett_Resume.pdf
ScottBennett_Resume.pdf: ${HTML}
	sed -f pdf.sed ${HTML} | wkhtmltopdf \
        --no-pdf-compression \
        --user-style-sheet ${DOCS}/pdf.css \
        --disable-external-links \
        --disable-javascript \
        --margin-bottom 2 \
        --margin-left 15 \
        --margin-right 15 \
        - ${DOCS}/$@

site: html docx
	cp $(ST)/style.css ./docs/style/style.css
	mv resume.html ./docs/index.html
#	mv resume.pdf  ./docs
	mv resume.docx ./docs
