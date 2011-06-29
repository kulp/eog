VARIANTS = eogsized letter
LYS      = $(wildcard EOG???.ly)
PDFS     = $(foreach v,$(VARIANTS),$(addprefix PDF/$v/, $(LYS:.ly=.pdf )))
MIDIS    = $(foreach v,$(VARIANTS),$(addprefix MIDI/$v/,$(LYS:.ly=.midi)))

ifneq ($(DEBUG),1)
LYOPTS += -dno-point-and-click -ddelete-intermediate-files
endif

vpath .midi MIDI
vpath .pdf PDF

.SUFFIXES:
.SUFFIXES: .ly .ily .pdf .midi

.DEFAULT_GOAL = all

.PHONY: all pdf midi index
all: pdf midi index
pdf: $(PDFS)
midi: $(MIDIS)

push:
	git push kulp.ch :
	ssh kulp.ch "cd kulp.ch/eog && git checkout master && git reset --hard master && make clobber && make -j4"

index: index.html
CLEANFILES += index.html
index.html: $(PDFS) $(MIDIS)
	@echo '<body><ul>' > $@
	@$(foreach v,$(VARIANTS), \
	echo '<li>Variant "$v":<ul>' >> $@; \
	echo '<li>PDFs:<ul>' >> $@; \
	echo $(foreach r,$(wildcard PDF/$v/*.pdf),'<li><a href="$r">$(notdir $r)</a></li>') >> $@; \
	echo '</ul>' >> $@; \
	echo '<li>MIDIs:<ul>' >> $@; \
	echo $(foreach r,$(wildcard MIDI/$v/*.midi),'<li><a href="$r">$(notdir $r)</a></li>') >> $@; \
	echo '</ul>' >> $@; \
	echo '</ul>' >> $@; \
	)

clean:
	$(RM) *.log $(CLEANFILES)

clobber: clean
	$(RM) -r $(CLOBBERFILES)

.SECONDEXPANSION:
CLOBBERFILES += PDF/ MIDI/
PDF/%.pdf MIDI/%.midi: $$(notdir $$*).ly
	mkdir -p PDF/$(dir $*) MIDI/$(dir $*)
	lilypond $(LYOPTS) --include=$(PWD)/variants/$(dir $*) --pdf --output=$(dir $@)$(notdir $*) $<
	-mv $(dir $@)$(notdir $*).pdf  PDF/$(dir $*)
	-mv $(dir $@)$(notdir $*).midi MIDI/$(dir $*)

