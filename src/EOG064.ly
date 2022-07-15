\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "64"
  title = "“Call Them In” — The Poor, the Wretched"
  tunename = "Lower Lights" % see https://hymnary.org/tune/brightly_beams_our_fathers_mercy_bliss
  meter = "8. 7. 8. 7. D."
  poet = "Anna Shipton" % see https://hymnary.org/text/call_them_in_the_poor_the_wretched
  composer = "Philip P. Bliss"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=78 }
tb = { \tempo 4=39 }

patternAA = { c8. c16 | c4. c8 c8 c8 | c8 c4. }

patternBA = { c8. c16 | c4. c8 c8 c8 | c2 }
patternBB = { c8. c16 | c4. c8 c8 c8 | c4( c4) }
patternBC = { c8. c16 | c8 c8 c4. c8 | c2 }

patternCA = { c8. c16 | c4. c8 c8. c16 | c8 c4. }

patternDA = { c8. c16 | c4. c8 c8. c16 | c2 }
patternDB = { c8. c16 | c4. c8 c8. c16 | c4( c4) }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key bes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { f g | f d' c bes | a g }
  \changePitch \patternBA { g g | c bes a bes | c }
  \changePitch \patternAA { f, g | f bes c d | ees g, }
  \changePitch \patternBC { bes c | d bes c a | bes }

  \changePitch \patternCA { bes bes | ees ees ees ees | ees d }
  \changePitch \patternDA { d d | d c g c | c }
  \changePitch \patternAA { f, g | f bes c d | ees g, }
  \changePitch \patternBC { bes c | d bes c a | bes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d ees | d f ees d | f ees }
  \changePitch \patternBB { ees ees | e e e e | f ees! }
  \changePitch \patternAA { d ees | d d ees f | g ees }
  \changePitch \patternBC { g g | f d ees ees | d }

  \changePitch \patternCA { d d | g g g g | g f }
  \changePitch \patternDB { f f e e e e | f ees! }
  \changePitch \patternAA { d ees | d d ees f | g ees }
  \changePitch \patternBC { g g | f d ees ees | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes bes | bes bes bes bes | bes bes }
  \changePitch \patternBA { bes g | g c c bes | a }
  \changePitch \patternAA { bes bes | bes bes bes bes | bes bes }
  \changePitch \patternBC { bes bes | bes f a c | bes }

  \changePitch \patternCA { bes bes | bes bes bes bes | bes bes }
  \changePitch \patternDA { bes bes | c c c bes | a }
  \changePitch \patternAA { bes bes | bes bes bes bes | bes bes }
  \changePitch \patternBC { bes bes | bes f a c | bes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { bes bes | bes bes bes bes | ees ees }
  \changePitch \patternBA { ees ees | c c c c | f }
  \changePitch \patternAA { bes, bes | bes bes bes bes | ees ees }
  \changePitch \patternBC { ees ees | f f f f | bes, }

  \changePitch \patternCA { bes' bes | ees, ees ees ees | bes bes }
  \changePitch \patternDA { bes' bes | g g g g | f }
  \changePitch \patternAA { bes, bes | bes bes bes bes | ees ees }
  \changePitch \patternBC { ees ees | f f f f | bes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

“Call them in”— the poor, the wretch -- ed, \bar "."
Sin -- stained wan -- d’rers from the fold: \bar "." \eogbreak
Peace and par -- don free -- ly of -- fer; \bar "."
Can you weigh their worth in gold? \bar "." \eogbreak
“Call them in!”— the weak, the wear -- y, \bar "."
La -- den with the doom of sin; \bar "." \eogbreak
Bid them come and rest in Je -- sus, \bar "."
He is wait -- ing: “Call them in!” \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

“Call them in!”— the Jew, the Gen -- tile,
Bid the stran -- ger to the feast:
“Call them in!”— the rich, the no -- ble,
From the high -- est to the least.
Forth the Fa -- ther runs to meet them,
He hath all their sor -- rows seen;
Robe and ring and roy -- al san -- dals
Wait the lost ones: “Call them in!”

}

wordsC = \lyricmode {
\set stanza = "3."

“Call them in!”— the bro -- ken -- heart -- ed,
Cow -- ’ring neath the brand of shame;
Speak love’s mes -- sage low and ten -- der,
’Twas for sin -- ners Je -- sus came.
See! the shad -- ows length -- en round us,
Soon the day -- dawn will be -- gin;
Can you leave them lost and lone -- ly?
Christ is com -- ing: “Call them in!”

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
