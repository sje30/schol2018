innovations.docx: innovations.md
	pandoc -o innovations.docx innovations.md

innovations.pdf: innovations.md schol.bib pandoc-header.tex
	pandoc --filter pandoc-citeproc innovations.md --include-in-header=pandoc-header.tex --bibliography schol.bib -o innovations.pdf


.PHONY: outputs
outputs: innovations.docx innovations.pdf
	git commit innovations.docx innovations.pdf -m "rebuild outputs"
	git push

