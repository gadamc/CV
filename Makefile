# VERY simple makefile to build CV.  It could be more elegant and check more
# dependencies, but it works.
# M. Marino
# edited by G. Adam Cox
#
LATEX := xelatex
BIBTEX := bibtex
ROOTNAME := cv_gac
AUX_FILE := $(addsuffix .aux, $(ROOTNAME))
TEX_FILE := $(addsuffix .tex, $(ROOTNAME))
BBL_FILE := $(addsuffix .bbl, $(ROOTNAME))
BIB_FILE := $(addsuffix .bib, $(ROOTNAME))
PDF_FILE := $(addsuffix .pdf, $(ROOTNAME))

MAKELATEX = $(LATEX) $(basename $<)

.SECONDARY : $(AUX_FILE) $(BBL_FILE)
all : $(PDF_FILE)

%.pdf : %.tex %.bbl
	$(MAKELATEX)

%.bbl : %.bib 
	$(MAKELATEX) -no-pdf
	$(BIBTEX) $(basename $(<)) 

clean ::
	rm -f $(AUX_FILE) $(BBL_FILE) $(PDF_FILE) *.blg *.log *.out
