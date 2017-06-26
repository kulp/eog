\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "267"
  title = "There Is a Better World Above"
  tunename = "Better World"
  meter = "8. 6. 8. 6. 8. 8. 8. 6."
  poet = "John Lyth"
  composer = ""
  tagline = ##f
}

ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees8[ g] | bes4 bes | bes ees8[ d] | c4 ees | bes2 |
  bes4. aes8 | g2 | aes4. g8 | f4 \eogbreak
  ees8[ g] | bes4 bes | bes ees8[ d] | c4 ees | bes2 |
  bes4. bes8 | c2 | d4. d8 | \tb ees4\fermata \ta \eogbreak

  ees8[ d] | c4 c | c d8[ c] | bes4 bes | bes
  c8[ bes] | aes4 aes | aes bes8[ aes] | g4 g | g \eogbreak
  ees8[ g] | bes4 bes | bes ees8[ d] | c4 ees | bes2 |
  bes4. bes8 | c2 | d4. d8 | \tb ees4\fermata \ta

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4 | ees d | ees ees | ees ees | ees2 |
  f4. d8 | ees2 | d4. ees8 | d4
  ees4 | ees d | ees ees | ees ees | ees2 |
  g4. g8 | aes2 | f4. f8 | g4

  ees4 | ees e | f f | f d | ees
  e4 | f f | f d | ees f | ees
  ees4 | f d | ees ees | ees ees | ees2 |
  g4. g8 | aes2 | f4. f8 | g4

}
}

notesTenor = {
\global
\relative a {

  g8[ bes] | g4 aes | g bes | aes aes | g2 |
  bes4. bes8 | bes2 | bes4. bes8 | bes4
  g8[ bes] | g4 aes | g bes | aes aes | g2 |
  ees'4. ees8 | ees2 | bes4. bes8 | bes4

  bes4 | aes bes | aes aes | aes aes | g
  c4 | c c | bes bes | bes b | c
  c4 | bes aes | g bes | aes aes | g2
  ees'4. ees8 | ees2 | bes4. bes8 | bes4

}
}

notesBass = {
\global
\relative f {

  ees4 | ees f | ees g | aes c, | ees2 |
  d4. bes8 | ees2 | f4. ees8 | bes4
  ees4 | ees f | ees g | aes c, | ees2 |
  ees4. ees8 | aes2 | bes4. bes,8 | ees4_\fermata

  g4 aes g | d d | d bes | ees
  c4 | f ees | d bes | ees d | c
  c4 | d bes | ees g | aes c, | ees2 |
  ees4. ees8 | aes2 | bes4. bes,8 | ees4_\fermata

}
}

wordsA = \lyricmode {
\set stanza = "1."

There is a bet -- ter world a -- bove, \bar "."
Oh, so bright! oh, so bright! \bar "."
Where all is peace, and joy, and love, \bar "."
Oh, so bright! oh, so bright! \bar "."
And all are free from ev -- ’ry care, \bar "."
And an -- gels of the Lord are there, \bar "."
And harps of God, and man -- sions fair, \bar "."
Oh, so bright! oh, so bright! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

No clouds e’er pass a -- long its sky,
Hap -- py land! hap -- py land!
No tear -- drops glis -- ten in the eye,
Hap -- py land! hap -- py land!
They drink the gush -- ing streams of grace,
And gaze up -- on the Sav -- iour’s face,
Whose bright -- ness fills the ho -- ly place,
Hap -- py land! hap -- py land!

}

wordsC = \lyricmode {
\set stanza = "3."

But tho’ we’re sin -- ners ev -- ’ry one,
Je -- sus died, Je -- sus died;
And tho’ for -- lorn, con -- demned, un -- done,
Je -- sus died, Je -- sus died;
All may be cleansed from ev -- ’ry stain,
All may be crowned with bliss a -- gain,
And in that land of pleas -- ure reign,
Je -- sus died, Je -- sus died.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
