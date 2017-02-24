# Makefile for different types of resumes

ST = ./style

all: txt html docx pdf

html: resume.html
resume.html: $(ST)/style.css resume.md
	lowdown -s -o resume.html resume.md

pdf: resume.pdf
resume.pdf: $(ST)/style.tex resume.md
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

txt: resume.txt
resume.txt: resume.md
	pandoc -f markdown -t plain resume.md \
        -o resume.txt

clean:
	rm resume.html
	rm resume.docx
	rm resume.txt
	rm resume.rtf
	rm resume.tex
	rm resume.tuc
	rm resume.log

