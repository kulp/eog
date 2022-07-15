\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "257"
  title = "Our Times Are in Thy Hand"
  tunename = "Dennis" % from Metrical Index of Tunes
  meter = "S. M." % from Metrical Index of Tunes
  poet = "William F. Lloyd" % see https://hymnary.org/text/my_times_are_in_thy_hand_my_god_i_wish
  composer = "Johann G. Nägeli, arr. by Lowell Mason" % see https://hymnary.org/tune/dennis_nageli
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a4 | a( f) a | g( e) g | f2
  f4 | f( d) f | f( c) f | e2 \eogbreak
  g4 | g( e) g | f( a) c | c( g) bes | a( c)
  d4 | c( a) bes | a( f) g | f2 \eogbreak

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f4 | f( c) f | e( c) c | c2
  c4 | d( bes) d | c( a) c | c2
  e4 | e( c) e | f2 f4 | e2 g4 | f2
  f4 | f2 f4 | f( c) c | c2

}
}

notesTenor = {
\global
\relative a {

  c4 | c( a) c | c( g) bes | a2
  a4 | bes( f) bes | a( f) a | g2
  c4 | c( g) bes | a( c) a | g( c) c | c( a)
  bes4 | a( c) d | c( a) bes | a2

}
}

notesBass = {
\global
\relative f {

  f4 | f2 f4 | c2 c4 | f2
  f4 | bes2 bes4 | f2 f4 | c2
  c4 | c2 c4 | f2 f4 | c2 c4 | f2
  f4 | f2 bes,4 | c2 c4 | f2

}
}

wordsA = \lyricmode {
\set stanza = "1."

Our times are in Thy hand; \bar "."
Fa -- ther, we wish them there, \bar "."
Our life, our soul, our all we leave \bar "."
En -- tire -- ly to Thy care. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Our times are in Thy hand,
What -- ev -- er they may be,
Pleas -- ing or pain -- ful, dark or bright,
As best may seem to Thee.

}

wordsC = \lyricmode {
\set stanza = "3."

Our times are in Thy hand:
Why should we doubt or fear?
A Fa -- ther’s hand will nev -- er cause
His child a need -- less tear.

}

wordsD = \lyricmode {
\set stanza = "4."

Our times are in Thy hand,
Je -- sus the Cru -- ci -- fied!
The hand our man -- y sins had pierced
Is now our Guard and Guide.

}

wordsE = \markuplist {

\line { Our times are in Thy hand, }
\line { { \hspace #2 } Jesus the Advocate! }
\line { Nor can that hand be stretched in vain }
\line { { \hspace #2 } For us to supplicate. }

}

wordsF = \markuplist {

\line { Our times are in Thy hand; }
\line { { \hspace #2 } We’d always trust in Thee, }
\line { Till we have left this weary land, }
\line { { \hspace #2 } And all Thy glory see. }

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
