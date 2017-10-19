system-count = 2
% decrease system-to-system padding to fit onto page with previous score
system-system-spacing.padding = 2
system-system-spacing.basic-distance = 2
score-markup-spacing.padding = 1
score-markup-spacing.basic-distance = 1
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
