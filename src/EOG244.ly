\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  hymnnumber = "244"
  title = "One Priest Alone Can Pardon Me"
  tunename = ""
  meter = "P. M."
  poet = ""
  composer = "H. Bennett"
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  c4^\markup{\italic{Andante–legato.}} | bes8[ a] g[ f] a[ g] f[ e] | f4 \grace { g16[ f] } e8[ d] c4
  f4 | g a bes d | a2( g4)
  \eogbreak
  c4 | bes8[ a] g[ f] a[ g] f[ e] | f4 \grace { g16[ f] } e8[ d] c4
  f4 | g a c8[ bes] a[ g] | f2.
  \eogbreak
  f'4 | e d c e8[ d] | c4 bes \tb a\fermata \ta
  g4 | a bes c e8[ d] | a4 a8.[ g16] f4

  \bar "|."

}
}

notesAlto = {
\global
\override NoteHead.font-size = #-4
\relative e' {

  s4 | s1 | s2.
  c4 | d4 <f c>4 <g d>2 | << { f2( e4) } { r4 c r } >> % TODO original has d2
  c4 | d8[ c] bes[ a] c[ bes] a[ g] | a4 c8[ bes] a4
  c4 | d4 <f c>4 <g d> <e bes> | <c a>2. % TODO original has d2
  <a' f>4 | <a e> <bes f> f <bes f> | << { f4 e f } { c2 ~ c4 } >>
  <e c>4 | c8[ f] e[ d] <f c>4 <bes f>4 | f <e bes>4 a,

}
}

notesTenor = {
\global
\override NoteHead.font-size = #-4
\relative a {

  a4 | d8[ c] bes[ a] c[ bes] a[ g] | a4 c8[ bes] a4
  a4 | bes4 a g bes, | c2.
  r4 | f2 c | f2 ~ f4
  a4 | bes a g c, | f2.
  d'4 | c bes a bes | a g f
  c4 | f g a bes | <c a> c, f

}
}

notesBass = {
\global
\override NoteHead.font-size = #-4
\relative f {

  f4 | f2 c | f f4
  a,4 | bes a g bes, | c2.
  r4 | f2 c | f2 ~ f4
  a4 | bes a g c, | f2.
  d'4 | c bes a bes | a g f\fermata
  c4 | f g a bes | <f' c> c, f

}
}

wordsA = \lyricmode {
\set stanza = "1."

One Priest a -- lone can par -- don me, \bar "."
Or bid me “Go in peace,” \bar "."
Can breathe that word “Ab -- sol -- vo te” \bar "."
And make these heart -- throbs cease; \bar "."
My soul has heard His priest -- ly voice; \bar "."
It said, “I bore thy sins, re -- joice!” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

He showed the spear -- mark in His side,
The nail -- print on His palm:
Said, “Look on Me, the Cru -- ci -- fied;
Why trem -- ble thus? Be calm!
All pow’r is Mine– I set thee free–
Be not a -- fraid– ‘Ab -- sol -- vo te.’”

}

wordsC = \lyricmode {
\set stanza = "3."

By Him my soul is pu -- ri -- fied,
Once lep -- rous and de -- filed;
Cleansed by the wa -- ter and the blood,
God sees me as a child:
No priest can heal or cleanse but He;
No oth -- er say, “Ab -- sol -- vo te.”

}

wordsD = \lyricmode {
\set stanza = "4."

He robed me in a priest -- ly dress,
That I might in -- cense bring
Of prayer, and praise, and right -- eous -- ness,
To heav’n’s E -- ter -- nal King;
And when he gave this robe to me,
He smiled and said, “Ab -- sol -- vo te.”

}

wordsE = \markuplist {

\line { In heaven He stands before the throne, }
\line { The Great High Priest above, }
\line { “Melchisedec”– that One alone }
\line { Can sin’s dark stain remove; }
\line { To Him I look on bended knee, }
\line { And hear that sweet “Absolvo te.” }

}

wordsF = \markuplist {

\line { “A little while!” and He shall come }
\line { Forth from the inner shrine, }
\line { To call His pardoned brethren home: }
\line { O bliss supreme, divine! }
\line { When every blood-bought child shall see }
\line { The Priest who said, “Absolvo te.” }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
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

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
  \line{ \bold 6 \column { \wordsF } }
  \hspace #0.1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
