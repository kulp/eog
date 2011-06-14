LYS  = $(wildcard *.ly)
PDFS = $(LYS:.ly=.pdf)

.DEFAULT_GOAL = all

all: $(PDFS)

$(PDFS): %.pdf: %.ly
	lilypond --pdf --output=$* $<

clean:
	$(RM) $(PDFS) *.log
