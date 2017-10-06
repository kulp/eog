\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG278.ily"
}

\header{
  hymnnumber = "278"
  title = "We Hear the Words of Love"
  tunename = "St. Thomas"
  meter = "S. M."
  poet = "I. Watts"
  composer = "G. F. Handel, A. Williams" % http://hymnary.org/tune/st_thomas_williams
  tagline = ##f
}

ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

% music copied from EOG150 with minor variations

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d2 | g g b a4( g) | a2
  b4( c) | d2 c4( b) c2 b | \tb a2\fermata \ta \eogbreak
  d2 | b g a d, | g b d2.
  d4 | e2 d4( c) b2 a | \tb g2\fermata \ta

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 | d d d d4( cis) | d2
  d2 | d4( g) e8([ fis] g4) | e( fis) g2 | fis2
  d2 | d d d d | d e fis2.
  g4 | g2 g g fis | g2

}
}

notesTenor = {
\global
\relative a, {

  d2 | g b g a | fis2
  d'2 | b c4( d) c2 d | d2
  a2 | g g fis a | b g a2.
  d4 | c2 d4( e) d2 c | b2

}
}

notesBass = {
\global
\relative f {

  d2 | b g g' fis4( e) | d2
  g4( a) | b2 a4( g) a2 g | d2_\fermata
  fis2 | g b, d fis | g e d2.
  b4 | c2 b4( c) d2 d | g,2_\fermata

}
}

wordsA = \lyricmode {
\set stanza = "1."

We hear the words of love, \bar "."
We gaze up -- on the blood, \bar "."
We see the might -- y sac -- ri -- fice, \bar "."
And we have peace with God. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

’Tis ev -- er -- last -- ing peace!
Sure as Je -- ho -- vah’s name;
’Tis sta -- ble as His stead -- fast throne,
For -- ev -- er -- more the same.

}

wordsC = \lyricmode {
\set stanza = "3."

Our love is oft -- times low,
Our joy still ebbs and flows;
But peace with Him re -- mains the same:
No change Je -- ho -- vah knows.

}

wordsD = \lyricmode {
\set stanza = "4."

We change_– He chang -- es not;
Our Christ can nev -- er die:
His love, not ours, the rest -- ing -- place,
We on His truth re -- ly.

}

wordsE = \lyricmode {
\set stanza = "5."

The cross still stands un -- changed,
Tho’ heaven is now His home;
The might -- y stone is rolled a -- way,
But yon -- der is His tomb!

}

wordsF = \markuplist {

\line { { \hspace #2 } And yonder is our peace, }
\line { { \hspace #2 } The grave of all our woes; }
\line { We know the Son of God has come, }
\line { { \hspace #2 } We know He died and rose. }

}

wordsG = \markuplist {

\line { { \hspace #2 } We know He liveth now }
\line { { \hspace #2 } At God’s right hand above; }
\line { We know the throne on which He sits, }
\line { { \hspace #2 } We know His truth and love! }

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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

\markup { \fill-line { \column {
  \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
  \line{ \bold 7 \column { \wordsG } }
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
