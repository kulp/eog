\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 11
}

\header{
  %children
  hymnnumber = "314"
  title = "Dear Children, Have You Ever Heard?"
  tunename = "Cambridge" % not the same as EOG283's Cambridge in S. M.
  meter = "C. M."
  poet = ""
  composer = "John Randall"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=130
  \key bes \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes2 d4 d | c2 bes | ees d | c1
  bes2 d4 ees8[ c] | bes2 a | bes1 \eogbreak
  bes2 d4 d | c2 bes | ees d | c2
  bes2 | c4 bes a g | f2 \eogbreak
  d'2 | ees4 d c bes | a
  c4 d ees8[ c] | bes2 a | bes1 \eogbreak

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 f4 f | ees2 d | g f | f1
  d2 g4 g | f2 ees | d1
  d2 f4 f | ees2 d | g f | f2
  bes2 | c4 bes a g | f2
  bes2 | c4 bes a g | f
  f4 f g | f2. ees4 | d1

}
}

notesTenor = {
\global
\relative a {

  bes2 bes4 bes | a2 bes | bes bes | a1
  bes2 bes4 bes8[ c] | d2 c | bes1
  bes2 bes4 bes | a2 bes | bes bes | a2
  bes2 | c4 bes a g | f2
  d'2 | ees4 d c bes | a
  a4 bes bes8[ c] | d2 c | bes1

}
}

notesBass = {
\global
\relative f, {

  bes2 bes'4 bes | f2 g | ees bes | f'1
  bes2 g4 ees | f2 f | bes,1
  bes2 bes'4 bes | f2 g | ees bes | f'2
  bes2 | c4 bes a g | f2
  bes2 | c4 bes a g | f
  f4 bes ees, | f2 f | bes,1

}
}

wordsA = \lyricmode {
\set stanza = "1."

Dear chil -- dren, have you ev -- er heard \bar "."
That Christ the Lord will come, \bar "."
With an -- gel’s voice and trump of God, \bar "."
%{HIDE>%} To call His peo -- ple home, %{<HIDE%} \bar "."
%{HIDE>%} To call His peo -- ple home, %{<HIDE%} \bar "."
To call His peo -- ple home? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The saints of God, from death set free,
With joy shall mount on high;
The heaven shall ring with prais -- es loud,
%{HIDE>%} They’ll meet Him in the sky, %{<HIDE%}
%{HIDE>%} They’ll meet Him in the sky, %{<HIDE%}
They’ll meet Him in the sky.

}

wordsC = \lyricmode {
\set stanza = "3."

Oh, say, if He should come to -- day,
Would you in ter -- ror be,
Or would you lift your heads with joy
%{HIDE>%} The bless -- ed Lord to see, %{<HIDE%}
%{HIDE>%} The bless -- ed Lord to see, %{<HIDE%}
The bless -- ed Lord to see?

}

wordsD = \lyricmode {
\set stanza = "4."

Oh, chil -- dren, seek the Sav -- iour now,
The Sav -- iour full of love;
And when He comes He’ll take you up
%{HIDE>%} To His bright home a -- bove, %{<HIDE%}
%{HIDE>%} To His bright home a -- bove, %{<HIDE%}
To His bright home a -- bove.

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
