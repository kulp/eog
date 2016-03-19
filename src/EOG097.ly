\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = 2
  %page-count = ##f
}

\header{
  hymnnumber = "97"
  title = "O, How Sweet the Gospel Message"
  tunename = "Halle"
  meter = "8. 7. 8. 7."
  %poet = ""
  composer = "C. Muller"
  %copyright = ""
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
  \override Staff.TimeSignature.style = #'()
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  %\partial 4
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

O, how sweet the gos -- pel mes -- sage, \bar "."
Rich and bound -- less, full and free; \bar "." \break
Sin -- ner, wilt thou pause and lis -- ten? \bar "."
Je -- sus died, and died for thee. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Say not, ’tis to oth -- er sin -- ners–
Those more wor -- thy of His call–
But re -- ceive the truth with glad -- ness,
Je -- sus died, and died for all.

}

wordsC = \lyricmode {
\set stanza = "3."

Wilt thou rob Him of His pur -- chase
When He bought thee with His blood?
He is pray -- ing, He is plead -- ing,
Be ye re -- con -- ciled to God.

}

wordsD = \markuplist {

\line { Now no barrier to hinder, }
\line { Jesus has removed it all; }
\line { God can in His Son receive thee – }
\line { Answer then His loving call. }

}

wordsE = \markuplist {

\line { Let thy soul delight the Saviour }
\line { By submitting to His love; }
\line { And in everlasting favor, }
\line { Thou shalt dwell with Him above. }

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

\noPageBreak

\markup { \fill-line { %\column {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } } %\combine \null \vspace #0.4
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } } %\combine \null \vspace #0.4
  \hspace #0.1
} } %}

\noPageBreak

\markup { \vspace #1.4 \fill-line { \line { Alternate tune: No. 288 } } }

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
