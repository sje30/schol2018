innovations.docx: innovations.md
	pandoc -o innovations.docx innovations.md

innovations.pdf: innovations.md
	pandoc --filter pandoc-citeproc innovations.md --bibliography schol.bib -o innovations.pdf

