# Makefile for different types of resumes

ST =	./style

all: txt html docx pdf

html: resume.html
resume.html: $(ST)/style.css resume.md
	lowdown -s -o $@ resume.md
	sed -i.orig '/<title>/c <title>Scott Bennett</title>' $@
	sed -i.orig '/<title>/a \\\<link rel="stylesheet" \
type="text/css" href="style/style.css"\>' $@

pdf: resume.pdf
resume.pdf: $(ST)/style.tex resume.md
	pandoc -s --template $(ST)/style.tex \
	-f markdown -t context \
	-V papersize=A4 \
	resume.md -o resume.tex; \
	context resume.tex

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

site: html docx #pdf
	mv resume.html ./docs/index.html
#mv resume.pdf  ./docs
	mv resume.docx ./docs

clean:
	rm -f resume.html
	rm -f resume.docx
	rm -f resume.txt
	rm -f resume.rtf
	rm -f resume.tex
	rm -f resume.tuc
	rm -f resume.log
