innovations.docx: innovations.md
	pandoc --filter pandoc-citeproc innovations.md --csl=cell-numeric.csl --include-in-header=pandoc-header.tex --bibliography schol.bib -o innovations.docx

innovations.pdf: innovations.md schol.bib pandoc-header.tex 
	pandoc --filter pandoc-citeproc innovations.md --csl=cell-numeric.csl --include-in-header=pandoc-header.tex --bibliography schol.bib -o innovations.pdf


.PHONY: outputs clean

outputs: innovations.docx innovations.pdf
	git commit innovations.docx innovations.pdf -m "rebuild outputs"
	git push


clean:
	rm innovations.docx innovations.pdf
