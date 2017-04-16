\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "235"
  title = "Lift Up Your Heads, Eternal Gates"
  tunename = ""
  meter = "8. 7. 8. 7. D. Iambic"
  poet = "E. L. B."
  composer = "C. L."
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key a \major
  \autoBeamOff
}

patternA = { r4 r8 c c c | c4. c8 c c | c2 }
patternB = { c4 | c4. c8 c c | c4 c8 }
patternC = { c8 c c | c4. c8 c c | c2 }
patternD = { c8[ c] | c4. c8 c c | c4 c }
patternG = { c4 | c4. c8 c c | c4 c }

patternE = { c4 | c4. c8 c c | c4 c }
patternF = { c8[ c] | c4. c8 c c | c4 c2 }
patternH = { c4 | c4. c8 c c | c4 c2 }

notesSoprano = {
\global
\relative c' {

  r4 r8 e e e | a4. a8 a e | fis2
  fis4 | fis4. fis8 gis a | gis4 e8
  e8 e e | a4. e8 a b | cis2
  cis8[ d] | e4. a,8 b cis | b4 a

  << s^\markup { \small \caps "Refrain" }
  { b4 | b4. b8 cis a | b4 b } >>
  e,4 | e4. e8 e e | e4 e8
  e8 e e | a4. e8 a b | cis2
  cis8[ d] | e4. a,8 b cis | b4 a2

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { e e e | cis cis e cis | d }
  \changePitch \patternB { d | dis dis dis dis | e e }
  \changePitch \patternC { e e d | cis cis e e | e }
  \changePitch \patternG { e | e e e e | d cis }

  \changePitch \patternE { gis' gis gis a fis  | gis gis }
  \changePitch \patternB { b, | b b cis a | b b }
  \changePitch \patternC { d cis b | cis cis e e | e }
  \changePitch \patternH { e | e e e e | d cis }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { e e e | a a a a | a }
  \changePitch \patternB { a | a a gis fis | e gis }
  \changePitch \patternC { d' cis b | a a a gis | a }
  \changePitch \patternD { a b | cis cis b a | gis a }

  \changePitch \patternE { e | e' e e e | e e }
  \changePitch \patternB { gis, | gis gis a fis | gis gis }
  \changePitch \patternC { b a gis | e a a gis | a }
  \changePitch \patternF { a b | cis cis b a | gis a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { e e e | a, a cis a | d }
  \changePitch \patternB { d | b b b b | e e }
  \changePitch \patternC { e e e | a, a cis e | a }
  \changePitch \patternG { a | a a gis a | e a, }

  \changePitch \patternE { e' | e e e e | e e }
  \changePitch \patternB { e | e e e e | e e }
  \changePitch \patternC { e e e | a, a cis e | a }
  \changePitch \patternH { a | a a gis a | e a, }

}
}

RefrainA = \lyricmode {
\set stanza = "1-4."

Who is the King of glo -- ry? \bar "."
Who is the King of glo -- ry? \bar "."
The great I AM, the Lord of hosts– \bar "."
He is the King of glo -- ry! \bar "."

}

RefrainE = \lyricmode {
\set stanza = "5."

Who is the King of glo -- ry?
Who is the King of glo -- ry?
’Tis Je -- sus wear -- ing many a crown–
He is the King of glo -- ry!

}

wordsA = \lyricmode {
\set stanza = "1."

Lift up your heads, e -- ter -- nal gates, \bar "."
A glow -- ing dawn shines o’er ye! \bar "."
At Sa -- lem’s door the Sov -- ’reign waits– \bar "."
He is the King of glo -- ry! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The palms of yore their branch -- es waved
When Ju -- dah’s sons were sing -- ing:
“Ho -- san -- na! Zi -- on shall be saved,”
Their gen -- tle Mon -- arch bring -- ing.

\RefrainA

}

wordsC = \lyricmode {
\set stanza = "3."

But the sun’s light at mid -- day died,
And Ju -- dah’s ma -- trons, wail -- ing,
La -- ment -- ed loud the Cru -- ci -- fied,
All trace of glo -- ry fail -- ing!

}

wordsD = \lyricmode {
\set stanza = "4."

Those gloom -- y years have rolled a -- way,
The years of Is -- rael’s mourn -- ing;
The ris -- ing sun with heal -- ing ray
Pro -- claims the King’s re -- turn -- ing.

}

wordsE = \lyricmode {
\set stanza = "5."

Lift up your heads, e -- ter -- nal gates,
Tran -- scend -- ent dawn glows o’er ye!
At Sa -- lem’s door Mes -- si -- ah waits;
He is the King of glo -- ry.

\RefrainE

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
