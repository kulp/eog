VARIANTS_PDF  = $(notdir $(wildcard variants/PDF/*))
VARIANTS_MIDI = $(notdir $(wildcard variants/MIDI/*))
VARIANTS_MP3  = $(notdir $(wildcard variants/MP3/*)) # allverses
SHELL         = /bin/bash
LYS           = $(shell ls -1 src/EOG???{,[a-z]}.ly 2> /dev/null) # depend on bash-like expansion
PDFS          = $(foreach v,$(VARIANTS_PDF) ,$(addprefix  PDF/$v/,$(notdir $(LYS:.ly=.pdf ))))
MIDIS         = $(foreach v,$(VARIANTS_MIDI),$(addprefix MIDI/$v/,$(notdir $(LYS:.ly=.midi))))
MP3S          = $(foreach v,$(VARIANTS_MP3) ,$(addprefix  MP3/$v/,$(notdir $(LYS:.ly=.mp3 ))))
WAVS          = $(foreach v,$(VARIANTS_MP3) ,$(addprefix  WAV/$v/,$(notdir $(LYS:.ly=.wav ))))
TXTS          = $(addprefix TXT/default/,$(notdir $(LYS:.ly=.txt)))

tolower = $(shell tr 'A-Z' 'a-z' <<<$1)

ifneq ($(DEBUG),1)
LYOPTS += -dno-point-and-click -ddelete-intermediate-files
endif

vpath .ly   src
vpath .midi MIDI
vpath .pdf  PDF
vpath .mp3  MP3

.SUFFIXES:
.SUFFIXES: .ly .ily .pdf .midi .mp3

.DEFAULT_GOAL = all

.PHONY: all pdf midi mp3 index dist zip lyrics preview
all: pdf midi index mp3 zip
pdf: $(PDFS)
midi: $(MIDIS)
mp3: $(MP3S)
# WAVs are not made unless requested, since the output files are large
wav: $(WAVS)
# WAVs are deleted by default when made only to produce MP3s
.INTERMEDIATE: $(WAVS)
lyrics: $(TXTS)
dist: zip
zip: EOG_midi_pdf.zip
preview: $(PDFS)
	open $^

CLOBBERFILES += EOG_midi_pdf.zip
EOG_midi_pdf.zip: $(PDFS) $(MIDIS) README.txt
	zip -u $@ $^

index: index.html
CLEANFILES += index.html
index.html: $(PDFS) $(MIDIS) $(MP3S) $(TXTS)
	scripts/make_index.pl $^ > $@.$$$$ && mv $@.$$$$ $@

clean:
	$(RM) *.log $(CLEANFILES)

clobber: clean
	$(RM) -r $(CLOBBERFILES)

CLOBBERFILES += deps
ifeq ($(words $(filter clean clobber,$(MAKECMDGOALS))),0)
-include $(PDFS:%=deps/%.d)
-include $(MIDIS:%=deps/%.d)
-include $(MP3S:%=deps/%.d)
endif

# Use an order-only dependency on transforms.map, because we don't update older
# songs with new transforms -- new transforms apply only to new songs. An
# order-only dependency therefore reduces needless rebuilds of older songs.
$(TXTS): TXT/default/%.txt: src/%.ly scripts/getlyrics.pl | transforms.map
	@mkdir -p $(@D)
	scripts/getlyrics.pl $< 2>> $| > $@.$$$$ && mv $@.$$$$ $@ || rm $@.$$$$

.SECONDEXPANSION:
# TODO rewrite this rule (it's rather roundabout and messy)
$(PDFS:%=deps/%.d) $(MIDIS:%=deps/%.d): deps/%.d: src/$$(*F).ly
	mkdir -p $(@D)
	echo -n '$*: ' > $@
	sed -n '/\include/s#[[:space:]]*\\include[[:space:]]*##p' $< | tr -d '"' | sed 's#^#variants/$(*D)#' | tr '\012' ' ' >> $@
	echo >> $@

# We use midish with no explicit settings to filter out program-change events,
# so that our program-change settings to fluidsynth are respected.
MIDI/vanilla/%.midi: MIDI/default/%.midi
	mkdir -p $(@D)
	midish -b <<<'import "$<"; export "$@"'
CLOBBERFILES += MIDI/vanilla/

# I would like to use long (`--` style) options to fluidsynth, but version
# 1.1.6 doesn't seem to understand them, even though its help summary indicates
# it should.
WAV/%.wav: MIDI/vanilla/$$(*F).midi
	mkdir -p $(@D)
	fluidsynth -F $@ -T wav -f variants/MP3/$(*D)/fluid.cfg $<

MP3/%.mp3: WAV/$$(*D)/$$(*F).wav
	mkdir -p $(@D)
	lame $< $@

CLOBBERFILES += $(PDFS) $(WAVS) $(MIDIS) $(MP3S)
PDF/%.pdf MIDI/%.midi: src/$$(*F).ly
	mkdir -p $(@D)
	lilypond $(LYOPTS) --include=$(PWD)/variants/$(@D) --pdf --output=$(@D)/$(*F) $<
	-mv $(@D)/$(*F).pdf  PDF/$(*D)
	-mv $(@D)/$(*F).midi MIDI/$(*D)

