all: 
	pdflatex rapport.tex
	pdflatex presentation.tex
	bibtex rapport
	pdflatex rapport.tex
	pdflatex rapport.tex
	rm rapport.bbl
	rm rapport.log
	rm rapport.aux
	rm rapport.blg
	rm presentation.out
	rm presentation.log
	rm presentation.aux
	rm presentation.snm
	rm presentation.toc
	rm rapport.toc
	rm presentation.nav