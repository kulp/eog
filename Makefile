LYS   = $(wildcard *.ly)
PDFS  = $(LYS:.ly=.pdf)
MIDIS = $(LYS:.ly=.midi)

LYOPTS = -dno-point-and-click -ddelete-intermediate-files

vpath .midi MIDI
vpath .pdf PDF

.SUFFIXES:
.SUFFIXES: .ly .ily .pdf .midi

.DEFAULT_GOAL = all

.PHONY: all pdf midi
all: pdf midi
pdf: $(PDFS)
midi: $(MIDIS)

%.pdf %.midi: %.ly
	lilypond $(LYOPTS) --pdf --output=$* $<
	-mv $*.pdf PDF/
	-mv $*.midi MIDI/

clean:
	$(RM) *.log

clobber: clean
	$(RM) PDF/*.pdf MIDI/*.midi

