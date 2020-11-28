\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  \include "override/override-EOG081.ily"
}

\header{
  %gospel
  hymnnumber = "81"
  title = "“It Is Finished!” Sinners, Hear It" % see https://hymnary.org/person/Kelly_Thomas
  tunename = "Regent Square" % see https://hymnary.org/tune/regent_square_smart
  meter = "8. 7. 8. 7. 8. 7."
  poet = "Thomas Kelly" % see https://hymnary.org/person/Kelly_Thomas
  composer = "Henry T. Smart" % see https://hymnary.org/tune/regent_square_smart
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=170 }
tb = { \tempo 4=85  }

patternAA = { c2 c2 c2 c2      | c2. c4 c2 c2 }
patternAB = { c2 c2 c2 c4( c4) | c2. c4 c2 c2 }

patternBA = { c2 c2 c2 c2      | c2  c2 c1 }
patternBB = { c2 c2 c2 c4( c4) | c2  c2 c1 }
patternBC = { c2 c2 c2 c4( c4) | c2. c4 c1 }
patternBD = { c2 c2 c4( c4) c2 | c2  c2 c1 }

patternCA = { c2. c4 c2 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g e c' g | e' d c g }
  \changePitch \patternBA { a a g c | g f e }
  \changePitch \patternAA { g e c' g | e' d c b }
  \changePitch \patternBB { c b a b c | b a g }
  \changePitch \patternCA { d' d b g | e' d c a }
  \changePitch \patternBA { f' e d c | c b c }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e c g' e | g g g g }
  \changePitch \patternBA { c, c c c | d b c }
  \changePitch \patternAB { e c g' g f | e f e e }
  \changePitch \patternBA { e e e e | g fis g }
  \changePitch \patternCA { g g g d | e e f f }
  \changePitch \patternBC { a g f e f | g f e }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c g g c | c b c c }
  \changePitch \patternBA { a c g a | g g g }
  \changePitch \patternAA { c c g g | c b a gis }
  \changePitch \patternBB { a gis e' d c | d c b }
  \changePitch \patternCA { b b d b | c bes a c }
  \changePitch \patternBD { d g, a b c | d d c }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { c c e c | g' f e e }
  \changePitch \patternBA { f f e a, | b g c }
  \changePitch \patternAB { c' g e e d | c d e e }
  \changePitch \patternBA { a e c a | d d g, }
  \changePitch \patternCA { g' g g g | c, c f f }
  \changePitch \patternBD { d e f g a | g g, c }

}
}

wordsA = \lyricmode {
\set stanza = "1."

“It is fin -- ished!” Sin -- ners, hear it, \bar "."
’Tis the dy -- ing Vic -- tor’s cry; \bar "." \eogbreak
“It is fin -- ished!” An -- gels, bear it, \bar "."
Bear the joy -- ful news on high! \bar "." \eogbreak
“It is fin -- ished!” “It is fin -- ished!” \bar "."
Tell it thro’ the earth and sky. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Hear the Lord Him -- self de -- clar -- ing
All per -- formed He came to do;
Sin -- ners, in your -- selves des -- pair -- ing,
This is joy -- ful news for you;
Je -- sus speaks it, Je -- sus speaks it—
His are faith -- ful words and true.

}

wordsC = \lyricmode {
\set stanza = "3."

“It is fin -- ished!” All is o -- ver;
Yes, the cup of wrath is drained;
Such the truth these words dis -- cov -- er,
Thus the vic -- tory was ob -- tained:
’Tis a vic -- tory, ’tis a vic -- tory,
None but Je -- sus could have gained.

}

wordsD = \lyricmode {
\set stanza = "4."

Crown the might -- y Con -- queror, crown Him,
Who His peo -- ple’s foes o’er -- came;
In the high -- est heaven en -- throne Him,
Men and an -- gels sound His fame!
Great His glo -- ry! Great His glo -- ry!
Je -- sus bears a match -- less name.

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
