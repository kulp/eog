# All rules are subject to SECONDEXPANSION
.SECONDEXPANSION:

# Dependencies: lilypond, mp3info2, MP3::Tag (for mp3info2), id3v2, midish, zip, fluidsynth, lame
VARIANTS_PDF  = $(notdir $(wildcard variants/PDF/*))
VARIANTS_MIDI = $(notdir $(wildcard variants/MIDI/*))
VARIANTS_MP3  = $(notdir $(wildcard variants/MP3/*)) # allverses
SHELL         = /bin/sh # depend on POSIX shell, at least
LYS           = $(notdir $(wildcard src/EOG???.ly))
PDFS          = $(foreach v,$(VARIANTS_PDF) ,$(addprefix  PDF/$v/,$(LYS:.ly=.pdf )))
MIDIS         = $(foreach v,$(VARIANTS_MIDI),$(addprefix MIDI/$v/,$(LYS:.ly=.midi)))
MP3S          = $(foreach v,$(VARIANTS_MP3) ,$(addprefix  MP3/$v/,$(LYS:.ly=.mp3 )))
LYRICAL_MP3S  = $(foreach v,$(VARIANTS_MP3) ,$(addprefix  MP3/$v/,$(STD_LYS:.ly=.mp3)))
ADDL_MP3S     = $(foreach v,$(VARIANTS_MP3) ,$(addprefix  MP3/$v/,$(ADDL_LYS:.ly=.mp3)))
WAVS          = $(foreach v,$(VARIANTS_MP3) ,$(addprefix  WAV/$v/,$(LYS:.ly=.wav )))
TXTS          = $(patsubst %.ly,TXT/default/%.txt,$(STD_LYS))
LATINS        = $(TXTS:TXT/default/%=TXT/latinized/%)
M3US          = $(VARIANTS_MP3:%=%.m3u)
ADDL_LYS      = $(filter EOGa%.ly,$(LYS))
STD_LYS       = $(filter-out EOGa%.ly,$(LYS))

HEADERS       = hymnnumber title poet composer meter tunename
ADDL_HEADERS  = hymnnumber composer meter tunename

WEB_BASE = http://purl.org/echoesofgrace/
ENCODING_PERSON = Darren Kulp <darren@kulp.ch>
BOOK_NAME = Echoes of Grace
PRIMARY_FILE_COUNT = 379
TOTAL_FILE_COUNT = 387
TOTAL_PAGE_COUNT = 358 # for toplevel

LILYPOND ?= lilypond

space :=#
space +=#
comma :=,
HEADER_BRACES = {$(subst $(space),$(comma),$(HEADERS))}
HEADER_PATTERNS = $(foreach h,$(HEADERS),PDF/%.$h)

LYOPTS += --loglevel=WARNING

ifneq ($(DEBUG),)
LYOPTS += --loglevel=DEBUG
LAMEOPTS += --verbose
endif

ifneq ($(DEBUG),1)
.SILENT:
LYOPTS += --define-default=no-point-and-click --define-default=delete-intermediate-files
# Currently we don't upgrade warnings to errors except when making book files,
# because there are (ly:expect-warning) calls that are specific to eogsized
# output
book PDF/eogsized/%: LYOPTS += --define-default=warning-as-error
LAMEOPTS += --quiet
endif

# Inhibit inappropriate default suffix rules to simplify debugging
.SUFFIXES:

.DEFAULT_GOAL = all

.PHONY: all pdf midi mp3 m3u index dist zip lyrics preview latin
all: pdf midi lyrics index mp3 m3u book
pdf: $(PDFS)
midi: $(MIDIS)
mp3: $(MP3S)
m3u: $(M3US)
# WAVs are not made unless requested, since the output files are large
wav: $(WAVS)
# WAVs are deleted by default when made only to produce MP3s
.INTERMEDIATE: $(WAVS)
lyrics: $(TXTS)
dist: zip
zip: EOG_midi_pdf.zip
preview: $(PDFS)
	open $^

CLOBBERFILES += $(M3US)
$(M3US): %.m3u: $(LYS:%.ly=MP3/$$*/%.mp3)
	@echo "[ M3U ] $@"
	echo '#EXTM3U' > $@
	mp3info2 -p "#EXTINF:%s,%a - %{TIT2}\n%{d1}/%{d0}/%f\n\n" $^ 2> /dev/null >> $@

CLOBBERFILES += EOG_midi_pdf.zip
EOG_midi_pdf.zip: $(PDFS) $(MIDIS) README.txt
	zip -u $@ $^

# Explicitly build `vanilla` MIDI files for index, since they are automatically
# picked up by the perl script, whereas they are only built as a side-effect of
# MP3 generation in this Makefile.
index: vanilla index.html
CLEANFILES += index.html
index.html: pdf midi mp3 m3u latin
	@echo "[ HTML ] $@"
	scripts/make_index.pl > $@ || (rm $@ ; false)

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

CLOBBERFILES += $(TXTS)
# Use an order-only dependency on transforms.map, because we don't update older
# songs with new transforms -- new transforms apply only to new songs. An
# order-only dependency therefore reduces needless rebuilds of older songs.
# The same applies for the lyrics generator script.
$(TXTS): TXT/default/%.txt: src/%.ly | scripts/getlyrics.pl transforms.map
	@echo "[ LYRICS ] $@"
	@mkdir -p $(@D)
	scripts/getlyrics.pl $< 2>> transforms.map > $@ || (rm $@ ; false)

latin: $(LATINS)
CLOBBERFILES += $(LATINS)
TXT/latinized/%.txt: TXT/default/%.txt | TXT/latinized
	@echo "[ LATIN ] $@"
	scripts/latinize.sh $< > $@ || (rm $@ ; false)

# TODO rewrite this rule (it's rather roundabout and messy)
$(PDFS:%=deps/%.d) $(MIDIS:%=deps/%.d): deps/%.d: src/$$(basename $$(*F)).ly
	@echo "[ DEPS ] $@"
	@mkdir -p $(@D)
	@echo '$*: \\' > $@
	@sed -n '/\include/s#[[:space:]]*\\include[[:space:]]*##p' $< | tr -d '"' | sed 's#^#variants/$(*D)/#' | tr '\n' ' ' >> $@
	@echo >> $@

# We use midish with no explicit settings to filter out program-change events,
# so that our program-change settings to fluidsynth are respected.
vanilla: $(LYS:%.ly=MIDI/vanilla/%.midi)
MIDI/vanilla/%.midi: MIDI/default/%.midi
	mkdir -p $(@D)
	midish -b <<<'import "$<"; export "$@"'
CLOBBERFILES += $(LYS:%.ly=MIDI/vanilla/%.midi)

# I would like to use long (`--` style) options to fluidsynth, but that
# requires a version built with GETOPT_SUPPORT
WAV/%.wav: MIDI/vanilla/$$(*F).midi
	@echo "[ WAV ] $@"
	mkdir -p $(@D)
	fluidsynth -F $@ -T wav -f variants/MP3/$(*D)/fluid.cfg $<

MP3/%.mp3: hymnnumber = $$(< PDF/eogsized/$(HEADER_BASE).hymnnumber)
$(VARIANTS_MP3:%=MP3/%/EOGa%.mp3): hymnnumber = $$(( $(PRIMARY_FILE_COUNT) + $$(< PDF/eogsized/$(HEADER_BASE).hymnnumber) ))

MP3/%.mp3: HEADER_BASE = $(basename $(*F))
MP3/%.mp3: LAMEOPTS += --id3v2-only
MP3/%.mp3: LAMEOPTS += --tn "$(hymnnumber)/$(TOTAL_FILE_COUNT)"
MP3/%.mp3: LAMEOPTS += --tl '$(BOOK_NAME)'
MP3/%.mp3: LAMEOPTS += --tv TCMP=1 # iTunes compilation flag
MP3/%.mp3: LAMEOPTS += --tv TCOM="$$(./scripts/latinize.sh PDF/eogsized/$(HEADER_BASE).composer)"
MP3/%.mp3: LAMEOPTS += --tv TENC="$(ENCODING_PERSON)"
MP3/%.mp3: LAMEOPTS += --tv TIT3="$$(./scripts/latinize.sh PDF/eogsized/$(HEADER_BASE).tunename)"
MP3/%.mp3: LAMEOPTS += --tv TLAN='English'
MP3/%.mp3: LAMEOPTS += --tv WOAF="$(WEB_BASE)$@"
MP3/%.mp3: LAMEOPTS += --tv WPUB="$(WEB_BASE)"
$(LYRICAL_MP3S): LAMEOPTS += --ta "$$(./scripts/latinize.sh PDF/eogsized/$(HEADER_BASE).poet)"
$(LYRICAL_MP3S): LAMEOPTS += --tt "$$(./scripts/latinize.sh PDF/eogsized/$(HEADER_BASE).title)"
$(LYRICAL_MP3S): LAMEOPTS += --tv TEXT="$$(./scripts/latinize.sh PDF/eogsized/$(HEADER_BASE).poet)"
# depend on text files only for files containing lyrics
$(LYRICAL_MP3S): MP3/%.mp3: WAV/$$(*D)/$$(*F).wav TXT/latinized/$$(basename $$(*F)).txt $$(foreach h,$(HEADERS),PDF/eogsized/$$(*F).$$h)
	@echo "[ MP3 ] $@"
	mkdir -p $(@D)
	lame $(LAMEOPTS) $< $@
	id3v2 --USLT "$$(< $(filter %.txt,$^))" $@

$(ADDL_MP3S): MP3/%.mp3: WAV/$$(*D)/$$(*F).wav $$(foreach h,$(ADDL_HEADERS),PDF/eogsized/$$(*F).$$h)
	@echo "[ MP3 ] $@"
	mkdir -p $(@D)
	lame $(LAMEOPTS) $< $@

TXT/latinized metrics:
	mkdir -p $@

check: book
	[[ $$(pdfinfo booklayout/toplevel.pdf | grep Pages: | (read a b ; echo $$b)) = $(TOTAL_PAGE_COUNT) ]]
	!(git grep -n '\b[A-Z][A-Z][a-z]' src/) # check for initial miscapitalization
	perl -ne 'die "$$ARGV\n" if /bold (\d+) .*?words(\w+)/g and $$1 != ord($$2) - ord("A") + 1' src/*.ly
	perl -ne 'next unless ($$written) = /hymnnumber = "(\d+)"/; die $$ARGV if $$written != ($$ARGV =~ /EOGa?(\d+)/)[0]' src/*.ly
	perl -ne 'die $$ARGV if /^(wordsA|Refrain\b).*\{$$/../^}/ and not /\\bar/ and not /stanza/ and not /[{}]$$/ and not /^\s*$$/ and not /^\s*\\Refrain/ and not /^%/' src/*.ly
	for f in src/EOG*.ly ; do perl -F// -lane '$$h{$$_}++ for @F; END{ die $$ARGV if $$h{"("} != $$h{")"} }' $$f ; done
	for f in src/EOG*.ly ; do perl -F// -lane '$$h{$$_}++ for @F; END{ die $$ARGV if $$h{"["} != $$h{"]"} }' $$f ; done

CLOBBERFILES += metrics/
metrics/%.metrics: PDF/eogsized/%.pdf | metrics
	@echo "[ METRICS ] $@"
	convert "$<" -trim info:"$@" || (rm $@ ; false)

CLOBBERFILES += booklayout/book.tex booklayout/book.aux booklayout/book.log
booklayout/book.tex: $(LYS:%.ly=metrics/%.metrics) | $(LYS:%.ly=PDF/eogsized/%.pdf)
	@echo "[ BOOK ] $@"
	scripts/makebook.pl $| > $@ || (rm $@ ; false)

booklayout/index.meter: $(LYS:%.ly=PDF/eogsized/%.meter)
	@echo "[ METER ] $@"
	sed -nep $^ | sort -u | while read b ; do /bin/echo -n "$$b	" ; grep -l "^$$b$$" $^ | cut -d/ -f3 | cut -d. -f1 | tr '\n' ' ' ; echo ; done > $@ || (rm $@ ; false)

%.pdf: %.tex
	@echo "[ LATEX ] $@"
	lualatex --shell-escape --output-directory=$(@D) $<

.PHONY: FORCE
booklayout/revision.tex: FORCE
	git log -1 --format=%h --abbrev=10 > $@ || rm $@

booklayout/toplevel.pdf: booklayout/revision.tex booklayout/book.tex
booklayout/toplevel.pdf: $(foreach f,metrical first gospel children,booklayout/$f_insert.tex)

booklayout/metrical_insert.tex: booklayout/index.meter
	@echo "[ INDEX ] $@"
	scripts/make_metrical_index.pl < $< | scripts/format_metrical_index.pl > $@

# Workarounds
IGNORE_WARNINGS += PDF/eogsized/EOG177.pdf
IGNORE_WARNINGS += PDF/eogsized/EOG311.pdf
$(IGNORE_WARNINGS): LYOPTS += --define-default=warning-as-error='\#f'

booklayout/gospel_insert.tex: LYS = $(notdir $(shell grep -l '%gospel' src/EOG*.ly))
booklayout/children_insert.tex: LYS = $(notdir $(shell grep -l '%children' src/EOG*.ly))
booklayout/first_insert.tex: export USE_REFRAIN=1
booklayout/gospel_insert.tex: export USE_REFRAIN=1
booklayout/children_insert.tex: export USE_REFRAIN=0
booklayout/%_insert.tex: $$(TXTS)
	@echo "[ INDEX ] $@"
	scripts/make_alpha_index.pl $^ > $@ || (rm $@ ; false)

book: cover booklayout/toplevel.pdf

COVERS += booklayout/cover-standard-paperback.pdf
COVERS += booklayout/cover-premium-paperback.pdf
COVERS += booklayout/cover-coilbound.pdf
COVERS += booklayout/cover-casewrap.pdf
cover: $(COVERS)

$(COVERS): booklayout/cover-base.tex

$(COVERS): booklayout/leather-green-tiled.jpg
booklayout/leather-green-tiled.jpg: booklayout/leather-green.jpg
	montage $<{,,,,,,,,,,,,,,,,,,,,,,,,,,,,,} -tile 6x5 -geometry +0+0 $@

# If an override file doesn't exist, create an empty one
vpath override-%.ily $(addsuffix /override,$(wildcard variants/*/*))
override-%.ily:
	@echo "Generating empty override file $@ ..."
	mkdir -p $(@D)
	touch $@

CLOBBERFILES += $(PDFS) $(WAVS) $(MIDIS) $(MP3S)
CLOBBERFILES += $(LYS:%.ly=PDF/*/%.$(HEADER_BRACES))
# PDF rule also creates header files (wanted to do it with MIDI rule but no
# header files were dumped when there were no active `\layout{ }` blocks)
PDF/%.pdf $(HEADER_PATTERNS): LYOPTS += --header=$(HEADER_BRACES)
PDF/%.pdf $(HEADER_PATTERNS): LYOPTS += --define-default=include-settings=variants/PDF-settings.ily
PDF/%.pdf $(HEADER_PATTERNS): LYOPTS += --pdf
PDF/%.pdf $(HEADER_PATTERNS): src/$$(*F).ly
	@mkdir -p $(@D)
	@echo "[ PDF ] $*.pdf"
	$(LILYPOND) $(LYOPTS) --include=$(CURDIR)/variants/PDF/$(*D) --output=PDF/$* $<

MIDI/%.midi: LYOPTS += --define-default=include-settings=variants/MIDI-settings.ily
MIDI/%.midi: LYOPTS += --define-default=no-print-pages
MIDI/%.midi: src/$$(*F).ly
	@mkdir -p $(@D)
	@echo "[ MIDI ] $*.midi"
	$(LILYPOND) $(LYOPTS) --include=$(CURDIR)/variants/$(@D) --output=MIDI/$* $<

