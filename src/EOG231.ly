\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG231.ily"
}

\header{
  hymnnumber = "231"
  title = "Jesus, That Name Is Love"
  tunename = "Oak"
  meter = "6. 4. 6. 4. 6. 6. 6. 4."
  poet = "James G. Deck" % see https://hymnary.org/text/jesus_thy_name_i_love
  composer = "Lowell Mason" % see https://hymnary.org/tune/oak_mason
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key f \major
  \autoBeamOff
}

patternA = { c2 c4 c | c4. c8 c2 }
patternB = { c2 c4 c | c1 }
patternC = { c2 c4 c | c c8[ c] c2 }
patternD = { c2 c4 c | c c4 c2 }

notesSoprano = {
\global
\relative c' {

  f2 f4 g | a4. g8 f2
  g2 f4 e | f1
  f2 f4 g | a4. g8 f2
  g2 f4 e | f1

  c'2 d4 c | c bes8[ a] bes2
  \changePitch \patternC { bes c bes | bes a g a }
  \changePitch \patternA { d bes d | c a c }
  \changePitch \patternB { f, g e | f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { f f f | f e f }
  \changePitch \patternB { d c c | c }
  \changePitch \patternA { f f e | f e f }
  \changePitch \patternB { d c c | c }

  \changePitch \patternC { f f f | f e f e }
  \changePitch \patternC { e e e | e f g f }
  \changePitch \patternA { f f f | f f f }
  \changePitch \patternB { c d c | c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a a bes | c bes a }
  \changePitch \patternB { bes a g | a }
  \changePitch \patternA { a a c | c bes a }
  \changePitch \patternB { bes a g | a }

  \changePitch \patternD { c bes c | c c c }
  \changePitch \patternD { c c c | c c c }
  \changePitch \patternA { bes bes bes | a c a }
  \changePitch \patternB { a bes g | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { f f f | f f f }
  \changePitch \patternB { bes, c c | f }
  \changePitch \patternA { f d c | f c d }
  \changePitch \patternB { bes c c | f }

  \changePitch \patternC { a bes a | a g f g }
  \changePitch \patternC { g a g | g f e f }
  \changePitch \patternA { bes, d bes | f' f f }
  \changePitch \patternB { c bes c | f }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus, that name is love, \bar "."
Je -- sus our Lord! \bar "."
Je -- sus, all names a -- bove, \bar "."
Je -- sus our Lord! \bar "."
Thou, Lord, our all must be, \bar "."
Noth -- ing that’s good have we, \bar "."
Noth -- ing a -- part from Thee, \bar "."
Je -- sus our Lord! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

As Son of Man it was,
Je -- sus our Lord!
Thou gav’st Thy life for us,
Je -- sus our Lord!
Great was in -- deed Thy love,
All oth -- er loves a -- bove;
Love Thou didst dear -- ly prove,
Je -- sus our Lord!

}

wordsC = \lyricmode {
\set stanza = "3."

Right -- eous a -- lone in Thee,
Je -- sus our Lord!
Thou wilt a ref -- uge be,
Je -- sus our Lord!
Whom then have we to fear,
What troub -- le, grief or care,
Since Thou art ev -- er near,
Je -- sus our Lord!

}

wordsD = \lyricmode {
\set stanza = "4."

Soon Thou wilt come a -- gain,
Je -- sus our Lord!
We shall be hap -- py then,
Je -- sus our Lord!
When Thine own face we see,
Then shall we like Thee be,
Then ev -- er -- more with Thee,
Je -- sus our Lord!

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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
