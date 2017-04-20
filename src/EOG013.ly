\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  hymnnumber = "13"
  title = "Grace! ’Tis a Charming Sound"
  tunename = ""
  meter = "S. M. and Refrain."
  poet = "Dr. Philip Doddridge"
  composer = "Ira D. Sankey"
  %copyright = ""
  tagline = ##f
}

phraseA = { c4. c8 c8 c8 | c2 }
% for fermata in MIDI
% TODO make four fermatas (in typesetting) two
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternA = { \ta c4           | c4. c8 c8 c8 | c2           } % Line 1, 2
patternB = { \ta c4. c8 c8 c8 | c8 c8 \tb c4 \fermata } % Refrain line 3
patternC = { \ta c4           | \patternB                   } % Line 3
patternD = { \ta c4. c8 c8 c8 | c2 c4                       } % Refrain line 1, 2
patternE = { \ta c4           | \patternD                   } % Line 4
patternF = { \ta c4           | c4. c8 c8 c8 | \tb c2 \fermata } % Refrain line 4

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { a | a gis b a  | fis     }
  \changePitch \patternA { d | e fis g a  | fis     }
  \changePitch \patternC { a | a a g fis  | b cis d }
  \changePitch \patternE { b | a d, e fis | d r     }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternD {     d' d e cis | d r       } >>
  \changePitch \patternD {     b d cis b  | a r       }
  \changePitch \patternB {     a a g fis  | b cis d   }
  \changePitch \patternF { b | a d, e fis | d         }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d | d d d d     | d       }
  \changePitch \patternA { d | cis d e cis | d       }
  \changePitch \patternC { d | d d cis d   | d g fis }
  \changePitch \patternE { d | d d cis cis | d r     }

  \changePitch \patternD {     fis fis g e | fis r   }
  \changePitch \patternD {     g b a g     | fis r   }
  \changePitch \patternB {     d d cis d   | d g fis }
  \changePitch \patternF { d | d d cis cis | d       }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { fis | fis eis g fis | a     }
  \changePitch \patternA { fis | a a a a       | a     }
  \changePitch \patternC { fis | fis a a d     | d a a }
  \changePitch \patternE { g   | fis fis g a   | fis r }

  \changePitch \patternD {     a a b a     | a r   }
  \changePitch \patternD {     d d d d     | d r   }
  \changePitch \patternB {     fis, a a d  | d a a }
  \changePitch \patternF { g | fis fis g a | fis   }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { d  | d d d d   | d     }
  \changePitch \patternA { d  | a a a a   | d     }
  \changePitch \patternC { d  | d fis e d | g e d }
  \changePitch \patternE { g, | a a a a   | d r   }

  \changePitch \patternD {      d d g, a  | d r   }
  \changePitch \patternD {      g, g g g  | d' r  }
  \changePitch \patternB {      d fis e d | g e d }
  \changePitch \patternF { g, | a a a a   | d     }

}
}

Refrain = \lyricmode {

Saved by grace a -- lone, \bar "."
This is all my plea; \bar "."
Je -- sus died for all man -- kind, \bar "."
And Je -- sus died for me. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Grace! ’tis a charm -- ing sound, \bar "."
Har -- mo -- nious to the ear; \bar "." \break
Heav’n with the ech -- o shall re -- sound, \bar "."
And all the earth shall hear. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

Grace first con -- trived a way
To save re -- bel -- lious man;
And all the steps that grace dis -- play,
Which drew the won -- drous plan.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Grace taught my rov -- ing feet
To tread the heav’n -- ly road;
And new sup -- plies each hour I meet,
While press -- ing on to God.

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
      %\context Lyrics = four  \lyricsto sopranos \wordsD
      %\context Lyrics = five  \lyricsto sopranos \wordsE
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
