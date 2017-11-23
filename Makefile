SHELL=/bin/sh

all: website publication.html docs/cv/cv.pdf

website:
	git clone https://github.com/hhexiy/website

publication.html: website/pub_data.py website/generate_pubs.py
	set -e;\
	cd website;\
	python generate_pubs.py > publication.html;\
	cp publication.html ..;

docs/cv/cv.pdf: docs/cv/cv.tex
	set -e;\
	cd docs/cv;\
	pdflatex cv.tex;
