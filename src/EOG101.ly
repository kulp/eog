\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "101"
  title = "Look, Thou Lost One, To the Saviour"
  tunename = "Look Ye Saints"
  meter = "8. 7. 8. 7. 4. 7."
  %poet = ""
  composer = "Arr. by G. C. Stebbins"
  %copyright = ""
  tagline = ##f
}

patternAA = { c4. c8 c4 c4 | c4. c8 c4 c4 }
patternBA = { c4. c8 c8 c8 c8. c16 | c1 }
patternBB = { c4. c8 c8 c8 c8. c16 | c2( c4 c4) }
patternBC = { c4. c8 c8 c8 c8. c16 | c2.( c4) }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=95
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { a gis a f | c' b c a }
  \changePitch \patternBA { g fis g bes a g | f }
  \changePitch \patternAA { a gis a f | c' b c a }
  \changePitch \patternBA { g fis g bes a g | f }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAA { bes a bes g | a gis a f } >>
  \changePitch \patternBB { d' c bes a g f | e c' bes! }
  \changePitch \patternAA { a gis a f | c' b c a }
  \changePitch \patternBA { g fis g bes a g | f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { f f f f | f f f f }
  \changePitch \patternBA { e e e e f! e | f }
  \changePitch \patternAA { f f f f | f f f f }
  \changePitch \patternBA { e e e e f! e | f }

  \changePitch \patternAA { f f f f | f f f f }
  \changePitch \patternBB { f f e f c b! | c e g }
  \changePitch \patternAA { f f f f | f f f f }
  \changePitch \patternBA { e e e e f! e | f }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c b c a | a gis a c }
  \changePitch \patternBA { bes a bes g c bes | a }
  \changePitch \patternAA { c b c a | a gis a c }
  \changePitch \patternBA { bes a bes g c bes | a }

  \changePitch \patternAA { d cis d d | c b c a }
  \changePitch \patternBC { bes c c c c g | g c }
  \changePitch \patternAA { c b c a | a gis a c }
  \changePitch \patternBA { bes a bes g c bes | a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f f f f | f f f f }
  \changePitch \patternBA { c c c c c c | f }
  \changePitch \patternAA { f f f f | f f f f }
  \changePitch \patternBA { c c c c c c | f }

  \changePitch \patternAA { bes, bes bes bes | f' f f f }
  \changePitch \patternBA { bes a g f e d | c }
  \changePitch \patternAA { f f f f | f f f f }
  \changePitch \patternBA { c c c c c c | f }

}
}

Refrain = \lyricmode {

Match -- less Sav -- iour! match -- less Sav -- iour!
Je -- sus all the work has done.
Come to Je -- sus, come to Je -- sus–
Je -- sus, God’s be -- lov -- ed Son.

}

wordsA = \lyricmode {
\set stanza = "1."

Look, thou lost one, to the Sav -- iour,
Seat -- ed on yon glor -- ious throne;
Look! this mo -- ment, He will save you,
For He has sal -- va -- tion won.

}

wordsB = \lyricmode {
\set stanza = "2."

Come! thou wan -- derer, time is pass -- ing,
Soon the days of life are gone;
Soon will come e -- ter -- nal a -- ges,
And the tale of life be done.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Now be -- lieve in Him the Sav -- iour,
Now be -- lieve what he has done;
Then with oth -- ers tell the sto -- ry,
Je -- sus has sal -- va -- tion won.

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

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
