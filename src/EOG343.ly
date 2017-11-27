\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG343.ily"
}

\header{
  %children
  hymnnumber = "343"
  title = "Jesus Is Our Shepherd"
  tunename = "Broughton"
  meter = "6. 5. 6. 5. D."
  poet = "Hugh Stowell" % see https://hymnary.org/text/jesus_is_our_shepherd_wiping_every_tear
  composer = "Thomas Hastings" % see https://hymnary.org/tune/broughton_hastings
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key ees \major
  \autoBeamOff
}

patternA = { c4. c8 c c | c4 c2 | }
patternB = { c4. c8 c c | c2. | }
patternC = { c8 c c4 c | c2. | }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { bes bes aes g | g f }
  \changePitch \patternB { aes aes g f | g }
  \changePitch \patternA { bes bes c d | ees bes }
  \changePitch \patternC { bes aes g f | ees }

  \changePitch \patternA { d' d c bes | bes a }
  \changePitch \patternB { c c bes a | bes }
  \changePitch \patternA { bes bes c d | ees bes }
  \changePitch \patternC { ees, f g f | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { g g f ees | ees d }
  \changePitch \patternB { f f ees d | ees }
  \changePitch \patternA { g g aes aes | g g }
  \changePitch \patternC { g f ees d | ees }

  \changePitch \patternA { f f f f | f f }
  \changePitch \patternB { ees ees d c | d }
  \changePitch \patternA { g g aes aes | g g }
  \changePitch \patternC { ees ees ees d | ees }

}
}

notesTenor = {
\global
\relative a' {

  \changePitch \patternA { ees ees bes bes | bes bes }
  \changePitch \patternB { d bes bes bes | bes }
  \changePitch \patternA { ees ees ees bes | bes ees }
  \changePitch \patternC { ees c bes aes | g }

  \changePitch \patternA { bes bes ees d | d c }
  \changePitch \patternB { a a bes c | bes }
  \changePitch \patternA { ees ees ees bes | bes ees }
  \changePitch \patternC { bes c bes aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { ees ees d ees | bes bes }
  \changePitch \patternB { bes bes bes bes | ees }
  \changePitch \patternA { ees ees ees ees | ees ees }
  \changePitch \patternC { ees aes bes bes, | ees }

  \changePitch \patternA { bes' bes a bes | f f }
  \changePitch \patternB { f f f f | bes, }
  \changePitch \patternA { ees ees ees ees | ees ees }
  \changePitch \patternC { g aes bes bes, | ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus is our Shep -- herd, \bar "."
Wip -- ing ev -- ’ry tear; \bar "."
Fold -- ed in His bos -- om, \bar "."
What have we to fear? \bar "."
On -- ly let us fol -- low \bar "."
Whith -- er He doth lead, \bar "."
To the thirst -- y des -- ert, \bar "."
Or the dew -- y mead. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus is our Shep -- herd,
Well we know His voice!
How its gen -- tle whis -- per
Makes our heart re -- joice!
E -- ven when He chid -- eth,
Ten -- der is His tone;
None but He shall guide us,
We are His a -- lone.

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus is our Shep -- herd,
For the sheep He bled;
Ev -- ’ry lamb is sprin -- kled
With the blood He shed.
Then on each He set -- teth
His own se -- cret sign,
“They that have My Spir -- it,
These,” saith He, “are Mine.”

}

wordsD = \lyricmode {
\set stanza = "4."

Je -- sus is our Shep -- herd,
With His good -- ness now,
And His ten -- der mer -- cy,
He doth us en -- dow.
Let us sing His prais -- es
With a glad -- some heart,
Till in heaven we meet Him,
Nev -- er -- more to part.

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
