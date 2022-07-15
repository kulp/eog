\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "283"
  title = "What Cheering Words Are These!"
  tunename = "Cambridge"
  meter = "S. M."
  poet = "John Kent" % see https://hymnary.org/text/what_cheering_words_are_these
  composer = "Ralph Harrison" % see https://hymnary.org/tune/cambridge_harrison
  tagline = ##f
}

ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key a \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a2 | cis b4( a) | b2 a4( gis) | \tb a2\fermata \ta
  b2 | cis e | d cis | \tb b\fermata \ta \eogbreak
  e,2 | a a4( gis) | fis2 fis | b b4( a) | gis2
  e2 | fis d' cis b | \tb a\fermata \ta

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e2 | a e | fis e | e
  e2 | e a | gis a | gis
  d2 | e e | d cis | fis fis | e
  e2 | d fis | e e4( d) | cis2

}
}

notesTenor = {
\global
\relative a {

  cis2 | e e | d cis4( b) | cis2
  gis2 | a e' | e e | e
  gis,2 | a cis4( b) | a2 ais | b d4( cis) | b2
  a2 | a a | a gis | a

}
}

notesBass = {
\global
\relative f {

  a | a cis, | d e | a,_\fermata
  e'2 | a cis | b a | e_\fermata
  e4( d) | cis2 a | d fis4( e) | d2 b | e
  cis2 | d b | e e | a,_\fermata

}
}

wordsA = \lyricmode {
\set stanza = "1."

What cheer -- ing words are these! \bar "."
Their sweet -- ness who can tell? \bar "."
In time and to e -- ter -- nal days— \bar "."
\italicsOn “’Tis with be -- liev -- ers well!” \italicsOff \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

In ev -- ’ry state se -- cure,
Watched by the Sav -- iour’s eye,
’Tis well with them should life en -- dure,
And well if called to die.

}

wordsC = \lyricmode {
\set stanza = "3."

Well in af -- flic -- tion’s ways,
Or on the mount with God;
Well when they joy, and sing, and praise,
Or buf -- fet with the flood.

}

wordsD = \lyricmode {
\set stanza = "4."

’Tis well when joys a -- rise,
’Tis well when sor -- rows flow,
Or dark -- ness \italicsOn seems \italicsOff to veil the skies,
And strong temp -- ta -- tions grow.

}

wordsE = \markuplist {

\line { ’Tis well when on the mount }
\line { { \hspace #2 } They feast and joy in love, }
\line { And ’tis as well, in God’s account, }
\line { { \hspace #2 } When they the furnace prove. }

}

wordsF = \markuplist {

\line { But above all, how well }
\line { { \hspace #2 } When Jesus speaks the word, }
\line { And, at the trumpet’s sounding swell, }
\line { { \hspace #2 } They rise to meet their God! }

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

\noPageBreak

\markup { \fontsize #0.3 \fill-line { \column {
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } }
} } }

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
