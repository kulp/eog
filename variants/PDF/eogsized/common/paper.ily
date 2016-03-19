#(set! paper-alist (cons '("eogsized" . (cons (* 131 mm) (* 200 mm))) paper-alist))
#(set-paper-size "eogsized")
indent        = 0\cm
%top-margin    = 1\cm
%bottom-margin = 1\cm
%left-margin   = 1\cm
%right-margin  = 1\cm
ragged-bottom = ##f
ragged-last-bottom = ##f
%annotate-spacing = ##t
systems-per-page = 4
page-count = 1
print-page-number = ##f
print-first-page-number = ##f

scoreTitleMarkup = \markup {
  \override #'(baseline-skip . 3.5)
  \column {
    \override #'(baseline-skip . 3.5)
    \column {
      \fill-line {
        \huge \larger \larger \bold {
          \concat { "  " \fromproperty #'header:hymnnumber }
          \fromproperty #'header:title
          \null
        }
      }
      \fill-line {
        \smaller \bold
        \concat { "(" \fromproperty #'header:tunename ".  " \fromproperty #'header:meter ")" }
      }
      \fill-line {
        \fromproperty #'header:poet
        \fromproperty #'header:composer
      }
    }
  }
}

bookTitleMarkup = \markup { }
oddHeaderMarkup = \markup
\fill-line {
  " "
  \on-the-fly #not-part-first-page \fromproperty #'header:title
}
%% evenHeaderMarkup inherits the value of oddHeaderMarkup
