#(set! paper-alist (cons '("eogsized" . (cons (* 127 mm) (* 199 mm))) paper-alist))
#(set-paper-size "eogsized")
indent        = 0\cm
%top-margin    = 1\cm
%bottom-margin = 1\cm
ragged-bottom = ##f
ragged-last-bottom = ##f
%annotate-spacing = ##t
page-count = 1
print-page-number = ##f
print-first-page-number = ##f

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

bookTitleMarkup = \markup { }
oddHeaderMarkup = \markup { }
evenHeaderMarkup = \markup { }
