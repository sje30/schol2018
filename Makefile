innovations.pdf: innovations.tex
	latexmk innovations

innovations.tex: innovations.md schol.bib pandoc-header.tex 
	pandoc --filter pandoc-citeproc innovations.md --csl=cell-numeric.csl --include-in-header=pandoc-header.tex -V colorlinks --bibliography schol.bib -o innovations.tex

innovations.docx: innovations.md
	pandoc --filter pandoc-citeproc innovations.md --csl=cell-numeric.csl --include-in-header=pandoc-header.tex --bibliography schol.bib -o innovations.docx



.PHONY: outputs clean

outputs: innovations.docx innovations.pdf
	git commit innovations.docx innovations.pdf -m "rebuild outputs"


clean:
	rm innovations.docx innovations.pdf

oldinnovations.pdf: innovations.md schol.bib pandoc-header.tex 
	pandoc --filter pandoc-citeproc innovations.md --csl=cell-numeric.csl --include-in-header=pandoc-header.tex --bibliography schol.bib -o innovations.pdf

