\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "152"
  title = "Brightness of the Eternal Glory"
  tunename = "Hamilton"
  meter = "8. 7. 8. 7."
  poet = "R. Robinson"
  composer = "Anon."
  %copyright = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes2. bes4 bes bes c bes | bes1 aes |
  aes2. g4 f g aes bes | g1 ~ g |
  ees'2. d4 c bes aes g | f1 c' |
  bes2. c4 bes bes c d | ees2.( d4 c1) |
  bes2. c4 bes bes aes d, | ees\breve

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g2. g4 g g aes g | g1 f |
  f2. ees4 d ees f g | ees1 ~ ees |
  g2. g4 g f e e | f1 f2( d) |
  ees2. ees4 ees ees ees f | ees2.( ees4  ees1) |
  g2. aes4 g g f bes, | bes\breve

}
}

notesTenor = {
\global
\relative a {

  bes2. bes4 bes bes ees ees | d1 d |
  bes2. bes4 bes bes bes bes | bes1 ~ bes |
  ees2. f4 ees des c c | c1 d |
  bes2. aes4 bes bes beses aes | g2( c4 bes aes1) |
  bes2. ees4 des des c aes | g\breve

}
}

notesBass = {
\global
\relative f {

  ees2. ees4 ees ees ees ees | bes'1 bes |
  bes2. bes4 bes bes bes, bes | ees1 ~ ees |
  c2. c4 c c c bes | aes1 aes' |
  g2. aes4 g g ges f | c2.( g'4 aes1) |
  ees2. ees4 ees e f bes, | ees\breve

}
}

wordsA = \lyricmode {
\set stanza = "1."

Bright -- ness of th’e -- ter -- nal glo -- ry, \bar "."
Shall Thy praise un -- ut -- tered lie?__ \bar "."
Who would hush the heaven- sent sto -- ry__ \bar "."
%{HIDE>%}Of the Lamb who came to die,__ \bar "." %{<HIDE%}
Of the Lamb who came to die. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Came from God -- head’s ful -- lest glo -- ry
Down to Cal -- vary’s depth of woe,__
Now on high we bow be -- fore Thee;__
%{HIDE>%}Streams of prais -- es cease -- less flow.__ %{<HIDE%}
Streams of prais -- es cease -- less flow.__

}

wordsC = \lyricmode {
\set stanza = "3."

Sing His blest tri -- umph -- ant ris -- ing;
Sing Him on the Fa -- ther’s throne;
Sing– till heav’n and earth sur -- pris -- ing,__
%{HIDE>%}Reigns the Na -- za -- rene a -- lone.__ %{<HIDE%}
Reigns the Na -- za -- rene a -- lone.__

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak \markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 2 in Supplement. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
