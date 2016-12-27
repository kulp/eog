indent        = 0\cm
%top-margin    = 1\cm
%bottom-margin = 1\cm
ragged-bottom = ##f
ragged-last-bottom = ##t
%annotate-spacing = ##t
print-page-number = ##f
print-first-page-number = ##f

% flag to let us more strictly control eogsized layout
is-eogsized = ##f

#(define-markup-command
    (mysubtitle layout props) ; params
    () ; param types
    (interpret-markup layout props
     (let ((tune (chain-assoc-get 'header:tunename props))
           (meter (chain-assoc-get 'header:meter props)))
      (if (string-null? tune)
       (markup (#:concat ( "(" meter ")")))
       (if (string-null? meter)
         (markup (#:concat ( "(" tune ".)")))
         (markup (#:concat ( "(" tune ". " meter ")")))
         )
       ))))

#(define-markup-command
    (mytitle layout props) ; params
    () ; param types
    (interpret-markup layout props
     (let ((title    (chain-assoc-get 'header:title       props))
           (markedup (chain-assoc-get 'header:markuptitle props)))
      (if (boolean? markedup)
       (markup title)
       (markup markedup)
       ))))

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
        \smaller \bold \mysubtitle
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
