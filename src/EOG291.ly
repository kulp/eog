\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG291.ily"
}

\header{
  hymnnumber = "291"
  title = "Glory, Glory Everlasting"
  tunename = "Dismissal" % see https://hymnary.org/tune/dismissal_viner
  meter = "8. 7. 8. 7. 8. 7." % original has 8. 7. 8. 7. 4. 7
  poet = "Thomas Kelly" % see https://hymnary.org/text/glory_glory_everlasting_be_to_him
  composer = "William L. Viner" % see https://hymnary.org/tune/dismissal_viner
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=140
  \key a \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a2 gis4( fis) e2 cis | fis a4( fis) e2 cis |
  cis'2 b4( a) fis2 b | a gis a1 |
  cis2 cis4( d) e2 cis | d b cis a |
  cis2 cis4( d) e2 cis | d cis b1 |
  a2 gis4( fis) e2 cis | fis a4( fis) e2 cis |
  cis'2 b4( a) fis2 b | a gis a1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  cis2 d cis cis | d d cis a |
  e' d4( e) d2 fis | e e e1 |
  e2 e e e | e e e cis |
  e2 e e e | e e e1 |
  cis2 e4( d) cis2 cis | d d cis a |
  e' d4( e) d2 fis | e e e1 |

}
}

notesTenor = {
\global
\relative a {

  e2 fis4( gis) a2 a | a a a a |
  a2 gis4( a) a2 d | d4( cis) e( d) cis1 |
  a2 a4( b) cis2 a | b gis a a |
  a2 a4( b) cis2 a | b a gis1 |
  a4( e) fis4( gis) a2 a | a a a a |
  a2 gis4( a) a2 d | d4( cis) e( d) cis1 |

}
}

notesBass = {
\global
\relative f, {

  a2 a a a | d fis a a, |
  a2 b4( cis) d2 b | e2 e a,1 |
  a'2 a a a | gis e a a, |
  a'2 a a a | gis a e1 |
  a,2 a a a | d fis a a, |
  a2 b4( cis) d2 b | e2 e a,1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Glo -- ry, glo -- ry ev -- er -- last -- ing \bar "."
Be to Him who bore the cross, \bar "."
Who re -- deemed our souls by tast -- ing \bar "."
Death, the death de -- served by us; \bar "."
Spread His glo -- ry, spread His glo -- ry, \bar "."
Who re -- deemed His peo -- ple thus. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

His is love: ’tis love un -- bound -- ed,
With -- out meas -- ure, with -- out end;
Hu -- man thought is here con -- found -- ed:
’Tis too vast to com -- pre -- hend!
Praise the Sav -- iour! Praise the Sav -- iour!
Mag -- ni -- fy the sin -- ner’s Friend!

}

wordsC = \lyricmode {
\set stanza = "3."

While we tell the won -- drous sto -- ry
Of the Sav -- iour’s cross and shame,
Sing we, “Ev -- er -- last -- ing glo -- ry
Be to God and to the Lamb!”
Hal -- le -- lu -- jah! Hal -- le -- lu -- jah!
Give ye glo -- ry to His name!

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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
