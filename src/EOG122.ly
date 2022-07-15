\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "122"
  title = "The Holy Lamb Has Died"
  tunename = "So nimm denn meine Hände" % see https://hymnary.org/tune/so_nimm_denn_meine_hande_silcher
  meter = "6. 6. 8. 4. D." % original has P. M.
  poet = "George W. Frazer"
  composer = "Friedrich Silcher" % see https://hymnary.org/tune/so_nimm_denn_meine_hande_silcher
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

patternAA = { c4 | c4 c4      c4 c4 | c4. }
patternAB = { c4 | c4 c4      c4 c4 | c4. c8 c4 }
patternAC = { c4 | c4 c8[ c8] c4 c4 | c4. c8 c4 }

patternBA = { c8 c4 c4 | c2  c2 | c2 c4 }
patternBB = {       c4 | c2  c2 | c2 c4 }
patternBC = { c8 c4 c4 | c2. c4 | c2 c4 }
patternBD = {       c4 | c4( c2) c4 | c2 c4 }
patternBE = {       c4 | c2. c4 | c2 c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered % original has `c`
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

  \changePitch \patternAA { c | d c bes a | a }
  \changePitch \patternBA { g g a | bes c | a r }
  \changePitch \patternAB { c | d c bes a | a g g }
  \changePitch \patternBB { a | bes c | a r }

  \changePitch \patternAA { a | g c b d | c }
  \changePitch \patternBA { d e f | e d | c r }
  \changePitch \patternAC { c | f e d c c | d c c }
  \changePitch \patternBD { bes | a bes g | f r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { f | f f g f | f }
  \changePitch \patternBA { e e f | g g | f r }
  \changePitch \patternAB { f | f f g f | f e e }
  \changePitch \patternBB { f | g g | f r }

  \changePitch \patternAA { f | g g g g | g }
  \changePitch \patternBA { g g a | g f | e r }
  \changePitch \patternAB { e | f f f f | f f f }
  \changePitch \patternBD { g | f g e | f r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { a | bes c c c | c }
  \changePitch \patternBA { c c c | d c | c r }
  \changePitch \patternAB { a | bes c c c | c c c }
  \changePitch \patternBB { c | d c | c r }

  \changePitch \patternAA { c | c e d b | c }
  \changePitch \patternBC { b c c | c b | c r }
  \changePitch \patternAB { c | c bes a c | bes a a }
  \changePitch \patternBE { d | c bes a r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f | bes a e f | c }
  \changePitch \patternBA { c c a' | g e | f r }
  \changePitch \patternAB { f | bes a e f | c c c }
  \changePitch \patternBB { a' | g e | f r }

  \changePitch \patternAA { f | e c g' f | e }
  \changePitch \patternBA { d c f | g g, | c r }
  \changePitch \patternAB { bes'! | a bes f a | bes f f }
  \changePitch \patternBB { bes, | c c | f r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

The ho -- ly Lamb has died, \bar "."
A vic -- tim on the tree, \bar "." \eogbreak
For sin -- ners He was cru -- ci -- fied, \bar "."
To set them free; \bar "." \eogbreak
He bore the right -- eous stroke \bar "."
Of God’s right hand of pow’r, \bar "." \eogbreak
O’er Him the waves and bil -- lows broke, \bar "."
In that dark hour. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Our sins were on Him laid,
He bowed be -- neath the load,
By Him the might -- y debt was paid—
The debt we owed;
Now see Him on the throne
Who once on Cal -- v’ry bled,
The One who did for guilt a -- tone,
O’er all as Head.

}

wordsC = \lyricmode {
\set stanza = "3."

The Fa -- ther runs to meet
His lost and guilt -- y son;
The robe, the ring, the san -- daled feet,
Tell what He’s done;
“The fat -- ted calf bring here,
’Tis meet we mer -- ry be,
My son far off, is now brought near—
Re -- joice with Me.”

}

wordsD = \lyricmode {
\set stanza = "4."

Come, guilt -- y sin -- ner, come,
Why wilt thou still de -- lay?
With -- in the Fa -- ther’s house there’s room,
Christ is the way;
The Fa -- ther’s kiss still waits,
For thee His heart doth mourn,
And o -- pen wide are thrown the gates,
Re -- turn! re -- turn!

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
