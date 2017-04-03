#(set-default-paper-size "letter")
% TODO \override VerticalAxisGroup.minimum-Y-extent = #'(-1 . 4)
%#(set-global-staff-size 18)
italicsOn  = \override LyricText.font-shape = #'italic
italicsOff = \override LyricText.font-shape = #'upright

\include "inc/changePitch.ly"

mon  = { \set ignoreMelismata = ##t }
moff = { \unset ignoreMelismata }

eogbreak = { %{NOOP%} }
eogpagebreak = { %{NOOP%} }
