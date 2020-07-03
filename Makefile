# change this to the file name of the paper
PRJ = iot-naming

all : pdf
pdf : ${PRJ}.pdf

${PRJ}.pdf: ${PRJ}.tex *.tex fig/* *.bib
	pdflatex ${PRJ}; bibtex ${PRJ}; pdflatex ${PRJ}; pdflatex ${PRJ}

view : ${PRJ}.pdf clean
	open ${PRJ}.pdf &
# change this to include what should be in the tarball,  use --exclude for exclusion.
pack : clean
	cd ..; /bin/rm -f ${PRJ}.tgz; tar -hzcf ${PRJ}.tgz ${PRJ}

clean:
	/bin/rm -f *.toc *.aux *.bbl *.blg *.log *.dvi *~* *.bak *.rel *.log *.synctex.gz

distclean: clean
	/bin/rm -f *.toc *.aux *.bbl *.blg *.log ${PRJ}.dvi ${PRJ}.ps ${PRJ}.pdf *~* *.bak

.PHONY: clean distclean all
