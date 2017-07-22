\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  system-system-spacing.padding = 9
}

\header{
  hymnnumber = "270"
  title = "And Is It So – I Shall Be Like Thy Son?"
  tunename = "Eventide" % see EOG076
  meter = "10. 10. 10. 10."
  poet = "J. N. Darby"
  composer = "W. H. Monk"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=110
  \key e \major
  \autoBeamOff
}

patternAA = { c2      c4 c4 | c2 c2      | c4  c4 c4 c4 | c1 }
patternAB = { c4( c4) c4 c4 | c2 c2      | c4  c4 c4 c4 | c1 }
patternAC = { c4( c4) c4 c4 | c2 c4( c4) | c4  c4 c4 c4 | c1 }
patternAD = { c2      c4 c4 | c2 c2      | c4. c8 c4 c4 | c1 }

patternBA = { c2 c4 c4 | c4 c4 c4 c4 | c2  c2 | c1 }
patternBB = { c2 c4 c4 | c4 c4 c4 c4 | c2. c4 | c1 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { gis gis fis | e b' | cis b b a | gis }
  \changePitch \patternAA { gis a b | cis b | a fis gis ais | b }
  \changePitch \patternAA { gis gis fis | e b' | b a a gis | fis }
  \changePitch \patternBA { fis gis a | gis fis e a | gis fis | e }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e dis dis | e e | e dis e fis | e }
  \changePitch \patternAA { e e e | e e | e fis e e | dis }
  \changePitch \patternAA { e dis dis | e e | e e eis eis | fis }
  \changePitch \patternBA { dis e dis | e dis e fis | e dis | e }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b b a | gis e | e b' b b | b }
  \changePitch \patternAA { b a gis | a gis | cis b b e, | fis }
  \changePitch \patternAC { gis a b a | gis e' dis | cis cis cis b | a }
  \changePitch \patternBB { b b b | b a gis cis | b a | gis }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { e b b | cis gis | a b cis dis | e }
  \changePitch \patternAB { e dis cis b | a e' | fis dis e cis | b }
  \changePitch \patternAD { e b b | cis gis | a b cis cis | fis }
  \changePitch \patternBA { a gis fis | e b cis a | b b e }

}
}


wordsA = \lyricmode {
\set stanza = "1."

And is it so_– I shall be like Thy Son? \bar "."
Is this the grace which He for me has won? \bar "."
Fa -- ther of glo -- ry (tho’t be -- yond all tho’t!)_– \bar "."
In glo -- ry, to His own blest like -- ness bro’t! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

O Je -- sus, Lord, who loved me like to Thee?
Fruit of Thy work, with Thee, too, there to see
Thy glo -- ry, Lord, while end -- less a -- ges roll,
My -- self the prize and trav -- ail of Thy soul.

}

wordsC = \lyricmode {
\set stanza = "3."

Yet it must be: Thy love had not its rest
Were Thy re -- deemed not with Thee ful -- ly blest.
That love that gives not as the world, but shares
All it pos -- sess -- es with its loved co -- heirs.

}

wordsD = \lyricmode {
\set stanza = "4."

Nor I a -- lone; Thy loved ones all, com -- plete
In glo -- ry, round Thee there with joy shall meet,
All like Thee, for Thy glo -- ry like Thee, Lord,
Ob -- ject su -- preme of all, by all a -- dored.

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
  \midi{
    \include "common/midi.ily"
  }
}

% TODO suggest alternate tune No. 6, as EOG076 does ?

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
