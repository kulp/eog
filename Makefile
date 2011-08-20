VARIANTS_PDF  = eogsized letter
VARIANTS_MIDI = default
VARIANTS_MP3  = default # allverses
SHELL         = /bin/bash
LYS           = $(shell ls -1 src/EOG???{,[a-z]}.ly 2> /dev/null) # depend on bash-like expansion
PDFS          = $(foreach v,$(VARIANTS_PDF) ,$(addprefix  PDF/$v/,$(notdir $(LYS:.ly=.pdf ))))
MIDIS         = $(foreach v,$(VARIANTS_MIDI),$(addprefix MIDI/$v/,$(notdir $(LYS:.ly=.midi))))
MP3S          = $(foreach v,$(VARIANTS_MP3) ,$(addprefix  MP3/$v/,$(notdir $(LYS:.ly=.mp3 ))))
#$(error $(PDFS))

tolower = $(shell tr 'A-Z' 'a-z' <<<$1)

ifneq ($(DEBUG),1)
LYOPTS += -dno-point-and-click -ddelete-intermediate-files
endif

vpath .ly   src
vpath .midi MIDI
vpath .pdf  PDF

.SUFFIXES:
.SUFFIXES: .ly .ily .pdf .midi

.DEFAULT_GOAL = all

.PHONY: all pdf midi index
all: pdf midi index mp3
pdf: $(PDFS)
midi: $(MIDIS)
mp3: $(MP3S)
#wav: $(WAVS)

MP3/%.mp3: MIDI/%.midi
	mkdir -p MP3/$(dir $*)
	timidity -Ow -o - $^ | lame - $@

%.wav: %.midi
	timidity -Ow -o $@ $^

push:
	git push kulp.ch :
	@# check compilation first to make sure we don't fail make and then clobber
	ssh kulp.ch "cd kulp.ch/eog && git checkout master && git reset --hard master && rm -f index.html && make -j4"

index: index.html
CLEANFILES += index.html
index.html: $(PDFS) $(MIDIS) $(MP3S)
	scripts/make_index.pl $^ > $@.$$$$ && mv $@.$$$$ $@

clean:
	$(RM) *.log $(CLEANFILES)

clobber: clean
	$(RM) -r $(CLOBBERFILES)

CLOBBERFILES += deps
ifeq ($(words $(filter clean clobber,$(MAKECMDGOALS))),0)
-include $(PDFS:%.pdf=deps/%.d)
-include $(MIDIS:%.midi=deps/%.d)
#-include $(MP3S:%.mp3=deps/%.d)
endif

# TODO rewrite this rule (it's very roundabout and messy)
define DRULE
	mkdir -p $$(dirname $@)
	echo -n '$*.$2: ' > $@
	sed -n '/\include/s#[[:space:]]*\\include[[:space:]]*##p' src/$(notdir $*).ly | tr -d '"' | sed 's#^#$(dir $*)#' | sed 's#^$1#variants#' | tr '\012' ' ' >> $@
	echo >> $@
endef

.SECONDEXPANSION:
# TODO unify these almost identical rules
$(PDFS:%.pdf=deps/%.d): deps/%.d: src/$$(notdir $$*).ly
	$(call DRULE,PDF,pdf)

$(MIDIS:%.midi=deps/%.d): deps/%.d: src/$$(notdir $$*).ly
	$(call DRULE,MIDI,midi)

# TODO if we start having variants for MP3, enable these
#$(MP3S:%.mp3=deps/%.d): deps/%.d: src/$$(notdir $$*).ly
#	$(call DRULE,MP3,mp3)

CLOBBERFILES += PDF/ MIDI/ MP3/
PDF/%.pdf MIDI/%.midi: src/$$(notdir $$*).ly
	mkdir -p PDF/$(dir $*) MIDI/$(dir $*)
	lilypond $(LYOPTS) --include=$(PWD)/variants/$(dir $*) --pdf --output=$(dir $@)$(notdir $*) $<
	-mv $(dir $@)$(notdir $*).pdf  PDF/$(dir $*)
	-mv $(dir $@)$(notdir $*).midi MIDI/$(dir $*)

