\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
}

\header{
  %children
  hymnnumber = "321"
  title = "And Is It True, As I Am Told?"
  tunename = "Meribah" % similar to, but not identical to, EOG128
  meter = "8. 8. 6. D."
  poet = ""
  composer = "Dr. L. Mason"
  tagline = ##f
}

patternAA = { c2 | c4. c8 c4 c4 c4 c4 | c1 }

patternBA = { c2 | c4 c4 c2 c2 | c1 }
patternBB = { c2 | c4 c4 c2 c4( c4) | c1 }

patternCA = { c2 | c4 c4 c4 c4 c4 c4 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { ees | g g g f g aes | bes }
  \changePitch \patternAA { g | c c c bes aes g | f }
  \changePitch \patternBA { bes | d c bes a | bes }

  \changePitch \patternCA { bes | ees bes bes g aes c | bes }
  \changePitch \patternCA { bes | ees bes bes g aes c | bes }
  \changePitch \patternBA { ees, | f aes g f | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees | ees ees ees d ees f | g }
  \changePitch \patternAA { ees | ees ees ees ees d ees | d }
  \changePitch \patternBA { d | f g f ees | d }

  \changePitch \patternCA { ees | g g g ees ees aes | g }
  \changePitch \patternCA { ees | g g g ees ees aes | g }
  \changePitch \patternBA { ees | ees ees ees d | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g | bes bes bes bes bes bes | g }
  \changePitch \patternAA { bes | aes aes aes bes bes bes | bes }
  \changePitch \patternBA { f | bes bes d c | bes }

  \changePitch \patternCA { g | bes ees ees bes c ees | ees}
  \changePitch \patternCA { g, | bes ees ees bes c ees | ees}
  \changePitch \patternBB { bes | c c bes bes( aes) | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees | ees ees ees aes g f | ees }
  \changePitch \patternAA { ees | aes, aes aes' g f ees | bes }
  \changePitch \patternBA { bes | d ees f f | bes, }

  \changePitch \patternCA { ees | ees ees ees ees c aes | ees' }
  \changePitch \patternCA { ees | ees ees ees ees c aes | ees' }
  \changePitch \patternBA { g, | aes aes bes bes | ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

And is it true, as I am told, \bar "."
That there are lambs with -- in the fold \bar "."
Of God’s be -- lov -- ed Son? \bar "."
That Je -- sus Christ, with ten -- der care, \bar "."
Will in His arms most gen -- tly bear \bar "."
The help -- less lit -- tle ones? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

And I, a lit -- tle, stray -- ing lamb,
May come to Je -- sus as I am,
Tho’ good -- ness I have none:
May now be fold -- ed to His breast,
And there for -- ev -- er gen -- tly rest,
And be His lit -- tle one.

}

wordsC = \lyricmode {
\set stanza = "3."

Oth -- ers there are who love me, too;
But who, with all their love could do
What Je -- sus Christ as done?
And when He teach -- es me to pray,
I’ll sure -- ly go to Him and say,
“Lord, keep Thy lit -- tle one.”

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
