\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "153"
  title = "Jesus! Life-Giving Sound"
  tunename = "Lenox"
  meter = "6. 6. 6. 6. 8. 8."
  poet = "C. Wesley"
  composer = "Lewis Edson"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  %\override Staff.TimeSignature.style = #'numbered % original uses 'c' instead of 4/4 here, unusually
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=88
  \key bes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes4 | bes bes f g | f2.
  f4 | bes c d c | bes2.
  bes4 | d f d bes | c2.
  c4 | d bes c a | bes2.
  f4 | bes bes bes f | g g g
  bes | c c c d | bes bes bes
  f | g g g bes | c2 a | bes2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d4 | d d f ees | c2.
  d4 | d f f ees | d2.
  d4 | f f f f | f2.
  f4 | f g g f | f2.
  f4 | d d d f | ees ees ees
  d | f f f f | d d d
  f | ees ees ees f | g2 f | f2.

}
}

notesTenor = {
\global
\relative a {

  f4 | f f bes bes | a2.
  a4 | g a bes a | bes2.
  bes4 | bes c bes bes | a2.
  a4 | bes bes ees c | d2.
  f,4 | f f f bes | bes bes bes
  bes | a a a bes | bes bes bes
  bes | bes bes bes bes | ees2 c | d2.

}
}

notesBass = {
\global
\relative f, {

  bes4 | bes bes d ees | f2.
  d4 | g f bes f | bes,2.
  bes4 | bes' a bes d, | f2.
  f4 | bes g ees f | bes,2.
  f'4 | bes, bes bes d | ees ees ees
  bes | f' f f d | g g g
  d | ees ees ees d | c2 f | bes,2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus! life -- giv -- ing sound, \bar "."
The joy of earth and heaven; \bar "." \eogpagebreak
No oth -- er help is found, \bar "."
No oth -- er name is giv’n, \bar "." \break
In which the sons of men can boast, \bar "."
%{HIDE>%}But His who seeks and saves the lost, \bar "." %{<HIDE%}
But His who seeks and saves the lost. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

His name the sin -- ner hears,
And is from guilt set free;
’Tis mu -- sic in his ears,
’Tis life and vic -- to -- ry:
His heart o’er -- flows with sa -- cred joy,
%{HIDE>%}And songs of praise his lips em -- ploy, %{<HIDE%}
And songs of praise his lips em -- ploy.

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus! all praise a -- bove:
We sing Thy bless -- ed name,
We sing Thy dy -- ing love,
Thy ris -- ing power pro -- claim:
But soon, to give Thee worth -- y praise,
%{HIDE>%}Both heaven and earth their songs shall raise, %{<HIDE%}
Both heaven and earth their songs shall raise.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
