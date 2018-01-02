\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  systems-per-page = ##f
}

\header{
  %gospel
  hymnnumber = "36"
  title = "“Stricken, Smitten, and Afflicted”"
  tunename = "Austria" % see https://hymnary.org/tune/austrian_hymn_haydn
  meter = "8. 7. 8. 7. D."
  poet = "Thomas Kelly" % see https://hymnary.org/text/stricken_smitten_and_afflicted_see_him_d
  composer = "Franz Joseph Haydn"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=90 }
tb = { \tempo 2=45 }

patternAA = { c2. c4 c2 c2 | c2 c2 c4( c4) c2 }
patternAB = { c2. c4 c2 c2 | c2 c2 c2      c2 }

patternBA = { c2 c2 c2 c2 | c2 c4( c4) c1 }
patternBB = { c2 c2 c2 c2 | c2 c2      c1 }

patternCA = { c2 c2 c4( c4) c2 | c2 c2 c4( c4) c2      }
patternCB = { c2 c2 c2      c2 | c2 c2 c4( c4) c2      }
patternCC = { c2 c2 c2      c2 | c2 c2 c2      c4( c4) }

patternDA = { c2 c2      c2. c4 | c2 c2 c1 }
patternDB = { c2 c4( c4) c2. c4 | c2 c2 c1 }

patternEA = { c2. c4 c2 c2 | c2. c4 c4( c4) c2 }
patternEB = { c2. c4 c2 c2 | c2. c4 c2      c2 }

patternFA = { c2 c4( c4) c4( c4) c4( c4) | c2 c2 c1 }
patternFB = { c2 c2      c2      c2      | c2 c2 c1 }
patternFC = { c2 c2      c2      c4( c4) | c2 c2 c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { f g a g | bes a g e f }
  \changePitch \patternBA { d' c bes a | g a f c' }
  \changePitch \patternAA { f, g a g | bes a g e f }
  \changePitch \patternBA { d' c bes a | g a f c' }

  \changePitch \patternCA { g a g e c | bes' a g e c }
  \changePitch \patternDA { c' bes a a | b b c }
  \changePitch \patternEA { f e d c | d c c bes a }
  \changePitch \patternFA { g a bes c d bes g | f e f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { f f f e | g f e c c }
  \changePitch \patternBB { f f g f | d f e }
  \changePitch \patternAA { f f f e | g f e c c }
  \changePitch \patternBB { f f g f | d f e }

  \changePitch \patternCB { c c c c | g' f e c c }
  \changePitch \patternDB { c d e f f | f f e }
  \changePitch \patternEB { f f f f | f f g f }
  \changePitch \patternFB { e e f d | c c c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { a bes c c | c c c bes a }
  \changePitch \patternBB { bes c c c | d d c }
  \changePitch \patternAA { a bes c c | c c c bes a }
  \changePitch \patternBB { bes c c c | d d c }

  \changePitch \patternCA { e, f e g e | c' c c g e }
  \changePitch \patternDA { a g f d' | d d c }
  \changePitch \patternEB { c c bes a | bes c c c }
  \changePitch \patternFC { c c f, d' bes | a g a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { f f f c | e f c f }
  \changePitch \patternBB { bes a e f | bes, b c }
  \changePitch \patternAB { f f f c | e f c f }
  \changePitch \patternBB { bes a e f | bes, b c }

  \changePitch \patternCC { c c c c | e f c c bes }
  \changePitch \patternDB { a bes c d d | g g c, }
  \changePitch \patternEB { a' a bes f | bes a e f }
  \changePitch \patternFB { c bes a bes | c c f }

}
}

wordsA = \lyricmode {
\set stanza = "1."

“Strick -- en, smit -- ten and af -- flict -- ed,” \bar "."
See Him dy -- ing on the tree! \bar "."
’Tis the Christ by man re -- ject -- ed! \bar "."
Yes, my soul, ’tis He! ’tis He! \bar "."
Mark the sac -- ri -- fice ap -- point -- ed! \bar "."
See who bears the aw -- ful load! \bar "."
’Tis the Word, ’tis God’s A -- noint -- ed— \bar "."
Son of Man and Son of God. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Here we have a firm foun -- da -- tion;
Here’s the ref -- uge of the lost;
Christ’s the Rock of our sal -- va -- tion—
His the name of which we boast.
Lamb of God, for sin -- ners wound -- ed—
Sac -- ri -- fice to can -- cel guilt,
None shall ev -- er be con -- found -- ed
Who on Thee their hope have built.

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
