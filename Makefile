# All rules are subject to SECONDEXPANSION
.SECONDEXPANSION:

# Delete output files when recipes exit nonzero
.DELETE_ON_ERROR:

# Dependencies: lilypond, mp3info2, MP3::Tag (for mp3info2), id3v2, midish, zip, fluidsynth, lame
VARIANTS_PDF  = $(notdir $(wildcard variants/PDF/*))
VARIANTS_SVG  = $(notdir $(wildcard variants/SVG/*))
VARIANTS_MIDI = $(notdir $(wildcard variants/MIDI/*))
VARIANTS_MP3  = $(notdir $(wildcard variants/MP3/*)) # allverses
SHELL         = /bin/sh # depend on POSIX shell, at least
LYS           = $(notdir $(wildcard src/EOG???.ly))
PDFS          = $(foreach v,$(VARIANTS_PDF) ,$(addprefix  PDF/$v/,$(LYS:.ly=.pdf )))
# SVGs are not generated for the "additional" tunes.
SVGS          = $(foreach v,$(VARIANTS_SVG) ,$(addprefix  SVG/$v/,$(filter-out EOGa%,$(LYS:.ly=.svg))))
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

# Fix lilypond version at 2.20.0 until an issue with EOG302 markup verses is
# understood.
LILYPOND_VERSION = 2.20.0
DOCKER_IMAGE_VARIANT =# empty, except for overrides
DOCKER_IMAGE = jeandeaual/lilypond:$(LILYPOND_VERSION)$(DOCKER_IMAGE_VARIANT)
LILYPOND ?= docker run --volume $(CURDIR):$(CURDIR) --workdir $(CURDIR) $(DOCKER_IMAGE) lilypond

# Use the `-fonts` variant (though larger) for the Unicode star in EOG083.
# Avoid using the `-fonts` variant in general, because (at least at version
# 2.20.0) it takes a very long time to run font configuration.
%/EOG083.pdf: DOCKER_IMAGE_VARIANT = -fonts

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
# because there are "expected" warnings for letter files.
book PDF/eogsized/%: LYOPTS += --define-default=warning-as-error
LAMEOPTS += --quiet
endif

# Inhibit inappropriate default suffix rules to simplify debugging
.SUFFIXES:

.DEFAULT_GOAL = all

.PHONY: all pdf midi mp3 m3u index dist zip lyrics preview latin
all: pdf midi lyrics index mp3 m3u book
pdf: $(PDFS)
svg: $(SVGS)
svg: SVG/online/index.html.gz
svg: SVG/offline/index.html.gz
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
index.html: pdf midi mp3 m3u latin ebook
	@echo "[ HTML ] $@"
	scripts/make_index.pl > $@

clean:
	$(RM) *.log $(CLEANFILES)

clobber: clean
	$(RM) -r $(CLOBBERFILES)

CLOBBERFILES += deps
ifeq ($(words $(filter clean clobber,$(MAKECMDGOALS))),0)
-include $(PDFS:%=deps/%.d)
-include $(SVGS:%=deps/%.d)
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
	scripts/getlyrics.pl $< 2>> transforms.map > $@

latin: $(LATINS)
CLOBBERFILES += $(LATINS)
TXT/latinized/%.txt: TXT/default/%.txt | TXT/latinized
	@echo "[ LATIN ] $@"
	scripts/latinize.sh $< > $@

# TODO rewrite this rule (it's rather roundabout and messy)
$(PDFS:%=deps/%.d) $(SVGS:%=deps/%.d) $(MIDIS:%=deps/%.d): deps/%.d: src/$$(basename $$(*F)).ly
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
MP3/%.mp3: LAMEOPTS += --tv TCOM="$$(cat PDF/eogsized/$(HEADER_BASE).composer)"
MP3/%.mp3: LAMEOPTS += --tv TENC="$(ENCODING_PERSON)"
MP3/%.mp3: LAMEOPTS += --tv TIT3="$$(cat PDF/eogsized/$(HEADER_BASE).tunename)"
MP3/%.mp3: LAMEOPTS += --tv TLAN='English'
MP3/%.mp3: LAMEOPTS += --tv WOAF="$(WEB_BASE)$@"
MP3/%.mp3: LAMEOPTS += --tv WPUB="$(WEB_BASE)"
$(LYRICAL_MP3S): LAMEOPTS += --ta "$$(cat PDF/eogsized/$(HEADER_BASE).poet)"
$(LYRICAL_MP3S): LAMEOPTS += --tt "$$(cat PDF/eogsized/$(HEADER_BASE).title)"
$(LYRICAL_MP3S): LAMEOPTS += --tv TEXT="$$(cat PDF/eogsized/$(HEADER_BASE).poet)"
# depend on text files only for files containing lyrics
$(LYRICAL_MP3S): MP3/%.mp3: WAV/$$(*D)/$$(*F).wav TXT/latinized/$$(basename $$(*F)).txt $$(foreach h,$(HEADERS),PDF/eogsized/$$(*F).$$h)
	@echo "[ MP3 ] $@"
	mkdir -p $(@D)
	lame $(LAMEOPTS) $< $@
	id3v2 --id3v2-only --USLT "$$(< $(filter %.txt,$^))" $@

$(ADDL_MP3S): MP3/%.mp3: WAV/$$(*D)/$$(*F).wav $$(foreach h,$(ADDL_HEADERS),PDF/eogsized/$$(*F).$$h)
	@echo "[ MP3 ] $@"
	mkdir -p $(@D)
	lame $(LAMEOPTS) $< $@

TXT/latinized metrics:
	mkdir -p $@

check: check_src check_pdf check_book
check_src:
	!(git grep -n '\b[A-Z][A-Z][a-z]' src/) # check for initial miscapitalization
	perl -ne 'die "$$ARGV\n" if /bold (\d+) .*?words(\w+)/g and $$1 != ord($$2) - ord("A") + 1' src/*.ly
	perl -ne 'next unless ($$written) = /hymnnumber = "(\d+)"/; die $$ARGV if $$written != ($$ARGV =~ /EOGa?(\d+)/)[0]' src/*.ly
	perl -ne 'die $$ARGV if /^(wordsA|Refrain\b).*\{$$/../^}/ and not /\\bar/ and not /stanza/ and not /[{}]$$/ and not /^\s*$$/ and not /^\s*\\Refrain/ and not /^%/' src/*.ly
	for f in src/EOG*.ly ; do perl -lne 'next unless /^words/.../^}/; ($$s) = /stanza = "(\d+)\."/; die $$ARGV if $$s and $$c[$$s]++; END{$$c[$$_] or die $$ARGV for -$$#c..-1}' $$f ; done
	for f in src/EOG*.ly ; do perl -F// -lane '$$h{$$_}++ for @F; END{ die $$ARGV if $$h{"("} != $$h{")"} }' $$f ; done
	for f in src/EOG*.ly ; do perl -F// -lane '$$h{$$_}++ for @F; END{ die $$ARGV if $$h{"["} != $$h{"]"} }' $$f ; done
	!(grep -q '^\\line.*--' src/EOG*.ly)
check_pdf: PDF/eogsized/EOG302.pdf
	pdftotext -raw -layout -nopgbrk PDF/eogsized/EOG302.pdf - | grep --quiet "5 The Bible tells us He will come"
check_book: book
	[[ $$(pdfinfo booklayout/toplevel.pdf | grep Pages: | (read a b ; echo $$b)) = $(TOTAL_PAGE_COUNT) ]]

CLOBBERFILES += metrics/
metrics/%.metrics: PDF/eogsized/%.pdf | metrics
	@echo "[ METRICS ] $@"
	magick identify -format "%P %@\n" $< > $@

CLOBBERFILES += booklayout/book.tex booklayout/book.aux booklayout/book.log
booklayout/book.tex: $(LYS:%.ly=metrics/%.metrics) | $(LYS:%.ly=PDF/eogsized/%.pdf)
	@echo "[ BOOK ] $@"
	scripts/makebook.pl $| > $@

booklayout/index.meter: $(LYS:%.ly=PDF/eogsized/%.meter)
	@echo "[ METER ] $@"
	sed -nep $^ | sort -u | while read b ; do /bin/echo -n "$$b	" ; grep -l "^$$b$$" $^ | cut -d/ -f3 | cut -d. -f1 | tr '\n' ' ' ; echo ; done > $@

%.pdf: %.tex
	@echo "[ LATEX ] $@"
	lualatex --shell-escape --output-directory=$(@D) $<

.PHONY: FORCE
booklayout/revision.tex: FORCE
	git describe --always --match='v*' > $@

booklayout/toplevel.pdf: booklayout/revision.tex booklayout/book.tex
booklayout/toplevel.pdf: $(foreach f,metrical first gospel children,booklayout/$f_insert.tex)

CLEANFILES += booklayout/ebook_index.tex
booklayout/ebook_index.tex: scripts/make_ebook_index.pl
	$(realpath $<) > $@
booklayout/ebook.pdf: booklayout/ebook.tex booklayout/letterbook.tex booklayout/ebook_index.tex
booklayout/ebook.pdf: $(LYS:%.ly=PDF/letter/%.pdf)
booklayout/toplevel.pdf: $(foreach f,metrical first gospel children,booklayout/$f_insert.tex)

ebook: booklayout/ebook.pdf

booklayout/metrical_insert.tex: booklayout/index.meter
	@echo "[ INDEX ] $@"
	scripts/make_metrical_index.pl < $< | scripts/format_metrical_index.pl > $@

booklayout/gospel_insert.tex: LYS = $(notdir $(shell grep -l '%gospel' src/EOG*.ly))
booklayout/children_insert.tex: LYS = $(notdir $(shell grep -l '%children' src/EOG*.ly))
booklayout/first_insert.tex: export USE_REFRAIN=1
booklayout/gospel_insert.tex: export USE_REFRAIN=1
booklayout/children_insert.tex: export USE_REFRAIN=0
booklayout/%_insert.tex: $$(TXTS)
	@echo "[ INDEX ] $@"
	scripts/make_alpha_index.pl $^ > $@

book: cover booklayout/toplevel.pdf

COVERS += booklayout/cover-paperback.pdf
COVERS += booklayout/cover-coilbound.pdf
COVERS += booklayout/cover-casewrap.pdf
cover: $(COVERS)

$(COVERS): booklayout/cover-base.tex

$(COVERS): booklayout/leather-green-tiled.jpg
%-50.jpg: %.jpg
	convert $< -resize 50% $@

booklayout/leather-green-tiled.jpg: booklayout/leather-green-50.jpg
	montage $<{,,,,,,,,,,,,,,,,,,,,,,,} -tile 6x4 -geometry +0+0 -units PixelsPerInch -density 300 $@

# If an override file doesn't exist, create an empty one
vpath override-%.ily $(addsuffix /override,$(wildcard variants/*/*))
override-%.ily:
	@echo "Generating empty override file $@ ..."
	mkdir -p $(@D)
	touch $@

CLOBBERFILES += $(PDFS) $(SVGS) $(WAVS) $(MIDIS) $(MP3S)
CLOBBERFILES += $(LYS:%.ly=PDF/*/%.$(HEADER_BRACES))
# PDF rule also creates header files (wanted to do it with MIDI rule but no
# header files were dumped when there were no active `\layout{ }` blocks)
PDF/%.pdf $(HEADER_PATTERNS): LYOPTS += --header=$(HEADER_BRACES)
PDF/%.pdf $(HEADER_PATTERNS): LYOPTS += --pdf
PDF/%.pdf $(HEADER_PATTERNS): src/$$(*F).ly
	@mkdir -p $(@D)
	@echo "[ PDF ] $*.pdf"
	$(LILYPOND) $(LYOPTS) --include=$(CURDIR)/variants/PDF/$(*D) --output=PDF/$* $<

SVG/%.svg: LYOPTS += --svg
SVG/%.svg: src/$$(*F).ly
	@mkdir -p $(@D)
	@echo "[ SVG ] $@"
	$(LILYPOND) $(LYOPTS) --include=$(CURDIR)/variants/SVG/$(*D) --output=SVG/$* $<
	xmlstarlet ed --inplace -N svg=http://www.w3.org/2000/svg --delete /svg:svg/@width --delete /svg:svg/@height $@
	(xmlstarlet sel -N svg=http://www.w3.org/2000/svg --template --value-of '/svg:svg/@viewBox' $@ | (read _ _ w _; echo $$w); inkscape --query-y --query-height $@) | \
        (   read w; read y; read h ; \
            xmlstarlet ed --inplace -N svg=http://www.w3.org/2000/svg \
                --update /svg:svg/@viewBox --value "0 0 $$w $$(echo "$$y * 2 + $$h" | bc)" \
                --append /svg:svg --type attr --name preserveAspectRatio --value "XMidYMin" \
                $@ \
        )
	svgo --multipass $@

SVG/online/index.html: scripts/make_svg_index.pl scripts/svg.css | $(SVGS:%=%.gz)
	@echo "[ INDEX ] $@"
	$< $| > $@
	ln -f scripts/svg.css $(@D)/

SVG/offline/index.html: export EMBED_CSS=1
SVG/offline/index.html: export EMBED_SVG=1
SVG/offline/index.html: scripts/make_svg_index.pl scripts/svg.css $(SVGS)
	@echo "[ INDEX ] $@"
	mkdir -p $(@D)
	$< $(filter %.svg,$^) > $@
	ln -f scripts/svg.css $(@D)/

MIDI/%.midi: LYOPTS += --define-default=no-print-pages
MIDI/%.midi: LYOPTS += --define-default=eog-midi-permitted
MIDI/%.midi: src/$$(*F).ly
	@mkdir -p $(@D)
	@echo "[ MIDI ] $*.midi"
	$(LILYPOND) $(LYOPTS) --include=$(CURDIR)/variants/$(@D) --output=MIDI/$* $<

%.gz: %
	@echo "[ GZIP ] $@"
	zopfli --gzip -c $< > $@

%.br: %
	@echo "[ BROTLI ] $@"
	brotli --force --output=$@ $<
