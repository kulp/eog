\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  hymnnumber = "379"
  title = "O My Saviour Crucified"
  tunename = "Last Hope" % aka "Mercy" ; see https://hymnary.org/tune/mercy_gottschalk
  meter = "7. 7. 7. 7."
  poet = "Robert C. Chapman" % see https://hymnary.org/text/o_my_savior_crucified_near_thy_cross_wou-1
  composer = "Louis Moreau Gottschalk" % see https://hymnary.org/tune/mercy_gottschalk
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key bes \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f2^\markup{\italic Slowly.} g4 | f( bes) d | d2 c4 | bes2. |
  bes2 bes4 | bes( a) bes | c2 d8.[ c16] | c2. |
  f,2 g4 | f( bes) d | d2 ees8.[ d16] | d2. |
  bes4( a) g| f( ees') d | d2 c4 | bes2. |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 cis4 | d( f) f | f2 ees4 | d2. |
  d2 e4 | f( ees) d | e2 e4 | f2. |
  d2 cis4 | d( f) f | fis2 fis4 | g2. |
  cis,2 cis4 | d( ees) f | f2 ees4 | d2. |

}
}

notesTenor = {
\global
\relative a {

  bes4( f) e | f( d') bes | a2 a4 | bes2. |
  bes2 c4 | d( c) bes | bes2 bes4 | a2. |
  bes4( f) e | f( d') bes | a2 c4 | bes2. |
  g4( a) bes | bes ~ bes bes | a2 a4 | bes2. |

}
}

notesBass = {
\global
\relative f, {

  bes2 bes4 | bes2 bes4 | f'2 f4 | bes,2. |
  g'2 g4 | f2 g4 | g2 c,4 | f2. |
  bes,2 bes4 | bes2 bes4 | d2 d4 | g2. |
  e2 e4 | f4( g) f | f2 f4 | bes,2. |

}
}

wordsA = \lyricmode {
\set stanza = "1."

O my Sav -- iour cru -- ci -- fied, \bar "."
Near Thy cross would I a -- bide, \bar "."
Gaz -- ing with a -- dor -- ing eye \bar "."
On Thy dy -- ing ag -- o -- ny. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus bruised and put to shame,
Tells the glo -- ries of God’s name;
Ho -- ly judg -- ment there I found,
Grace did there o’er sin a -- bound.

}

wordsC = \lyricmode {
\set stanza = "3."

God is love, I sure -- ly know,
In the Sav -- iour’s depth of woe,
In the Sin -- less, in God’s sight,
Sin is just -- ly brought to light.

}

wordsD = \lyricmode {
\set stanza = "4."

In His spot -- less soul’s dis -- tress,
I have learned my guilt -- i -- ness;
Oh, how vile my low es -- tate,
Since my ran -- som was so great!

}

wordsE = \markuplist {

\line { Rent the veil that closed the way }
\line { To my home of heavenly day, }
\line { In the flesh of Christ the Lord, }
\line { Ever be His name adored! }

}

wordsF = \markuplist {

\line { Yet in sight of Calvary, }
\line { Contrite should my spirit be, }
\line { Rest and holiness there find }
\line { Fashioned like my Saviour’s mind. }

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

\markup { \fontsize #0.3 \column {
  \fill-line { \vcenter \column {
    \vspace #1
    \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
    \line{ \bold 6 \column { \wordsF } }
    \vspace #1
  } }
} }

\markup { \fill-line { \line { Alternate tune: No. 7 in Supplement. } } }

\markup {
  \center-column {
    \vspace #1
    \override #'(span-factor . 1/2)
    \fill-line { \null \draw-hline \null }
  }
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
