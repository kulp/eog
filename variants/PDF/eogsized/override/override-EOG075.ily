% decrease system-to-system padding to fit onto page with previous score
system-system-spacing.padding = 0
system-system-spacing.basic-distance = 0
ragged-bottom = ##t
ragged-last-bottom = ##t
systems-per-page = ##f
scoreTitleMarkup = \markup {
  \override #'(baseline-skip . 3.5)
  \column {
	\override #'(baseline-skip . 3.5)
	\column {
	  \fill-line {
		\huge \larger \larger \bold {
		  \concat { "  " \fromproperty #'header:hymnnumber }
		  \mytitle
		  \null
		}
	  }
	  \fill-line {
		% less lowering (to save vertical space)
		\lower #1 \fromproperty #'header:poet
		\smaller \bold \mysubtitle
		\lower #1 \fromproperty #'header:composer
	  }
	}
  }
}
