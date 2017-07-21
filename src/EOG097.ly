\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 2) (#t #f))
  system-system-spacing.padding = 1
  system-system-spacing.basic-distance = 1
}

\header{
  %gospel
  hymnnumber = "97"
  title = "Oh, How Sweet the Gospel Message"
  tunename = "Halle"
  meter = "8. 7. 8. 7."
  poet = ""
  composer = "C. Muller"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

patternAA = { c2 }
patternAB = { c2 c2 c2 c2 | c4( c4) c4( c4) c2 c2 }

patternBA = { c2 c2 c2 c4( c4) | c2 c2 c1 }
patternBB = { c2 c2 c2 c2 | c2 c2 c1 }

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
\relative c' {

  \changePitch \patternAA { e g g e | f a a g }
  \changePitch \patternBA { c e, e d e | f e d }
  \changePitch \patternAB { g g e' c | a b c a a g }
  \changePitch \patternBB { g b c d | e d c }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c e e c | c f f e }
  \changePitch \patternBA { e c c b c | d c b }
  \changePitch \patternAB { e e g e | f g a f f e }
  \changePitch \patternBB { e f g a | g f e }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g c c g | a c c c }
  \changePitch \patternBB { g g g g | g g g }
  \changePitch \patternAA { c c c c | c c c c }
  \changePitch \patternBB { g g g c | c b g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { c c c c | f f c c }
  \changePitch \patternBB { c c c c | g g g }
  \changePitch \patternAA { c c c c | f f c c }
  \changePitch \patternBB { c d e f | g g c, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Oh, how sweet the gos -- pel mes -- sage, \bar "."
Rich and bound -- less, full and free; \bar "." \eogbreak
Sin -- ner, wilt thou pause and lis -- ten? \bar "."
Je -- sus died, and died for thee. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Say not, ’tis to oth -- er sin -- ners_–
Those more wor -- thy of His call_–
But re -- ceive the truth with glad -- ness,
Je -- sus died, and died for all.

}

wordsC = \lyricmode {
\set stanza = "3."

Wilt thou rob Him of His pur -- chase
When He bought thee with His blood?
He is pray -- ing, He is plead -- ing,
Be ye rec -- on -- ciled to God.

}

wordsD = \markuplist {

\line { Now no barrier to hinder, }
\line { { \hspace #2 } Jesus has removed it all; }
\line { God can in His Son receive thee — }
\line { { \hspace #2 } Answer then His loving call. }

}

wordsE = \markuplist {

\line { Let thy soul delight the Saviour }
\line { { \hspace #2 } By submitting to His love; }
\line { And in everlasting favor, }
\line { { \hspace #2 } Thou shalt dwell with Him above. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
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

\markup { \raise #5 \fill-line {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } }
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
} }

\noPageBreak

\markup { \vspace #1 \fill-line { \line { Alternate tune: No. 288 } } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
