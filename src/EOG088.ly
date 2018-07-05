\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t % keep markup verses from clinging to bottom of page
  \include "override/override-EOG088.ily"
  oddFooterMarkup = \markup { \fill-line { \on-the-fly \first-page "Alternate tune: No. 3 in Supplement." } }
}

\header{
  %gospel
  hymnnumber = "88"
  title = "Hail, Sovereign Love"
  tunename = "Bera" % see https://hymnary.org/tune/bera_gould
  meter = "L. M."
  poet = "Jehoiada Brewer" % original has "Jehoida" ; Wikipedia has "Jehoiada" ; hymnary.org has "John Hyatt Brewer" ; https://hymnary.org/hymn/BHTB1868/page/225 has "Jehoida" again
  composer = "John E. Gould" % see https://hymnary.org/tune/bera_gould
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
  \changePitch \patternAA { ees' ees c | bes g | f d' d c | bes } \eogbreak
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

Hail, sov -- ereign love, which first be -- gan \bar "."
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

And thus the_e -- ter -- nal coun -- sels ran,
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
    \context {
      \Lyrics
      % Compensate for wide lyrics by squashing things a bit
      \override LyricSpace.minimum-distance = #0.3
    }
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\markup { \fontsize #0.3 \fill-line { \vcenter \column {
  \vspace #3
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
  \line{ \bold 7 \column { \wordsG } } \combine \null \vspace #0.4
  \line{ \bold 8 \column { \wordsH } }
  \vspace #3
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
