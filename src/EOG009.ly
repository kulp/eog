\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  page-count = ##f
}

\header{
  title = "Redeemed By Blood"
  subsubtitle = "(Ernan. L. M.)"
  %meter = "L.M."
  %poet = ""
  composer = "Dr. L. Mason"
  %copyright = ""
  tagline = ##f
}

patternA = { c2 c4 c4 | c2 c2 | c4( c4) c4( c4) | c1 } % Soprano lines 1, 3
patternB = { c2 c4 c4 | c2 c4( c4) | c4( c4) c4( c4) | c1 } % Soprano lines 2, 4 ; Alto line 4 ; Tenor line 2
patternC = { c2 c4 c4 | c2 c2 | c2 c2 | c1 } % Alto lines 1, 3 ; Tenor lines 1, 3, 4 ; Bass lines 1, 3, 4
patternD = { c2 c4 c4 | c2 c4( c4) | c2 c4( c4) | c1 } % Alto line 2
patternE = { c2 c4 c4 | c2 c2 | c4( c4) c2 | c1 } % Bass line 2

global = {
  \include "common/overrides.ily"
  %\autoBeamOff
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  \once \override Score.MetronomeMark #'transparent = ##t
  \tempo 4 = 120
  \key bes \major
  %\partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { f d ees | f bes   | bes a g a | bes }
  \changePitch \patternB { g g g   | f f a   | c bes a g | f   }
  \changePitch \patternA { f d ees | f bes   | bes a g a | bes }
  \changePitch \patternB { g g g   | f bes d | d c bes a | bes }
	\bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternC { d bes c           | d f       | ees ees | d }
  \changePitch \patternD { ees ees ees       | d c f     | f f e   | f }
  \changePitch \patternC { d bes c           | d f       | ees ees | d }
  \changePitch \patternB { ees ees ees d d f | f ees d c | d       }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternC { bes bes bes | bes d   | c c       | bes }
  \changePitch \patternB { bes bes bes | bes a c | c d c bes | a   }
  \changePitch \patternC { bes bes bes | bes d   | c c       | bes }
  \changePitch \patternC { bes bes bes | bes bes | f f       | f   }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternC { bes, bes bes | bes bes | f' f     | bes, }
  \changePitch \patternE { ees ees ees  | bes f'  | a, bes c | f    }
  \changePitch \patternC { bes, bes bes | bes bes | f' f     | bes, }
  \changePitch \patternC { ees ees ees  | bes bes | f' f     | bes, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

  Re -- deemed by blood, the work of love, \bar "."
  A -- maz -- ing truth, the blood of One \bar "." \break
  Whose place was right -- ful -- ly a -- bove, \bar "."
  Co -- e -- qual on the Fa -- ther’s throne.

}

wordsB = \lyricmode {
\set stanza = "2."

  No vic -- tim of in -- fe -- rior worth
  Could ward the stroke that jus -- tice aimed;
  For none but He, in heav’n or earth,
  Could of -- fer that which jus -- tice claimed.
}

wordsC = \lyricmode {
\set stanza = "3."

  But He, the Lord of glo -- ry, came,
  Up -- on the cross He bowed His head;
  He suf -- fered pain, He suf -- fered shame,
  And lay a pris -- ’ner with the dead.

}

wordsD = \lyricmode {
\set stanza = "4."

  But lo! He’s ris -- en from the grave,
  And bears the great -- est, sweet -- est name,
  The Lord al -- might -- y now to save,
  From sin, from death, from end -- less shame.

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
      %\context Lyrics = five  \lyricsto sopranos \wordsE
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

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
