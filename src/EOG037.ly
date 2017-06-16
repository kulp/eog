\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  systems-per-page = ##f
}

\header{
  %gospel
  hymnnumber = "37"
  title = "Tell Me the Old, Old Story"
  tunename = ""
  meter = "7. 6. 7. 6. D. with Refrain"
  poet = "Miss Kate Hankey"
  composer = "W. H. Doane"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=32 }

patternAA = { \ta c4 c8. c16 c4 c4 | c2 c4 }
patternBA = { \ta c4 | c4 c4 c4 c8.[ c16] | c2. }
patternBB = { \ta c4 | c4 c4 c4 c8.[ c16] | c2( c4) }
patternBC = { \ta c4 | c4 c4 c4 c4        | c2( c4) }
patternBD = { \ta c4 | c4 c4 c4 c4        | c2.     }
patternCA = { \ta c4 | c4 c4 c8[ c8] c8[ c8] | c4( c4) \tb c4 }
patternCB = { \ta c4 | c4 c4 c4      c4      | c2      \tb c4 }
patternCC = { \ta c4 | c4 c4 c8[ c8] c8[ c8] | c4( c4) \tb c4 }
patternCD = { \ta c4 | c4 c4 c4      c4      | c2      \tb c4 }
patternDA = { \ta c4 | c4 c8[ c8] c4 c8[ c8] | c2. c4 }
patternDB = { \ta c4 | c4 c4      c4 c4      | c2. c4 }
patternEA = { \ta c8.[ c16] c8. c16 c4 c4 | c8.[ c16] c2 }
patternEB = { \ta c4        c8. c16 c4 c4 | c4        c2 }
patternFA = { \ta c4 | c8[ c8] c8[ c8] c4 c4 | c2. }
patternFB = { \ta c4 | c4      c4      c4 c4 | c2. }
patternGA = { \ta c4 c8. c16 c4 c4 | c2 c4 c4 }
patternGB = { \ta c4 c8. c16 c4 c4 | c2 c4 }
patternHA = { \ta c4 | c4 c4 c8[ c8] \tb c4 \ta | c2. c4 }
patternHB = { \ta c4 | c4 c4 c4      \tb c4 \ta | c2. c4 }
patternHC = { \ta c4 | c4 c4 c8[ c8] \tb c4 \ta | c2. c4 }
patternHD = { \ta c4 | c4 c4 c4      \tb c4 \ta | c2. c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { e e f g g | a g }
  \changePitch \patternBA { g | c c c e, fis | g }
  \changePitch \patternCA { g | c c c b a g | a b c\fermata }
  \changePitch \patternDA { a | g f e d g f | e r }

  \changePitch \patternEA { d c d e f f | e f g }
  \changePitch \patternFA { g | fis g a b c fis, | g }
  \changePitch \patternCA { g | c c c b a g | a b c\fermata }
  \changePitch \patternDA { a | g f e d g f | e r }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternGA { e e f g g | a g r } >>
  \changePitch \patternGA { b b c d d | d c r }
  \changePitch \patternGB { e e d c c | c a }
  \changePitch \patternHA { a | g c b c d\fermata | c r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c c d e e | f e }
  \changePitch \patternBB { e | e e e c dis | e d! }
  \changePitch \patternCC { f! | e e e g f e | f g a }
  \changePitch \patternDA { f | e d c b e d | c r }

  \changePitch \patternEA { b a b c d d | c d e }
  \changePitch \patternFB { e | d d fis d | d }
  \changePitch \patternCC { f | e e e g f e | f g a }
  \changePitch \patternDA { f | e d c b e d | c r }

  \changePitch \patternGA { c c d e e | f e r }
  \changePitch \patternGA { f f e f f | f e r }
  \changePitch \patternGB { g g f e g | f f }
  \changePitch \patternHC { f | e e d e f | e r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g g g c c | c c }
  \changePitch \patternBC { c a a a a | c b }
  \changePitch \patternCD { g | g g g c | c c }
  \changePitch \patternDB { c | c g g g | g r }

  \changePitch \patternEB { g g g g g | g c }
  \changePitch \patternFA { c a b c b a c | b }
  \changePitch \patternCD { g | g g g c | c c }
  \changePitch \patternDB { c | c g g g | g r }

  \changePitch \patternGA { g g g c c | c c r }
  \changePitch \patternGA { d d c b b | b c r }
  \changePitch \patternGB { c c g g bes | a c }
  \changePitch \patternHD { c | c g g g | g r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { c c c c c | c c }
  \changePitch \patternBD { c | a' a a a | g }
  \changePitch \patternCB { g | c, c c c | f f_\fermata }
  \changePitch \patternDB { f | g g g, g | c r }

  \changePitch \patternEB { g g g g g | c c }
  \changePitch \patternFB { c | d d d d | g, }
  \changePitch \patternCB { g' | c, c c c | f f_\fermata }
  \changePitch \patternDB { f | g g g, g | c r }

  \changePitch \patternGA { c c c c c | f c r }
  \changePitch \patternGA { g' g g g g | g c, r }
  \changePitch \patternGB { c c c c c | f f }
  \changePitch \patternHB { f | g g g g,_\fermata | c r }

}
}

Refrain = \lyricmode {

Tell me the Old, Old Sto -- ry, \bar "."
Tell me the Old, Old Sto -- ry, \bar "."
Tell me the Old, Old Sto -- ry \bar "."
Of Je -- sus and His love. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Tell me the Old, Old Sto -- ry, \bar "."
Of un -- seen things a -- bove, \bar "."
Of Je -- sus and His glo -- ry, \bar "."
Of Je -- sus and His love. \bar "."
Tell me the Sto -- ry sim -- ply, \bar "."
As to a lit -- tle child, \bar "."
For I am weak and wear -- y, \bar "."
And help -- less and de -- filed. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Tell me the Sto -- ry slow -- ly,
That I may take it in–
That won -- der -- ful re -- demp -- tion,
God’s rem -- e -- dy for sin.
Tell me the Sto -- ry oft -- en,
For I for -- get so soon:
The “ear -- ly dew” of morn -- ing
Has passed a -- way at noon.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Tell me the same Old Sto -- ry,
When you have cause to fear
That this world’s emp -- ty glo -- ry
Is cost -- ing me too dear.
And when { \italicsOn } that { \italicsOff } world’s bright glo -- ry
Is dawn -- ing on my soul,
Tell me the Old, Old Sto -- ry–
Christ Je -- sus makes thee whole.

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
