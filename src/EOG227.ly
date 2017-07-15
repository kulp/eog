\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "227"
  title = "I Was a Wandering Sheep"
  tunename = "Lebanon"
  meter = "S. M. D."
  poet = "H. Bonar"
  composer = "J. Zundel"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  c8 | f4 f8 f[ e] f | g4. ~ g4
  c,8 | g'4 g8 g[ f] g | a4. ~ a4 \eogbreak
  c,8 | a'4 a8 a4 a8 | a8[ bes] c c4
  bes8 | a4 a8 a4 g8 | f4. ~ f4 \eogbreak
  c8 | g'4 g8 g[ f] g | a4. ~ a4
  c,8 | a'4 a8 a[ g] a | bes4. ~ bes4 \eogbreak
  c,8 | a'4 a8 a4 a8 | a8[ bes] c c4
  bes8 | a4 a8 a4 g8 | f4. ~ f4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c8 | c4 c8 c4 f8 | e4. ~ e4
  c8 | e4 e8 e[ d] e | f4. ~ f4
  c8 | f4 f8 f4 f8 | f[ g] a a4
  g8 | f4 f8 e4 e8 | f4. ~ f4
  c8 | e4 e8 e[ d] e | f4. ~ f4
  c8 | f4 f8 f[ e] f | e4. ~ e4
  c8 | f4 f8 f4 f8 | f[ g] a a4
  g8 | f4 f8 e4 e8 | f4. ~ f4

}
}

notesTenor = {
\global
\relative a {

  a8 | a4 a8 a4 a8 | c4. ~ c4
  c8 | c4 c8 c4 c8 | c4. ~ c4
  a8 | c4 c8 c4 c8 | c4 c8 c4
  d8 | c4 c8 c4 bes8 | a4. ~ a4
  c8 | c4 c8 c4 c8 | c4. ~ c4
  c8 | c4 c8 c8[ bes] a | g4. ~ g4
  c8 | c4 c8 c4 c8 | c4 c8 c4
  d8 | c4 c8 c4 bes8 | a4. ~ a4

}
}

notesBass = {
\global
\relative f {

  f8 | f4 f8 f4 f8 | c4. ~ c4
  c8 | c4 c8 c4 c8 | f4. ~ f4
  f8 | f4 f8 f4 f8 | f4 f8 f4
  bes,8 | c4 c8 c4 c8 | f4. ~ f4
  c8 | c4 c8 c4 c8 | c4. ~ c4
  c8 | c4 c8 c4 c8 | c4. ~ c4
  c8 | f4 f8 f4 f8 | f4 f8 f4
  bes,8 | c4 c8 c4 c8 | f4. ~ f4

}
}

wordsA = \lyricmode {
\set stanza = "1."

I was a wan -- d’ring sheep, \bar "."
I did not love the fold; \bar "."
I did not love my Shep -- herd’s voice, \bar "."
I would not be con -- trolled: \bar "."
I was a way -- ward child, \bar "."
I did not love my home, \bar "."
I did not love my Fa -- ther’s voice, \bar "."
I loved a -- far to roam. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The Shep -- herd sought His sheep,
The Fa -- ther sought His child;
They fol -- lowed me o’er vale and hill,
O’er des -- erts waste and wild;
They found me nigh to death,
Fam -- ished, and faint, and lone;
They bound me with the bands of love,
They saved the wan -- d’ring one.

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus my Shep -- herd is,
’Twas He that loved my soul;
’Twas He that washed me in His blood,
’Twas He that made me whole:
’Twas He that sought the lost,
That found the wan -- d’ring sheep;
’Twas He that bro’t me to the fold,
’Tis He that still doth keep.

}

wordsD = \lyricmode {
\set stanza = "4."

I was a wan -- d’ring sheep,
I would not be con -- trolled,
But now I love my Sav -- iour’s voice,
I love, I love the fold.
I was a way -- ward child,
I once pre -- ferred to roam;
But now I love my Fa -- ther’s voice,
I love, I love His home.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
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
      \partcombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
