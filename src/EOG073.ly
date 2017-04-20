\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "73"
  title = "Come To the Saviour Now"
  tunename = "Maker"
  meter = "P. M."
  poet = "J. M. Wigner"
  composer = "R. C. Maker"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=104 }
tb = { \tempo 4=52  }

patternAA = { c2 c4 c4 | c4. c8 c4 }
patternBA = { c4 | c4 c4 c4 c4 | c1 }
patternCA = { c4 | c4 c4 c4 c4 | c1 }
patternDA = { c2 c2 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g g g | g f f }
  \changePitch \patternBA { g | aes aes g f | g }
  \changePitch \patternAA { c c c | c bes bes }
  \changePitch \patternBA { aes | g g f ees | f }

  \changePitch \patternAA { ees ees f | g g g }
  \changePitch \patternCA { aes | bes bes aes g | c }
  \changePitch \patternAA { d c bes | ees ees, ees }
  \changePitch \patternCA { f | g g aes d, | ees }
  \changePitch \patternDA { ees aes | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees ees ees | ees d d }
  \changePitch \patternBA { ees | ees ees ees d | ees }
  \changePitch \patternAA { ees ees ees | ees ees ees }
  \changePitch \patternBA { f | ees ees c c | d }

  \changePitch \patternAA { ees ees ees | ees ees ees }
  \changePitch \patternCA { d | ees ees d ees | ees }
  \changePitch \patternAA { f d d | ees ees ees }
  \changePitch \patternCA { ees | ees ees c bes | bes }
  \changePitch \patternDA { ees ees | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { bes bes bes | bes bes bes }
  \changePitch \patternBA { bes | c c bes bes | bes }
  \changePitch \patternAA { aes aes aes | aes g g }
  \changePitch \patternBA { bes | bes bes a a | bes }

  \changePitch \patternAA { g g aes | bes bes bes }
  \changePitch \patternCA { bes | bes bes bes bes | aes }
  \changePitch \patternAA { bes bes bes | bes bes bes }
  \changePitch \patternCA { c | bes g f aes | g }
  \changePitch \patternDA { c c | bes }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees ees ees | ees bes bes }
  \changePitch \patternBA { ees | aes, aes bes bes | ees }
  \changePitch \patternAA { aes, aes c | ees ees ees }
  \changePitch \patternBA { d | ees ees f f | bes, }

  \changePitch \patternAA { ees ees ees | ees ees ees }
  \changePitch \patternCA { f | g g f ees | aes, }
  \changePitch \patternAA { aes' aes aes | g bes, bes }
  \changePitch \patternCA { aes | bes bes bes bes | ees }
  \changePitch \patternDA { aes aes, | ees' }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Come to the Sav -- iour now! \bar "."
He gent -- ly call -- eth thee; \bar "." \break
In true re -- pent -- ance bow, \bar "."
Be -- fore Him bend the knee; \bar "." \break
He wait -- eth to be -- stow \bar "."
Sal -- va -- tion, peace, and love, \bar "."
True joy on earth be -- low, \bar "."
A home in heav’n a -- bove. \bar "."
Come, come, come. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Come to the Sav -- iour now!
Gaze on that cleans -- ing tide—
Wa -- ter and blood that flow
Forth from His wound -- ed side.
Hark to the suff -- ’ring One:
“’Tis fin -- ish’d” now He cries;
Re -- demp -- tion’s work is done,
Then bows His head and dies.
Come, come, come.

}

wordsC = \lyricmode {
\set stanza = "3."

Come to the Sav -- iour now!
He suf -- fer’d all for thee;
And in His mer -- its thou
Hast an un -- fail -- ing plea;
No vain ex -- cu -- ses frame,
For feel -- ings do not stay;
None who to Je -- sus came
Were ev -- er sent a -- way.
Come, come, come.

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
