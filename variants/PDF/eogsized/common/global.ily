#(set-global-staff-size 13)
italicsOn  = \override LyricText.font-shape = #'italic
italicsOff = \override LyricText.font-shape = #'upright

\include "inc/changePitch.ly"

mon  = { \set ignoreMelismata = ##t }
moff = { \unset ignoreMelismata }

svgbreak = { %{NOOP%} }
eogbreak = { \break }
eogpagebreak = \pageBreak

onlyEogMusic = #(define-music-function (notes)
                                       (ly:music?)
"Include this music expression only if laying up for the EOG lookalike."
  notes
)

#(define-markup-command
    (onlyEogMarkup layout props mup-yes mup-no) ; params
    (markup? markup?) ; param types
    (interpret-markup layout props mup-yes))

