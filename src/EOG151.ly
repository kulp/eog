\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
}

\header{
  hymnnumber = "151"
  title = "“No Condemnation!” — Precious Word"
  tunename = "Barrow"
  meter = "C. M."
  poet = "R. Chapman"
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes2 | g4 aes bes2 ees | d4 c bes2
  c2 | bes4 aes g2 f4( ees) | f1
  bes2 | g4 aes bes2 ees | d4 c bes2
  g2 | bes4 aes g2 f2 | ees1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  g2 | ees4 f g2 ees | ees4 ees ees2
  ees4( f) | g f ees2 c | d1
  ees2 | ees4 f g2 g | f4 d ees2
  ees2 | ees4 f ees2 d | ees1

}
}

notesTenor = {
\global
\relative a {

  g2 | bes4 aes g2 c | bes4 aes g2
  c4( d) | ees bes bes2 a4( c) | bes1
  g2 | bes4 aes g2 bes | aes4 aes bes2
  bes2 | c4 c bes2 aes | bes1

}
}

notesBass = {
\global
\relative f {

  ees2 | ees4 ees ees2 ees | ees4 ees ees2
  aes2 | g4 d ees( d) c( f,) | bes1
  ees2 | ees4 ees ees2 ees | f4 f g2
  ees2 | aes,4 aes bes2 bes | ees1

}
}

wordsA = \lyricmode {
\set stanza = "1."

“No con -- dem -- na -- tion” –pre -- cious word! \bar "."
Con -- sid -- er it, my soul; \bar "."
Thy sins were all on Je -- sus laid; \bar "."
His stripes have made thee whole. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

In heaven the blood for -- ev -- er speaks
In God’s om -- nis -- cient ear;
The saints, as jew -- els on His heart,
Je -- sus doth ev -- er bear.

}

wordsC = \lyricmode {
\set stanza = "3."

“No con -- dem -- na -- tion” –O my soul,
’Tis God that speaks the word,
Per -- fect in come -- li -- ness art thou
In Christ, the ris -- en Lord.

}

wordsD = \lyricmode {
\set stanza = "4."

Teach me, O God, to fix mine eyes
On Christ, the spot -- less Lamb;
So shall I love Thy pre -- cious will
And glo -- ri -- fy His name.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
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
      \partcombine #'(2 . 9) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
