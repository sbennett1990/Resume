# Makefile for different types of resumes

ST = ./style

all: html pdf docx rtf

html: resume.html
resume.html: $(ST)/style.css resume.md
	pandoc -s -H $(ST)/style.css \
        -f markdown -t html \
        resume.md -o resume.html

pdf: resume.pdf
resume.pdf: resume.md
	pandoc -s --template $(ST)/style.tex \
	-f markdown -t context \
	-V papersize=A4 \
	resume.md -o resume.tex; \
	context resume.tex

docx: resume.docx
resume.docx: resume.md
	pandoc -s -S resume.md -o resume.docx

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -S resume.md -o resume.rtf

clean:
	rm resume.html
	rm resume.tex
	rm resume.tuc
	rm resume.log
	rm resume.pdf
	rm resume.docx
	rm resume.rtf
