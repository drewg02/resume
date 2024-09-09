LATEXMK      = latexmk
LATEXMKFLAGS = -f -pdf -g
LATEXMKCLEAN = -C

SOURCES      = main.tex
EXECS        = $(SOURCES:.tex=.pdf)
BASE         = $(SOURCES:.tex=)

TEXSRC       = $(filter-out $(SOURCES), $(shell ls *.tex))

BIBSRC       = $(shell ls *.bib)
BBL          = $(notdir $(BIBSRC:.bib=.bbl))

DEPS         = $(DEP) $(TEXSRC) $(BIBSRC)

# Rule to build the PDF
all: $(EXECS)

$(EXECS): %.pdf : %.tex $(DEPS)
	$(LATEXMK) $(LATEXMKFLAGS) $<
	$(LATEXMK) $(LATEXMKFLAGS) $<

$(BBL): $(BIBSRC)
	biber $(BASE)

view:	all
	$(LATEXMK) -pvc -view=ps -r latexmkrc paper

clean:
	-$(LATEXMK) $(LATEXMKCLEAN) 
	-rm -f *~ main.bbl

# New command for renaming and moving the file
complete: all
	@mkdir -p "$(shell date '+%Y-%m-%d_%H-%M-%S')"  # Create folder with current date and time
	@mv main.pdf "$(shell date '+%Y-%m-%d_%H-%M-%S')/drewgraham_resume.pdf"  # Move and rename
	@echo "Moved drewgraham_resume.pdf to folder with current date/time."
