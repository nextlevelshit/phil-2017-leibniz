all: dir pdf

# Build a number of formats into the `out/` directory. These will get published via Github pages.
dir:
	mkdir -p out

pdf:
	pandoc metadata.yaml --bibliography library.bib --template=template.tex --smart --filter pandoc-citeproc --variable documentclass=templates/sig-alternate --csl=templates/deutsche-sprache.csl --highlight-style=haddock -f markdown -t latex -o out/paper.pdf paper.md
html:
	pandoc --smart --filter pandoc-citeproc --standalone --css=pandoc.css --toc --highlight-style=haddock -f markdown -t html -o out/index.html paper.md
	cp templates/pandoc.css out/pandoc.css
