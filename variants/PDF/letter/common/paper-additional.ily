indent        = 0\cm
%top-margin    = 1\cm
%bottom-margin = 1\cm
ragged-bottom = ##f
ragged-last-bottom = ##t
%annotate-spacing = ##t
print-page-number = ##f
print-first-page-number = ##f

#(define-markup-command
    (mysubtitle layout props) ; params
    () ; param types
    (interpret-markup layout props
      (markup (#:concat ( "(" (chain-assoc-get 'header:meter props) ")")))
      ))

scoreTitleMarkup = \markup {
  \override #'(baseline-skip . 3.5)
  \column {
    \override #'(baseline-skip . 3.5)
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          \concat { "  " \fromproperty #'header:hymnnumber }
          \fromproperty #'header:tunename
          \null
        }
      }
      \fill-line {
        \lower #2 \fromproperty #'header:alternate
        \smaller \bold \mysubtitle
        \lower #2 \fromproperty #'header:composer
      }
    }
  }
}

bookTitleMarkup = \markup { }
oddHeaderMarkup = \markup { }
evenHeaderMarkup = \markup { }
