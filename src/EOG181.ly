\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "181"
  title = "O Head Once Full of Bruises"
  tunename = "St. Christopher"
  meter = "7. 6. 7. 6. D."
  poet = "St. Bernard, tr. by John Gambold"
  composer = "F. C. Maker"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key des \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  aes2 | aes2. aes4 g2 bes | aes1 f2
  des2 | ees2. f4 ges2 ges | f1.
  f2 | des'2. des4 des2 c | bes( aes) ges
  f2 | ees2. ees4 e2 e | f1.
  f2 | f2. ees4 des2 ees | f( ges) aes
  aes2 | bes2. bes4 bes2 f | ges1.
  ges2 | c2. bes4 aes2 ges | f1 aes2
  ges2 | f2. des4 f2 ees | des1.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f2 | f2. f4 e2 e | f1 des2
  des2 | c2. des4 des2 c | des1.
  ees2 | des2. des4 des2 ees | f1 ees2
  des!2 | des2. des4 des2 bes | c1.
  des2 | des2. c4 des2 des | des1 des2
  des2 | des2. des4 d2 d | ees1.
  ees2 | ges2. ges4 ges2 c, | des1 des2
  des2 | des2. des4 c2 c | des1.

}
}

notesTenor = {
\global
\relative a {

  aes2 | aes2. aes4 bes2 g | aes1 aes2
  aes2 | aes2. aes4 bes2 aes | aes1.
  a2 | bes2. bes4 bes2 a | bes1 bes2
  bes2 | bes2. bes4 bes2 bes | a1.
  aes!2 | aes2. ges4 f2 ges | aes( bes) ces
  ces!2 | bes2. bes4 bes2 bes | bes1.
  bes2 | ees2. des4 c2 aes | aes1 ces2
  bes2 | aes2. f4 aes2 ges | f1.

}
}

notesBass = {
\global
\relative f {

  des2 | des2. des4 des2 des | des1 des2
  f2 | ges2. f4 ees2 aes, | des1.
  c2 | bes2. bes4 bes2 c | des( d) ees
  f2 | ges2. ges4 ges2 ges | f1.
  des2 | des2. des4 des2 des | des1 des2
  f2 | ges2. ges4 f2 bes,2 | ees1.
  ees2 | aes,2. aes4 aes2 aes | des1 f,2
  ges2 | aes2. aes4 aes2 aes | des1.

}
}

wordsA = \lyricmode {
\set stanza = "1."

O Head once full of bruis -- es, \bar "."
So full of pain and scorn, \bar "."
’Mid oth -- er sore a -- bus -- es, \bar "."
Mocked with a crown of thorn; \bar "."
O Head e’en now sur -- round -- ed \bar "."
With bright -- est ma -- jes -- ty, \bar "."
In death once bowed and wound -- ed \bar "."
On the ac -- curs -- ed tree: \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Thou Coun -- te -- nance tran -- scend -- ent!
Thou life -- cre -- at -- ing Sun!
To worlds on Thee de -- pend -- ent–
Yet bruised and spit up -- on:
O Lord, what Thee tor -- ment -- ed
Was our sins’ heav -- y load,
We had the debt aug -- ment -- ed
Which Thou didst pay in blood.

}

wordsC = \lyricmode {
\set stanza = "3."

We give Thee thanks un -- feign -- ed,
O Sav -- iour, Friend in need,
For what Thy soul sus -- tain -- ed
When Thou for us dist bleed.
Grant us to lean un -- sha -- ken
Up -- on Thy faith -- ful -- ness,
Un -- til to glo -- ry ta -- ken,
We see Thee face to face.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
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

\noPageBreak \markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 82. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
