\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  %systems-per-page = ##f
  page-count = 2
  system-count = #(cond (is-eogsized 6) (#t #f))
}

\header{
  hymnnumber = "96"
  title = "If I Gained the World"
  tunename = ""
  meter = "10. 9. 10. 9. D."
  poet = "Anna Olander"
  composer = "Swedish"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=70 }
tb = { \tempo 4=35 }

patternAA = { c8. c16 | c8 c8 c8. c16 c8 c8 | c4 c4 }
patternAB = { c8. c16 | c8 c8 c8. c16 c8 c8 | c8.([ c16] c4) }
patternAC = { c8. c16 | c8 c8 c8. c16 c8 c8 | c2}
patternAD = { c8. c16 | c8 c8 c8. c16 c8 c8 | c8[ c8] c4 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { bes bes | c bes g bes, ees f | ees d }
  \changePitch \patternAB { bes' bes | c bes aes bes, c d | ees g bes }
  \changePitch \patternAA { bes bes | c bes g bes, ees f | ees d }
  \changePitch \patternAC { bes' bes | c bes aes bes, c d | ees }

  \changePitch \patternAD { ees' ees | d c aes ees' d c | c bes g }
  \changePitch \patternAB { bes bes | c bes aes bes, d f | ees g bes }
  \changePitch \patternAD { ees ees | d c aes ees' d c | c bes g }
  \changePitch \patternAC { bes bes | c bes aes bes, d f | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees ees | ees ees bes bes bes bes | bes bes }
  \changePitch \patternAC { d d | d d d bes bes bes | bes }
  \changePitch \patternAA { ees ees | ees ees bes bes bes bes | bes bes }
  \changePitch \patternAC { d d | d d d bes bes bes | bes }

  \changePitch \patternAA { ees ees | ees ees ees ees ees ees | ees ees }
  \changePitch \patternAC { ees ees | ees ees d bes bes d | ees }
  \changePitch \patternAA { ees ees | ees ees ees ees ees ees | ees ees }
  \changePitch \patternAC { ees ees | ees ees d bes bes bes | bes }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g g | aes g bes g g aes | g f }
  \changePitch \patternAC { f f | aes g f f f f | g }
  \changePitch \patternAA { g g | aes g bes g g aes | g f }
  \changePitch \patternAC { f f | aes g f d ees f | g }

  \changePitch \patternAD { g g | aes aes aes aes aes aes | aes g bes }
  \changePitch \patternAC { bes bes | aes bes bes aes aes aes | g }
  \changePitch \patternAD { g g | aes aes aes aes aes aes | aes g bes }
  \changePitch \patternAC { bes bes | aes bes bes aes aes aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees ees | ees ees ees ees ees ees | bes bes }
  \changePitch \patternAC { bes bes bes bes bes d c bes  | ees }
  \changePitch \patternAA { ees ees | ees ees ees ees ees ees | bes bes }
  \changePitch \patternAC { bes bes | bes bes bes bes bes bes | ees }

  \changePitch \patternAA { ees ees | aes, aes c c bes aes | ees' ees }
  \changePitch \patternAC { g g | aes g f f bes, bes | ees }
  \changePitch \patternAA { ees ees | aes, aes c c bes aes | ees' ees }
  \changePitch \patternAC { g g | aes g f f bes, bes | ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

If I gained the world but lost the Sav -- iour, \bar "."
Were my life worth liv -- ing for a day? \bar "."
Could my yearn -- ing heart find rest and com -- fort \bar "."
In the things that soon must pass a -- way? \bar "."
If I gained the world, but lost the Sav -- iour, \bar "."
Would my gain be worth the toil and strife? \bar "."
Are all earth -- ly treas -- ures worth com -- par -- ing \bar "."
With the gift of God, e -- ter -- nal life? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Had I wealth and love in full -- est meas -- ure,
With a name ren -- owned both far and near,
Yet no hope be -- yond, no har -- bor wait -- ing,
Where my storm -- tossed ves -- sel I could steer;
If I gained the world, but lost the Sav -- iour,
Who en -- dured the cross and died for me,
Could then all the world af -- ford a re -- fuge
Whith -- er in my an -- guish I might flee?

}

wordsC = \lyricmode {
\set stanza = "3."

O what emp -- ti -- ness!– With -- out the Sav -- iour
’Mid the sins and sor -- rows here be -- low!
And e -- ter -- ni -- ty, how dark with -- out Him–
On -- ly night and tears and end -- less woe!
What though I might live with -- out the Sav -- iour,
When I come to die, how would it be?
O to face the Val -- ley’s gloom with -- out Him!
And with -- out Him for e -- ter -- ni -- ty!

}

wordsD = \lyricmode {
\set stanza = "4."

O the joy of hav -- ing all in Je -- sus!
What a balm the bro -- ken heart to heal!
Ne’er a sin so great, but He can cleanse it,
Not a sor -- row that He does not feel!
If I have but Je -- sus on -- ly Je -- sus,
Noth -- ing else in all the world be -- side–
O then ev -- ery -- thing is mine in Je -- sus;
For my needs and more He will pro -- vide.

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

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
