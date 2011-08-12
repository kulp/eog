VARIANTS_PDF  = eogsized letter
VARIANTS_MIDI = default
SHELL         = /bin/bash
LYS           = $(shell ls -1 src/EOG???{,[a-z]}.ly 2> /dev/null) # depend on bash-like expansion
PDFS          = $(foreach v,$(VARIANTS_PDF) ,$(addprefix  PDF/$v/,$(notdir $(LYS:.ly=.pdf ))))
MIDIS         = $(foreach v,$(VARIANTS_MIDI),$(addprefix MIDI/$v/,$(notdir $(LYS:.ly=.midi))))
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
all: pdf midi index
pdf: $(PDFS)
midi: $(MIDIS)

push:
	git push kulp.ch :
	@# check compilation first to make sure we don't fail make and then clobber
	ssh kulp.ch "cd kulp.ch/eog && git checkout master && git reset --hard master && rm -f index.html && make -j4"

index: index.html
CLEANFILES += index.html
index.html: $(PDFS) $(MIDIS)
	scripts/make_index.pl $^ > $@.$$$$ && mv $@.$$$$ $@

clean:
	$(RM) *.log $(CLEANFILES)

clobber: clean
	$(RM) -r $(CLOBBERFILES)

CLOBBERFILES += $(PDFS:.pdf=.d) $(MIDIS:.midi=.d)
ifeq ($(words $(filter clean clobber,$(MAKECMDGOALS))),0)
-include $(PDFS:.pdf=.d)
-include $(MIDIS:.midi=.d)
endif

# TODO rewrite this rule (it's very roundabout and messy)
define DRULE
	echo -n '$<: ' > $@
	sed -n '/\include/s#[[:space:]]*\\include[[:space:]]*##p' $(notdir $*).ly | tr -d '"' | sed 's#^#$(dir $*)#' | sed 's#^$1#variants#' | tr '\012' ' ' >> $@
	echo >> $@
endef

# TODO unify these almost identical rules
# TODO keep the generation of .d files from requiring the building of the products
%.d: %.pdf
	$(call DRULE,PDF)

%.d: %.midi
	$(call DRULE,MIDI)

.SECONDEXPANSION:
CLOBBERFILES += PDF/ MIDI/
PDF/%.pdf MIDI/%.midi: src/$$(notdir $$*).ly
	mkdir -p PDF/$(dir $*) MIDI/$(dir $*)
	lilypond $(LYOPTS) --include=$(PWD)/variants/$(dir $*) --pdf --output=$(dir $@)$(notdir $*) $<
	-mv $(dir $@)$(notdir $*).pdf  PDF/$(dir $*)
	-mv $(dir $@)$(notdir $*).midi MIDI/$(dir $*)

