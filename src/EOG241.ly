\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "241"
  title = "More Than Tongue Can Tell"
  tunename = ""
  meter = "8. 8. 8. 6. with Refrain"
  poet = "J. E. Hall"
  composer = "J. E. Hall"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key g \major
  \partial 4
  \autoBeamOff
}

patternA = { c4 | c4. c8 c c c8. c16 | c2. }
patternE = { c4 | c4. c8 c c c8. c16 | c8. c16 c8. c16 c4 }
patternB = { c4 | c4. c8 c c c c | c2. }
patternC = { c4 | c4. c8 c c c8. c16 | c4( c c) }
patternD = { c4 | c4. c8 c4 c | c2. }

notesSoprano = {
\global
\relative c' {

  d4 | g4. a8 b d, e8. c'16 | b2.
  b4 | d4. e8 d g, b a | a2.
  d,4 | g4. a8 b d, g8. a16 | b4( c d)
  e4 | d4. c8 b4 a | g2.

  \eogbreak

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternA { g | b c b a g fis | e } >>
  \changePitch \patternA { e | g a b c d b | a }
  d,4 | g4. a8 b d, g8. a16 | b4( c d)
  e4 | d4. c8 b4 a | g2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d | d d d d c e | d }
  \changePitch \patternB { g | g g g g g e | fis }
  \changePitch \patternC { d | d d d d d fis | g( fis g) }
  \changePitch \patternD { g | g fis g d | d }

  \changePitch \patternE { d | g g g fis e dis | e c c c c }
  \changePitch \patternE { e | d d g g g d | d d d d d }
  \changePitch \patternC { d | d d d d d fis | g( fis g) }
  \changePitch \patternD { g | g fis g d | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { b | b c d b c g | g }
  \changePitch \patternB { g | b c b b cis cis | d }
  \changePitch \patternC { b | b c d b d d | d c b }
  \changePitch \patternD { g | b a d c | b }

  \changePitch \patternE { b d e d c b a | g g g g g }
  \changePitch \patternE { c | b c d a b g | fis fis fis fis fis }
  \changePitch \patternC { b | b c d b d d | d c b }
  \changePitch \patternD { g | b a d c | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { g | g g g g c, c | g' }
  \changePitch \patternB { g | g g g g e a | d, }
  \changePitch \patternC { g | g d g, g b d | g, a b }
  \changePitch \patternD { c | d d d d | g, }

  \changePitch \patternE { g' | g g g d e b | c c c c c }
  \changePitch \patternE { c | g g g g g b | d d d d d }
  \changePitch \patternC { g | g d g, g b d | g, a b }
  \changePitch \patternD { c | d d d d | g, }

}
}

Refrain = \lyricmode {

His love is more than tongue can tell! \bar "."
His love is more than tongue can tell! \bar "."
The love that Je -- sus had for me,__ \bar "."
Is more than tongue can tell! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

The love that Je -- sus had for me, \bar "."
To suf -- fer on the cru -- el tree, \bar "."
That I a ran -- somed soul might be,__ \bar "."
Is more than tongue can tell! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The bit -- ter sor -- row that He bore,
And O, the crown of thorns He wore,
That I might live for -- ev -- er -- more,__
Is more than tongue can tell!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

The peace I have in Him, my Lord,
Who pleads be -- fore the throne of God
The mer -- it of His pre -- cious blood,__
Is more than tongue can tell!

}

wordsD = \lyricmode {
\set stanza = "4."

The joy that comes when he is near,
The rest He gives, so free from fear,
The hope in Him, so bright and clear,__
Is more than tongue can tell!

}

underWords = \lyricmode {

\repeat unfold 38 \skip 4
than tongue can tell!
\repeat unfold 8 \skip 4
than tongue can tell!

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
      \context Lyrics = three \with { alignAboveContext = men } \lyricsto tenors \underWords
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
