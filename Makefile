# Makefile for LaTeX Workshop
# -----------------------------------------------------------------------------

# Build flags
R_OPTS = --slave --vanilla

# Main files
SLIDES = index
CSS = custom.css

# Directories
SUBDIR = input

# Source files
RMD_INPUT := $(wildcard $(SUBDIR)/*.Rmd)
IMGS := $(wildcard img/*)

# Rules -----------------------------------------------------------------------

# Slides
slides: $(SLIDES).html

$(SLIDES).html: $(SLIDES).Rmd $(RMD_INPUT) $(CSS) $(IMGS)
	Rscript $(R_OPTS) -e "rmarkdown::render('$<', 'xaringan::moon_reader')"
