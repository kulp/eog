LYS   = $(wildcard EOG???.ly)
PDFS  = $(addprefix PDF/,$(LYS:.ly=.pdf))
MIDIS = $(addprefix MIDI/,$(LYS:.ly=.midi))

ifneq ($(DEBUG),1)
LYOPTS += -dno-point-and-click -ddelete-intermediate-files
endif

vpath .midi MIDI
vpath .pdf PDF

.SUFFIXES:
.SUFFIXES: .ly .ily .pdf .midi

.DEFAULT_GOAL = all

.PHONY: all pdf midi
all: pdf midi
pdf: $(PDFS)
midi: $(MIDIS)

PDF/%.pdf MIDI/%.midi: %.ly
	lilypond $(LYOPTS) --pdf --output=$* $<
	-mv $*.pdf PDF/
	-mv $*.midi MIDI/

clean:
	$(RM) *.log

clobber: clean
	$(RM) PDF/*.pdf MIDI/*.midi

