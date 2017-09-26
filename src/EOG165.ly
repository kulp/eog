\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-count = #(cond (is-eogsized 2) (#t #f))
  system-system-spacing.padding = 11
}

\header{
  hymnnumber = "165"
  title = "Jesus! How Much Thy Name Unfolds"
  tunename = "Belmont" % from Metrical Index of Tunes
  meter = "C. M."
  poet = ""
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=90
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d2 | b'1 a2 | g1 fis2 | fis( e) g | d1
  d'2 | d( c) b | b( a) g | g( fis)
  d2 | b'1 a2 | g1 fis2 | fis( e) g | d1
  d'2 | d( c) a | g( b) a | g1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 | g1 fis2 | g1 d2 | c1 c2 | b1
  d2 | g( fis) d | e1 e2 | d1
  d2 | d1 c2 b1 d2 | c1 c2 | d1
  f2 | e1 e2 | d( g) fis | g1

}
}

notesTenor = {
\global
\relative a {

  b2 | d1 c2 b1 b2 | g1 g2 | g1
  b2 | b( a) g | c1 a2 | b( a)
  fis2 | g1 fis2 g1 g2 | g1 g2 | b1
  g2 | g1 c2 | b( d) c | b1

}
}

notesBass = {
\global
\relative f {

  g2 | g1 d2 | e1 b2 | c1 e2 | g1
  g2 | g,( a) b | c1 cis2 | d1
  c2 | b1 d2 | e1 b2 | c1 e2 | g1
  b,2 | c1 c2 | d1 d2 | g1

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus! how much Thy name un -- folds \bar "."
To ev -- ery o -- pened ear; \bar "."
The par -- doned sin -- ner’s mem -- ory holds \bar "."
None oth -- er half so dear. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Thy name en -- cir -- cles ev -- ery grace
That God as man could show;
There on -- ly could He ful -- ly trace
A life di -- vine be -- low.

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus_– it speaks a life of love,
Of sor -- rows meek -- ly borne;
It tells of sym -- path -- y a -- bove,
What -- ev -- er makes us mourn.

}

wordsD = \markuplist {

\line { Jesus — the One who knew no sin, }
\line { { \hspace #2 } Made sin to make us just; }
\line { Thou gav’st Thyself our love to win — }
\line { { \hspace #2 } Our full confiding trust. }

}

wordsE = \markuplist {

\line { The mention of Thy name shall bow }
\line { { \hspace #2 } Our hearts to worship Thee; }
\line { The chiefest of ten thousand Thou, }
\line { { \hspace #2 } Whose love has set us free. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\markup { \column {
  \fill-line { \vcenter \column {
    \vspace #1
    \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
    \line{ \bold 5 \column { \wordsE } }
    \vspace #1
  } }
  \fill-line { \line { Alternate tune: No. 198. } }
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
