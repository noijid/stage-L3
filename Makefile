all: 
	pdflatex rapport.tex
	bibtex rapport
	pdflatex rapport.tex
	pdflatex rapport.tex
	rm rapport.bbl
	rm rapport.log
	rm rapport.aux
	rm rapport.blg