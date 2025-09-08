LATEXMK      = latexmk
LATEXMKFLAGS = -f -pdf -g
LATEXMKCLEAN = -C

SOURCES      = main.tex
EXECS        = $(SOURCES:.tex=.pdf)
BASE         = $(SOURCES:.tex=)

TEXSRC       = $(filter-out $(SOURCES), $(wildcard *.tex))
BIBSRC       = $(wildcard *.bib)
DEPS         = $(TEXSRC) $(BIBSRC)

# Rule to build the PDF
all: $(EXECS)

$(EXECS): %.pdf : %.tex $(DEPS)
	$(LATEXMK) $(LATEXMKFLAGS) $<

clean:
	-$(LATEXMK) $(LATEXMKCLEAN) 
	-rm -f *~ main.bbl

# New command for renaming and moving the file
complete: all
	@timestamp=$$(date '+%Y-%m-%d_%H-%M-%S'); \
	mkdir -p "$$timestamp"; \
	mv main.pdf "$$timestamp/drewgraham_resume.pdf"; \
	echo "Moved drewgraham_resume.pdf to folder $$timestamp"

.PHONY: all clean complete