\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "O, Turn Ye! O, Turn Ye!"
  subsubtitle = "(Hiding In Thee. 11’s with Refrain.)"
  %meter = "11’s with Refrain"
  poet = "J. Hopkins"
  composer = "Ira D. Sankey"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=100 }
tb = { \tempo 4=50  }

% original document for this song often shows quavers where crotchets belong
patternAA = { c4 | c2 c4 c4 | c2 c4 c4 | c4( c4) c4 c4 | c2. }
patternAB = { c4 | c2 c4 c4 | c2 c4 c4 | c2      c4 c4 | c2. }

patternBA = \patternAB
patternBB = { c4 | c2 c4 c4 | c2 c4 c4 | c2    c4. c8 | c2. } % inlined last rest

patternCA = { c2 c4. c8 | c2. r4 | c2 c4. c8 | c2. }

patternDA = { c4 | c2 c4. c8 | c2 c4 c4      | c2 c4. c8 | c2. }
patternDB = { c4 | c2 c4. c8 | c2 c4 c8[ c8] | c2 c4. c8 | c2. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
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

  \changePitch \patternAA { c | c bes a | a g f | f e d e | f }
  \changePitch \patternBA { f | bes a d | c a f | g a b! | c }
  \changePitch \patternAA { c | c bes a | a g f | f e d e | f }
  \changePitch \patternBB { f | bes a d | c a f | a a g | f r4 }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternCA { g g a | bes | a a bes | c } >>
  \changePitch \patternDA { c | f e d | c a f | a a g | f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { f | f f f | f c c | bes d c | c }
  \changePitch \patternBA { f | f f f | f f f | e f f | e }
  \changePitch \patternAB { e | f f f | f c c | bes d c | c }
  \changePitch \patternBB { f | f f f | f f f | f e e | f r4 }

  \changePitch \patternCA { e e f | g | f f f | f }
  \changePitch \patternDA { a | a c bes | a f f | f e e | f }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { a | a d c | c bes a | g bes bes | a }
  \changePitch \patternBA { a | d c bes | a c c | c c g | g }
  \changePitch \patternAB { bes! | a d c | c bes a | g bes bes | a }
  \changePitch \patternBB { a | d c bes | a f a | c c bes | a r4 }

  \changePitch \patternCA { c c c | c | c c g | a }
  \changePitch \patternDB { c | c c f | f c a b! | c bes bes | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { f | f f f | f f f c c c | f }
  \changePitch \patternBA { f | f f f | f f a, | c f d | c }
  \changePitch \patternAB { c | f f f | f f f | c c c | f }
  \changePitch \patternBB { f | f f f | f f d | c c c | f r4 }

  \changePitch \patternCA { c c c | c | f f f | f }
  \changePitch \patternDB { f | f f f | f f f d | c c c | f }

}
}

Refrain = \lyricmode {

Come while you may! come while you may! \bar "."
Take God’s free sal -- va -- tion, ’tis of -- fered to -- day! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

O turn ye! O turn ye! for why will ye die, \bar "."
When God, in great mer -- cy, is com -- ing so nigh? \bar "."
Now Je -- sus in -- vites you; the Spir -- it says “Come,” \bar "."
And an -- gels are wait -- ing to wel -- come you home. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

How vain the de -- lu -- sion, that while you de -- lay
Your hearts may grow bet -- ter by stay -- ing a -- way;
Come wretch -- ed, come star -- ving, come hap -- py to be,
While streams of sal -- va -- tion are flow -- ing so free.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

O, how can we leave you? Why will ye not come?
’Tis Je -- sus en -- treats you, He bids you come home;
O turn ye! O turn ye! for why will ye die,
When God in great mer -- cy, is com -- ing so nigh?

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

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond