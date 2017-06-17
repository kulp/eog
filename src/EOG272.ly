\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "272"
  title = "Thou Art Coming, Loving Saviour"
  tunename = "Autumn"
  meter = "8. 7. 8. 7. D."
  poet = "H. K. Burlingham"
  composer = "F. H. Bartholemon"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8. c16 | c4. c8 c8. c16 | c4 c4 }
patternAB = { c8. c16 | c4. c8 c8. c16 | c2 }

patternBA = { c8. c16 | c4. c8 c8 c8   | c2 }
patternBB = { c8. c16 | c4. c8 c8 c8   | c4.( c8) }
patternBC = { c8. c16 | c4( c8) c8 c8 c8 | c4( c4) }
patternBD = { c8. c16 | c4( c8) c8 c8 c8 | c4( c8[) c8] }
patternBE = { c8. c16 | c4.     c8 c8 c8 | c4( c4) }
patternBF = { c8. c16 | c4.     c8 c8 c8 | c2      }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { aes bes | c bes aes f | ees c }
  \changePitch \patternBA { aes' bes | c bes c ees | bes }
  \changePitch \patternAA { aes bes | c bes aes f | ees c }
  \changePitch \patternAB { aes' f' | ees c bes c | aes }

  \changePitch \patternAA { c des | ees f ees c | ees c }
  \changePitch \patternBC { aes bes | c des c bes aes | aes g }
  \changePitch \patternAA { aes bes | c bes aes f | ees c }
  \changePitch \patternAB { aes' f' | ees c bes c | aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { c des | ees c des des | c aes }
  \changePitch \patternBB { ees' ees | ees ees ees ees | ees des }
  \changePitch \patternAA { c des | ees ees f des | c c }
  \changePitch \patternAB { des f | aes ees des ees | c }

  \changePitch \patternAA { ees ees | aes aes aes ees | aes ees }
  \changePitch \patternBD { ees ees | ees f ees f f | ees ees des }
  \changePitch \patternAA { c des | ees ees f des | c c }
  \changePitch \patternAB { des f | aes ees des ees | c }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { ees ees | aes ees f aes | aes ees }
  \changePitch \patternBA { aes g | aes g aes c | g }
  \changePitch \patternAA { aes aes | aes aes aes aes | aes aes }
  \changePitch \patternAB { f aes | c aes g g | aes }

  \changePitch \patternAA { aes bes | c des c aes | c aes }
  \changePitch \patternBE { aes g | aes aes des c | c bes }
  \changePitch \patternAA { aes aes | aes aes aes aes | aes aes }
  \changePitch \patternAB { f aes | c aes g g | aes }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { aes aes | aes aes des des | aes aes }
  \changePitch \patternBA { c ees | aes ees c aes | ees' }
  \changePitch \patternAA { aes, aes | aes c des f | aes aes, }
  \changePitch \patternAB { des des | ees ees ees ees | aes, }

  \changePitch \patternAA { aes aes | aes' aes aes aes | aes aes, }
  \changePitch \patternBF { c ees | aes aes des, d | ees }
  \changePitch \patternAA { aes, aes | aes c des f | aes aes, }
  \changePitch \patternAB { des des | ees ees ees ees | aes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Thou art com -- ing, lov -- ing Sav -- iour, \bar "."
Com -- ing first to claim Thine own; \bar "."
Thou art com -- ing, faith -- ful Sav -- iour, \bar "."
Thou couldst not a -- bide a -- lone. \bar "."
In Thy Fa -- ther’s house in glo -- ry, \bar "."
Sin -- ners saved shall dwell with Thee; \bar "."
Oh, the sweet -- ness of the sto -- ry; \bar "."
Love’s own rec -- ord we shall be. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Once thy com -- ing, ho -- ly Sav -- iour,
Ex -- pi -- a -- tion made for sin;
Won -- drous com -- ing, low -- ly Sav -- iour,
Won -- drous Child in Beth -- le -- hem.
Thine the wis -- dom, in the man -- ger,
Thine the power, up -- on the cross,
Thine the glo -- ry as the Stran -- ger!
Rich -- es, though in ut -- ter loss.

}

wordsC = \lyricmode {
\set stanza = "3."

Thou art com -- ing, gra -- cious Sav -- iour,
Ah, to see Thy face we long;
Thou art com -- ing, bless -- ed Sav -- iour,
Right -- ing all cre -- a -- tion’s wrong.
Na -- tion ris -- es a -- gainst na -- tion,
Trou -- ble spreads from shore to shore.
Thou art God’s su -- preme sal -- va -- tion,
Come, and cha -- os shall be o’er.

}

wordsD = \lyricmode {
\set stanza = "4."

Thou art com -- ing, might -- y Sav -- iour,
“King of kings,” Thy writ -- ten name;
Thou art com -- ing, roy -- al Sav -- iour!
Com -- ing for Thy prom -- ised reign.
Oh, the joy, when sin’s con -- fu -- sion
Ends be -- neath Thy right -- eous sway;
Oh, the peace, when all de -- lu -- sion
At Thy pres -- ence dies a -- way.

}

wordsE = \lyricmode {
\set stanza = "5."

Thou art com -- ing, crown -- ed Sav -- iour,
Not “the sec -- ond time” for sin;
Thou art com -- ing, thron -- ed Sav -- iour,
Bring -- ing all the glo -- ry in.
All Thy Fa -- ther’s house, its glo -- ry,
Hangs, by sure be -- hest, on Thee!
Oh, the sweet -- ness of the sto -- ry,
Sav -- iour, come, we wait for Thee.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
