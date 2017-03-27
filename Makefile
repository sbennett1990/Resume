# Makefile for different types of resumes

ST =	./style

all: txt html docx pdf

html: resume.html
resume.html: $(ST)/style.css resume.md
	lowdown -s -o $@ resume.md
	sed -i -f html.sed $@

pdf: resume.pdf
resume.pdf: html
	sed -f pdf.sed resume.html | wkhtmltopdf \
        --no-pdf-compression \
        --margin-top 15 --margin-bottom 0 \
        --margin-left 15 --margin-right 15 \
        - $@

docx: resume.docx
resume.docx: resume.md
	pandoc -s -S resume.md -o $@

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -S resume.md -o $@

txt: resume.txt
resume.txt: resume.md
	pandoc -f markdown -t plain resume.md \
        -o $@

site: html docx pdf
	cp style/style.css ./docs/style/style.css
	mv resume.html ./docs/index.html
	mv resume.pdf  ./docs
	mv resume.docx ./docs

clean:
	rm -f resume.html
	rm -f resume.docx
	rm -f resume.txt
	rm -f resume.rtf
	rm -f resume.tex
	rm -f resume.tuc
	rm -f resume.log
