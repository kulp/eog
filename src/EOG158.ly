\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "158"
  title = "Come, Let Us Sing the Matchless Worth"
  tunename = "Sussex"
  meter = "8. 8. 6. D."
  poet = "S. Medley"
  composer = "Anon."
  %copyright = ""
  tagline = ##f
}

ta = { \tempo 2=90 }
tb = { \tempo 2=45 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes2 | c bes bes aes | aes g \tb g \fermata \ta
  bes2 | c bes ees d | d c \tb bes \fermata \ta
  bes2 | bes bes aes aes | g1.
  g2 | f c' bes g | f c' \tb bes \fermata \ta
  bes2 | c bes ees d | d c \tb bes \fermata \ta
  bes2 | bes bes aes aes | g1.
  g2 | f1 aes | g1.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g2 | aes g g f | f ees ees
  g2 | aes g g g | bes aes g
  ees2 | ees ees ees d | ees1.
  ees2 | ees ees ees ees | ees ees4 d ees2
  ees2 | ees ees ees f | g ees d
  d2 | ees e f d | ees1.
  ees2 | ees1 f | ees1.

}
}

notesTenor = {
\global
\relative a {

  bes2 | c bes bes bes | bes bes bes
  bes2 | c bes bes bes | g aes bes
  g2 | g bes c aes | bes1.
  bes2 | c aes bes bes | c aes bes
  bes2 | a bes c b | c a bes
  bes2 | bes bes c c | c1.
  bes2 | c1 d | bes1.

}
}

notesBass = {
\global
\relative f {

  ees2 | ees ees ees ees | ees ees ees \fermata
  ees2 | ees ees ees ees | ees ees ees \fermata
  ees2 | ees g f f | ees1.
  ees2 | aes f g g | aes f g \fermata
  g2 | fis g c, d | ees f bes \fermata
  g2 | g g f f | c1.
  g2 | aes1 bes | ees1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

Come let us sing the match -- less worth, \bar "."
And sweet -- ly sound the glo -- ries forth \bar "."
Which in the Sav -- iour shine: \bar "."
To God and Christ our prais -- es bring: \bar "."
The song with which high heaven will ring, \bar "."
Prais -- es for grace di -- vine. \bar "."
%{HIDE>%} For grace di -- vine. %{<HIDE%}

}

wordsB = \lyricmode {
\set stanza = "2."

How rich the pre -- cious blood He spilt,
Our ran -- som from the dread -- ful guilt
Of sin a -- gainst our God;
How per -- fect is the right -- eous -- ness,
In which un -- spot -- ted, beaut -- eous dress
His saints have ev -- er stood!
%{HIDE>%} Have ev -- er stood! %{<HIDE%}

}

wordsC = \lyricmode {
\set stanza = "3."

How rich the char -- act -- er He bears,
And all the form of love He wears,
Ex -- alt -- ed on the throne;
In songs of sweet, un -- tir -- ing love,
We e’er would sing His per -- fect ways,
And make His glo -- ries known.
%{HIDE>%} His glo -- ries known. %{<HIDE%}

}

wordsD = \lyricmode {
\set stanza = "4."

And soon that hap -- py day shall come,
When we shall reach our des -- tined home,
And see Him face to face;
Then with our Sav -- iour, Lord, and Friend,
The one un -- bro -- ken day we’ll spend
In sing -- ing still His grace.
%{HIDE>%} Still His _ grace. %{<HIDE%}

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
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

\noPageBreak

\markup { \fill-line { \raise #5 \line { Alternate tune: No. 321. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
