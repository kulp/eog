\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "202"
  title = "How Blest A Home!"
  tunename = "Prospect"
  meter = "C. M. D."
  poet = "Mrs. J. A. Trench"
  composer = "Old English Melody"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 8=120
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g8 g g aes4 aes8 | bes8[ aes] g f[ g]
  aes8 | bes[ ees,] aes g4 f8 | ees4. ~ ees4 r8
  g8 g g aes4 aes8 | bes8[ aes] g f[ g]
  aes8 | bes[ ees,] aes g4 f8 | ees4. ~ ees8 r8
  bes'8 | bes[ g] bes ees4 bes8 | bes8[ g] bes bes4
  bes8 | c4 bes8 bes[ aes] g | g4.( f4) r8
  g8 g g aes4 aes8 | bes8[ aes] g f[ g]
  aes8 | bes[ ees,] aes g4 f8 | ees4. ~ ees4 r8

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees8 ees ees ees4 d8 | d8[ d] ees f[ ees]
  d8 | ees4 ees8 ees8[ c] d | ees4. ~ ees4 r8
  ees8 ees ees ees4 d8 | ees8[ d] ees f[ ees]
  d8 | ees4 ees8 ees8[ c] d | ees4. ~ ees8 r8
  g8 | g[ ees] f g4 f8 | g8[ ees] f g[ f]
  ees8 | ees[ f] g f4 ees8 | ees8([ d c] d4) r8
  ees8 ees ees ees4 d8 | ees8[ d] des c[ e]
  f8 | ees4 ees8 ees8[ c] d | ees4. ~ ees8 r8

}
}

notesTenor = {
\global
\relative a {

  bes8 bes bes bes4 bes8 | bes4 bes8 bes4
  bes8 | bes4 c8 bes4 aes8 | g4. ~ g4 r8
  bes8 bes bes bes4 bes8 | bes4 bes8 bes4
  bes8 | bes4 c8 bes4 aes8 | g4. ~ g8 r8
  bes8 | bes4 bes8 bes[ c] d | ees[ bes] bes bes4
  ees8 | ees[ d] ees bes4 bes8 | bes4. ~ bes4 r8
  bes8 bes bes bes4 bes8 | bes4 bes8 c4
  c8 | g4 c8 bes4 aes8 | g4. ~ g4 r8

}
}

notesBass = {
\global
\relative f {

  ees8 ees ees f4 f8 | g[ f] ees d[ ees]
  f8 | g4 aes8 bes4 bes,8 | ees4. ~ ees4 r8
  ees8 ees ees f4 f8 | g[ f] ees d[ ees]
  f8 | g4 aes8 bes4 bes,8 | ees4. ~ ees8 r8
  ees8 | ees4 d8 ees4 ees8 | ees4 d8 ees[ f]
  g8 | aes4 g8 d4 ees8 | bes4. ~ bes4 r8
  ees8 ees ees f4 f8 | g[ f] ees aes[ g]
  f8 | bes,4 bes8 bes4 bes8 | ees4. ~ ees4 r8

}
}

wordsA = \lyricmode {
\set stanza = "1."

How blest a home! The Fa -- ther’s house! \bar "."
There love di -- vine doth rest; \bar "."
What else could sat -- is -- fy the hearts \bar "."
Of those in Je -- sus blest? \bar "."
His home made ours– His Fa -- ther’s love \bar "."
Our heart’s full por -- tion giv’n, \bar "."
The por -- tion of the First -- born Son, \bar "."
The full de -- light of heav’n. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

O, what a home! The Son who knows,
He on -- ly– all His love;
And brings us as His well -- be -- loved,
To that bright rest a -- bove,
Dwells in His bos -- om– know -- eth all
That in that bos -- om lies,
And came to earth to make it known,
That we might share His joys.

}

wordsC = \lyricmode {
\set stanza = "3."

O, what a home! There full -- est love
Flows thro’ its courts of light;
The Son’s di -- vine af -- fec -- tions flow
Thro’ -- out its depth and height.
And full re -- sponse the Fa -- ther gives,
To fill with joy the heart–
No cloud is there to dim the scene,
Or shad -- ow to im -- part.

}

wordsD = \lyricmode {
\set stanza = "4."

O, what a home! But such His love
That He must bring us there,
To fill that home, to be with Him,
And all His glo -- ry share.
The Fa -- ther’s house, the Fa -- ther’s heart,
All that the Son is giv’n
Made ours– the ob -- jects of His love
And He, our joy in heav’n.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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
