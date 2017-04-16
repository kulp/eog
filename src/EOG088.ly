\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  systems-per-page = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "88"
  title = "Hail, Sovereign Love"
  tunename = "Bera"
  meter = "L. M."
  poet = "Jehoiada Brewer" % original has "Jehoida"
  composer = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=110 }
tb = { \tempo 4=55  }

patternAA = { c2       c4 c4 | c2 c2      | c4( c4) c4( c4) | c1 }
patternAB = { c2       c4 c4 | c2 c2      | c4( c4) c2      | c1 }
patternAC = { c2       c4 c4 | c2 c2      | c2      c2      | c1 }
patternAD = { c2       c4 c4 | c2 c2      | c2      c4( c4) | c1 }
patternAE = { c2       c4 c4 | c2 c4( c4) | c2      c4( c4) | c1 }
patternAF = { c4.( c8) c4 c4 | c2 c2      | c4( c4) c4( c4) | c1 }
patternAG = { c4.( c8) c4 c4 | c2 c2      | c2      c4( c4) | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g g f | ees bes' bes f g aes | g }
  \changePitch \patternAA { ees' ees c | bes g | f d' d c | bes }
  \changePitch \patternAE { bes bes c | aes aes bes | g g aes | f }
  \changePitch \patternAF { g f ees ees | ees ees | d aes' aes d, | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees ees bes | bes g' | f d ees f | ees }
  \changePitch \patternAB { g aes aes | g ees | d f f | f }
  \changePitch \patternAE { g g aes | f f g | ees ees f | d }
  \changePitch \patternAF { ees bes bes bes | c bes | bes d d bes | bes }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { bes bes aes | g ees' | d bes bes | bes }
  \changePitch \patternAD { bes | c ees | ees bes | bes a ees' | d }
  \changePitch \patternAC { bes bes bes | bes bes | bes bes | bes }
  \changePitch \patternAG { bes aes | g g | aes g | f f aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAC { ees ees ees | ees ees | bes bes | ees }
  \changePitch \patternAC { ees ees ees | ees ees | f f | bes, }
  \changePitch \patternAC { bes bes bes | bes bes | bes bes | bes }
  \changePitch \patternAC { ees ees ees | aes, ees' | bes bes | ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Hail, sover -- eign love, which first be -- gan \bar "."
That scheme to res -- cue fall -- en man! \bar "."
Hail, match -- less, free, e -- ter -- nal grace, \bar "."
Which gave my soul a hid -- ing place. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

A -- gainst the God who built the sky
I fought, with hands up -- lift -- ed high;
De -- spised the men -- tion of His grace,
Too proud to seek a hid -- ing place.

}

wordsC = \lyricmode {
\set stanza = "3."

En -- wrapt in thick E -- gyp -- tian night,
And fond of dark -- ness more than light,
Mad -- ly I ran the sin -- ful race,
Se -- cure with -- out a hid -- ing place.

}

wordsD = \lyricmode {
\set stanza = "4."

And thus th’e -- ter -- nal coun -- sels ran,
“Al -- might -- y love, ar -- rest that man!”
I felt the ar -- rows of dis -- tress,
And found I had no hid -- ing place.

}

wordsE = \markuplist {

\line { Indignant Justice stood in view, }
\line { To Sinai’s fiery mount I flew; }
\line { But Justice cried with frowning face, }
\line { “This mountain is no hiding place.” }

}

wordsF = \markuplist {

\line { On Jesus, God’s just vengeance fell, }
\line { Which would have sunk a world to hell; }
\line { He bore it for a sinful race, }
\line { And thus became their Hiding Place. }

}

wordsG = \markuplist {

\line { Should sevenfold storms of thunder roll, }
\line { And shake this globe from pole to pole, }
\line { No thunderbolt shall daunt my face, }
\line { For Jesus is my Hiding Place. }

}

wordsH = \markuplist {

\line { A few more rolling suns at most, }
\line { Shall land me on fair Canaan’s coast, }
\line { Where I shall sing the song of grace, }
\line { And see my glorious Hiding Place. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
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

\noPageBreak

\markup { \fill-line { \column {
	% TODO centre number above verse as in original
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
  \line{ \bold 7 \column { \wordsG } } \combine \null \vspace #0.4
  \line{ \bold 8 \column { \wordsH } } \combine \null \vspace #0.4
} } }

\noPageBreak

\markup { \vspace #2 \fill-line { \raise #2 \line { Alternate tune: No. 3 in Supplement. } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
