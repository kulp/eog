% These paper settings were derived from the PDF/eogsized version.
% Paper length is set to a grossly-long 400mm, and is trimmed later.
% The point of a long page is to ensure that everything fits on one.
#(set! paper-alist (cons '("online" . (cons (* 127 mm) (* 400 mm))) paper-alist))
#(set-paper-size "online")
indent        = 0\cm
ragged-bottom = ##t
ragged-last-bottom = ##t
print-page-number = ##f
print-first-page-number = ##f
page-count = 1

#(define-markup-command
    (mysubtitle layout props) ; params
    () ; param types
    (interpret-markup layout props
     (let ((tune (chain-assoc-get 'header:tunename props))
           (meter (chain-assoc-get 'header:meter props)))
      (if (string-null? tune)
       (if (string-null? meter)
        (markup "")
        (markup (#:concat ( "(" meter ")")))
       )
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
        \lower #2.0 \fromproperty #'header:poet
        \raise #0.7 \smaller \bold \mysubtitle
        \lower #2.0 \fromproperty #'header:composer
      }
    }
  }
}

bookTitleMarkup = \markup { }
oddHeaderMarkup = \markup { }
