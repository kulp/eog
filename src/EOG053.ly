\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "53"
  title = "Weeping Will Not Save Me!"
  tunename = ""
  meter = "P. M."
  poet = "Robert Lowry"
  composer = "Robert Lowry"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=110 }
tb = { \tempo 4=55  }

patternAA = { c4 c4 c4 c4 | c2 c2 }
patternAB = { c4 c4 c4 c4 | c4 c4 c2 }

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

  \changePitch \patternAA { bes c bes g | f ees }
  \changePitch \patternAB { f f f ees | g bes bes }
  \changePitch \patternAB { f f f ees | g bes bes }
  \changePitch \patternAB { c c bes g | bes bes g }
  \changePitch \patternAA { ees g bes g | f ees }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAB { c' c c ees | bes bes bes } >>
  \changePitch \patternAB { c c c ees | bes bes bes }
  \changePitch \patternAB { c c bes g | bes bes g }
  \changePitch \patternAA { ees g bes g | f ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees ees ees ees | d ees }
  \changePitch \patternAB { d d d ees | ees ees d }
  \changePitch \patternAB { d d d ees | ees d ees }
  \changePitch \patternAB { ees ees ees ees | f d ees }
  \changePitch \patternAA { ees ees g ees | d ees }

  \changePitch \patternAB { ees ees ees ees | ees d ees }
  \changePitch \patternAB { ees ees ees ees | ees d ees }
  \changePitch \patternAB { ees ees ees ees | f d ees }
  \changePitch \patternAA { ees ees g ees | d ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g aes g bes | aes g }
  \changePitch \patternAB { bes bes aes g | bes g f }
  \changePitch \patternAB { bes bes aes g | ees f g }
  \changePitch \patternAB { aes aes g bes | bes bes bes }
  \changePitch \patternAA { g bes ees bes | aes g }

  \changePitch \patternAB { aes aes aes aes | g f g }
  \changePitch \patternAB { aes aes aes aes | g f g }
  \changePitch \patternAB { aes aes g bes | bes bes bes }
  \changePitch \patternAA { g bes ees bes | aes g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees ees ees ees | bes ees }
  \changePitch \patternAB { bes bes bes ees | ees ees bes }
  \changePitch \patternAB { bes bes bes ees | ees bes ees }
  \changePitch \patternAB { aes, c ees ees | d bes ees }
  \changePitch \patternAA { ees ees ees ees | bes ees }

  \changePitch \patternAB { aes, aes aes c | ees bes ees }
  \changePitch \patternAB { aes, aes aes c | ees bes ees }
  \changePitch \patternAB { aes, c ees ees | d bes ees }
  \changePitch \patternAA { ees ees ees ees | bes ees }

}
}

Refrain = \lyricmode {

Je -- sus bled and died for me; \bar "."
Je -- sus suf -- fered on the tree; \bar "." \break
Je -- sus waits to make me free; \bar "."
He a -- lone can save me! \bar "." \break

}

wordsA = \lyricmode {
\set stanza = "1."

Weep -- ing will not save me; \bar "."
Tho’ my face were bathed in tears, \bar "."
That could not al -- lay my fears, \bar "."
Could not wash the sins of years; \bar "."
Weep -- ing will not save me. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Work -- ing will not save me;
Pu -- rest deeds that I can do,
Ho -- liest tho’ts and feel -- ings, too,
Can -- not form my soul a -- new;
Work -- ing will not save me.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Wait -- ing will not save me;
Help -- less, guilt -- y, lost I lie,
In my ear is mer -- cy’s cry;
If I wait I can but die;
Wait -- ing will not save me.

}

wordsD = \lyricmode {
\set stanza = "4."

Faith in Christ wil save me;
Trust in Him, the ris -- en One,
Trust the work that He has done;
To His arms I now may run;
Faith in Christ will save me.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
      %\context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
      \clef bass
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
