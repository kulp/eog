\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  \include "override/override-EOG251.ily"
}

\header{
  hymnnumber = "251"
  title = "O Lord, How Does Thy Mercy Throw"
  tunename = "Shining Shore"
  meter = "8. 7. 8. 7. D. Iambic"
  poet = "William E. Littlewood" % see http://www.stempublishing.com/hymns/biographies/bagstaff.html
  composer = "George F. Root" % see https://hymnary.org/tune/shining_city_root
 tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c4 | c8 c8 c4 c4 | c8 c8 c4 }
patternAB = { c4 | c8 c8 c4 c4 | c4 c4 }

patternBA = { c4 | c4. c8 c8 c8 | c4 c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d | d g g a | b g a }
  \changePitch \patternBA { b | d b a g | e g }
  \changePitch \patternAA { e | d g g a | b g a }
  \changePitch \patternBA { b | d b a g | a g }

  \changePitch \patternAA { b | d b d e | d b a }
  \changePitch \patternAB { b | d b e d | b a }
  \changePitch \patternAA { d, | d g g a | b g a }
  \changePitch \patternBA { b | d b a g | a g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d | d d d fis | g g fis }
  \changePitch \patternBA { g | g g d d | c e }
  \changePitch \patternAA { c | d d d fis | g g fis }
  \changePitch \patternBA { g | g g d d | d d }

  \changePitch \patternAA { g | g g g g | g g fis }
  \changePitch \patternAB { g | g g g g | g fis }
  \changePitch \patternAA { d | d d d fis | g g fis }
  \changePitch \patternBA { g | g g d d | d d }

}
}

notesTenor = {
\global
\relative a, {

  \changePitch \patternAA { d | g b d d | d d d }
  \changePitch \patternBA { d | d d c b | c c }
  \changePitch \patternAA { g | g b d d | d d d }
  \changePitch \patternBA { d | d d c b | c b }

  \changePitch \patternAA { g | b g b c | b d d }
  \changePitch \patternAB { d | b g c b | d d }
  \changePitch \patternAA { d, | g b d d | d d d }
  \changePitch \patternBA { d | d d c b | c b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { d | b g b d | g b, d }
  \changePitch \patternBA { g | b g fis g | c, c }
  \changePitch \patternAA { c | b g b d | g b, d }
  \changePitch \patternBA { g | b g fis g | d g }

  \changePitch \patternAA { g | g g g g | g g d }
  \changePitch \patternAB { g | g g g g | d d }
  \changePitch \patternAA { d | b g b d | g b, d }
  \changePitch \patternBA { g | b g fis g | d g }

}
}

wordsA = \lyricmode {
\set stanza = "1."

O Lord, how does Thy mer -- cy throw \bar "."
Its guar -- dian shad -- ow o’er us, \bar "." \eogbreak
Pre -- serv -- ing while we’re here be -- low, \bar "."
Safe to the rest be -- fore us! \bar "." \eogbreak
As weak -- er than a bruis -- ed reed, \bar "."
We can -- not do with -- out Thee; \bar "." \eogbreak
We want Thee here each hour of need, \bar "."
Shall want Thee, too, in glo -- ry. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

And though our ef -- forts now to praise
Are oft -- en cold and low -- ly,
A no -- bler, sweet -- er song we’ll raise,
With all Thy saints, in glo -- ry.
We’ll lay our tro -- phies at Thy feet,
We’ll wor -- ship and a -- dore Thee,
Whose pre -- cious blood has made us meet
To dwell with Thee in glo -- ry.

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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
