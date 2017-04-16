\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  hymnnumber = "229"
  title = "It Passeth Knowledge"
  tunename = ""
  meter = "10. 10. 10. 4."
  poet = "Mary Shekleton"
  composer = "Ira D. Sankey"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key c \major
  \partial 8
  \autoBeamOff
}

patternA = { c8 | c4. c8 c4 c | c8 c c c c4. }
patternB = { c8 | c4 c c4. c8 | c c c c c4. }
patternC = { c8 | c4. c8 c c c c | c4 c c4. }
patternD = { c8 | c4. c8 c4. c8 | c4. c8 c c c }
patternE = { c8 | c2 c2 | c2.. }

notesSoprano = {
\global
\relative c'' {

  g8 | c4. c8 b4 a | a8 g fis g e4.
  g8 | g4 d e4. f8 | a g fis g e4.
  g8 | c4. c8 d c b a | a4 c g4.
  g8 | c4. c8 d4. d8 | e4. e8 f e d
  c8 | c2 b2 | c2..

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { e | e e g f | f e dis e c }
  \changePitch \patternB { e | b b c d | f e dis e c }
  \changePitch \patternC { e | e g b a g f | f f e }
  \changePitch \patternD { e | e e g g | g g g g a }
  a8 | g2 g4( f) e2..

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { c | c c c c | c c a g g }
  \changePitch \patternB { g | g g g g | g g a g g }
  \changePitch \patternC { c | c c c c c c | c c c }
  \changePitch \patternD { c | g g b b | c c d c c }
  \changePitch \patternE { d | e d | c }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { c | c c c c | c c c c c }
  \changePitch \patternB { c | g g g g | c c c c c }
  \changePitch \patternC { c | c e f f f f | f a c }
  \changePitch \patternD { c, | c c g' g | c c b c f, }
  \changePitch \patternE { fis | g g | c, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

It pass -- eth know -- ledge! that dear love of Thine, \bar "."
My Je -- sus! Sav -- iour! yet this soul of mine \bar "."
Would of Thy love in all its breadth and length, \bar "."
Its height, and depth, and ev -- er -- last -- ing strength, \bar "."
Know more and more. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

It pass -- eth \italicsOn tell -- ing! \italicsOff that dear love of Thine,
My Je -- sus! Sav -- iour! yet these lips of mine
Would fain pro -- claim to sin -- ners far and near
A love which can re -- move all guilt -- y fear,
And love be -- get.

}

wordsC = \lyricmode {
\set stanza = "3."

It pass -- eth \italicsOn prais -- es! \italicsOff that dear love of Thine,
My Je -- sus! Sav -- iour! yet this heart of mine
Would sing a love so rich– so full– so free,
Which brought a reb -- el sin -- ner, such as me,
Nigh un -- to God.

}

wordsD = \markuplist {

\line { But though I cannot tell or sing or know }
\line { The fullness of Thy love while here below, }
\line { My empty vessel I may freely bring– }
\line { O Thou who art of love the living spring, }
\line { My vessel fill. }

}

wordsE = \markuplist {

\line { I \italic am an empty vessel– scarce one thought }
\line { Or look of love to Thee I’ve ever brought; }
\line { Yet I \italic may come, and come again, to Thee }
\line { With this, the needy children’s only plea– }
% `\italic { }` would get stripped in getlyrics
\line { \italic “Thou \italic lovest \italic me!” }

}

wordsF = \markuplist {

\line { O fill me, Jesus, Saviour, with Thy love; }
\line { Lead, lead me to the living fount above! }
\line { Thither may I in simple faith draw nigh, }
\line { And never to another fountain fly, }
\line { But unto Thee. }

}

wordsG = \markuplist {

\line { And Jesus, when Thee face to face I see, }
\line { When on Thy lofty throne I sit with Thee; }
\line { Then of Thy love in all its breadth and length, }
\line { Its height and depth, its everlasting strength }
\line { My soul shall sing. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
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

\markup { \fill-line {
  \hspace #0.1
  \column {
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } }
  }
  \hspace #0.1
  \column {
  \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
  \line{ \bold 7 \column { \wordsG } }
  }
  \hspace #0.1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
