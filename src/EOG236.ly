\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  hymnnumber = "236"
  title = "Lo, He Comes, From Heaven Descending"
  tunename = "Harwell"
  meter = "8. 7. 8. 7. 4. 7."
  poet = "C. Wesley"
  composer = "Dr. L. Mason"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \partial 4
  \autoBeamOff
}

patternA = { c8. c16 | c4. c8 c c | c4 c }
patternB = { c8. c16 | c4. c8 c c | c2 }
patternC = { c8. c16 c8 c c c | c4 c }
patternD = { c8. c16 c8 c c c | c2 }

notesSoprano = {
\global
\relative c' {

  d8. d16 | g4. d8 g b | a4 a
  \changePitch \patternB { d d | d g, b a | g } r4
  \changePitch \patternC { c b a b c d | c a } r4
  \changePitch \patternC { d c b c d e | d( b) }
  d,8. d16 | g4. d8 g b | a4 a
  \changePitch \patternB { d d | d g, b a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { b b | d d d g | fis fis }
  \changePitch \patternB { fis fis | g d d fis | g } r4
  \changePitch \patternC { a g fis g a b | a fis } r4
  \changePitch \patternC { b a g a b c | b( g) }
  \changePitch \patternA { b, b | d d d g | fis fis }
  \changePitch \patternB { fis fis | g d d fis | g }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { g g | b b d d | d d }
  \changePitch \patternB { a a | b b d c | b } r4
  \changePitch \patternC { d d d d d d | d d } r4
  \changePitch \patternD { g, g g g g g | g }
  \changePitch \patternA { g g | b b d d | d d }
  \changePitch \patternB { a a | b b d c | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { g g | g g b g | d d }
  \changePitch \patternB { d d | g g d d | g, } r4
  \changePitch \patternC { d' d d d d d | d d } r4
  \changePitch \patternD { g g g g g g | g }
  \changePitch \patternA { g g | g g b g | d d }
  \changePitch \patternB { d d | g g d d | g, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Lo, He comes, from heav’n de -- scend -- ing, \bar "."
Once for fa -- vored sin -- ners slain! \bar "."
Thou -- sand, thou -- sand saints at -- tend -- ing, \bar "."
Swell the tri -- umph of His train! \bar "."
Hal -- le -- lu -- jah! %{HIDE>%} hal -- le -- lu -- jah! %{<HIDE%} \bar "."
Je -- sus comes, and comes to reign. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

See the Sav -- iour, long ex -- pect -- ed,
Now in sol -- emn pomp ap -- pear:
And His saints, by man re -- ject -- ed,
All His heav’n -- ly glo -- ry share:
Hal -- le -- lu -- jah! %{HIDE>%} hal -- le -- lu -- jah! %{<HIDE%}
See the Son of God ap -- pear.

}

wordsC = \lyricmode {
\set stanza = "3."

Lo! the to -- kens of His pas -- sion,
Tho’ in glo -- ry, still He bears;
Cause of end -- less ex -- ul -- ta -- tion,
To His ran -- somed wor -- ship -- ers:
Hal -- le -- lu -- jah! %{HIDE>%} hal -- le -- lu -- jah! %{<HIDE%}
Christ the Lamb of God ap -- pears.

}

wordsD = \lyricmode {
\set stanza = "4."

Is -- rael’s race shall now be -- hold Him,
Full of grace and maj -- es -- ty;
Tho’ they set at naught and sold Him,
Pierced and nailed Him to the tree:
Now in glo -- ry, %{HIDE>%} now in glo -- ry, %{<HIDE%}
Shall their great Mes -- si -- ah see.

}

wordsE = \markuplist {

\line { ’Tis Thy heavenly bride and Spirit, }
\line { { \hspace #2 } Jesus, Lord, that bids Thee come, }
\line { All the glory to inherit, }
\line { { \hspace #2 } And to take Thy people home. }
\line { { \hspace #4 } All creation, %{HIDE>%} all creation, %{<HIDE%} }
\line { { \hspace #2 } Travails, groans and bids Thee come. }

}

wordsF = \markuplist {

\line { Yea, amen, let all adore Thee, }
\line { { \hspace #2 } High on Thy exalted throne: }
\line { Saviour, take the power and glory; }
\line { { \hspace #2 } Claim the kingdoms for Thine own; }
\line { { \hspace #4 } Come, Lord Jesus! %{HIDE>%} come, Lord Jesus! %{<HIDE%} }
\line { { \hspace #2 } Hallelujah! come, Lord, come. }

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

\markup { \fill-line { \column {
  \line{ \bold 4 \column { \wordsE } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsF } } \combine \null \vspace #0.4
} } }

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond: