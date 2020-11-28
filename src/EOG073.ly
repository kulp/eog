\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "73"
  title = "Come to the Saviour Now"
  tunename = "Invitation" % see https://hymnary.org/tune/invitation_maker
  meter = "6. 6. 6. 6. 6. 6. 6. 6. 3." % from Little Flock
  poet = "John M. Wigner" % see https://hymnary.org/text/come_to_the_savior_now_he_gently_call
  composer = "Frederick C. Maker" % see https://hymnary.org/tune/invitation_maker
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
He gen -- tly call -- eth thee; \bar "." \eogbreak
In true re -- pent -- ance bow, \bar "."
Be -- fore Him bend the knee; \bar "." \eogbreak
He wait -- eth to be -- stow \bar "."
Sal -- va -- tion, peace and love, \bar "."
True joy on earth be -- low, \bar "."
A home in heaven a -- bove. \bar "."
Come, come, come. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Come to the Sav -- iour now!
Gaze on that cleans -- ing tide—
Wa -- ter and blood that flow
Forth from His wound -- ed side.
Hark to the suf -- f’ring One:
“’Tis fin -- ished!” now He cries;
Re -- demp -- tion’s work is done,
Then bows His head and dies.
Come, come, come.

}

wordsC = \lyricmode {
\set stanza = "3."

Come to the Sav -- iour now!
He suf -- fered there for thee;
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
      \partcombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
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
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
