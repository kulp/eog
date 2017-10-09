\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG006.ily"
}

\header{
  %gospel
  hymnnumber = "6"
  title = "“Come Unto Me”"
  tunename = ""
  meter = "10. 10. 10. 10. with Refrain"
  poet = "Nathaniel Norton"
  composer = "George C. Stebbins"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=84 }
tb = { \tempo 4=42 }
tc = { \tempo 4=21 }

patternA = { \ta c4 c8. c16       | c4. c8        | c8. c16 c8 c8    | c4. c8                     } % Line 1, 3
patternB = { \ta c4 c8. c16       | c4 c4         | c8. c16 c8 c8    | c4. c8                     } % Line 2
patternC = { \ta c4 c8 c8         | c8. c16 c8 c8 | c4 c4            | c4. c8                     } % Line 4

patternR = { \ta c4. ~ c8 c8 c8   | c4. ~ c4.     | c4. ~ c8 c8 c8   | c4. ~ c4 c8                } % Refrain soprano / alto / tenor 1
patternS = { \ta c4. ~ c8 c8 c8   | c4. c4.       | c4 c8 c4 c8      | c4.( c4) c8                } % Refrain soprano / tenor 2
patternZ = { \ta c4. ~ c8 c8 c8   | c4. c4.       | c4 c8 c4 c8      | c4. ~ c4 c8                } % Refrain alto 2
patternT = { \ta c4 c8 c8[ c8] c8 | c4. ~ c4.     | c4 c8 c8[ c8] c8 | c4.( \tb c4.) \fermata     } % Refrain soprano 3
patternU = { \ta c4 c8 c4 c8      | c4. ~ c4.     | c4 c8 c4 c8      | c4 c8 c4( \tc c8) \fermata } % Refrain alto 3
patternV = { \ta c4 c8 c8[ c8] c8 | c4 c8 c4( c8) | c4 c8 c8[ c8] c8 | c4 c8 c4( \tc c8) \fermata } % Refrain tenor 3
patternW = { \ta c4. c4 c8        | c4. c4.       | c4. c4 c8        | c4. ~ c4 c8                } % Refrain bass 1
patternX = { \ta c4. c4 c8        | c4. c4.       | c4 c8 c4 c8      | c4. ~ c4 c8                } % Refrain bass 2
patternY = { \ta c4 c8 c4 c8      | c4. ~ c4.     | c4 c8 c4 c8      | c4. ~ \tb c4. \fermata     } % Refrain bass 3
patternZ = { \ta c4. ~ c8 c8 c8   | c4. c4.       | c4 c8 c4 c8      | c4. ~ c4 c8                } % Refrain alto 2

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t
  \ta
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { g ees f   | g g          | aes aes aes aes | g r   }
  \changePitch \patternB { bes c bes | g ees        | ees ees f g     | f r   }
  \changePitch \patternA { g ees f   | g g          | aes aes bes aes | g r   }
  \changePitch \patternC { bes aes g | c ees, ees f | g f             | ees r }

  \time 6/8
  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternR { g g f g           | bes bes | bes bes c bes   | ees ees r } >>
  \changePitch \patternS { ees ees d c       | bes g   | aes aes aes aes | aes g r   }
  \changePitch \patternT { bes bes bes c bes | g^\markup{\italic{ritard.}} g     | g g g aes g     | ees ees   }


  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { ees bes bes | ees ees       | ees ees ees ees | ees r }
  \changePitch \patternB { ees ees ees | ees bes       | c c c ees       | d r   }
  \changePitch \patternA { ees bes bes | ees ees       | ees ees ees ees | ees r }
  \changePitch \patternC { ees d ees   | ees c ees ees | ees d           | ees r }

  \changePitch \patternR { ees ees ees ees | g g     | aes aes aes aes | bes bes r     }
  \changePitch \patternZ { aes aes aes ees | ees ees | f f f ees       | ees ees r     }
  \changePitch \patternU { ees ees ees ees | ees ees | ees ees ees ees | bes bes c bes }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes g aes   | bes bes       | c c c c   | bes r }
  \changePitch \patternB { g aes g     | bes g         | g bes a a | bes r }
  \changePitch \patternA { bes g aes   | bes bes       | c c d c   | bes r }
  \changePitch \patternC { bes bes bes | aes aes c ces | bes aes   | g r   }

  \changePitch \patternR { bes bes aes bes | ees ees       | d d d d           | ees ees r }
  \changePitch \patternS { c c bes aes     | g bes         | bes ees d c       | c bes r   }
  \changePitch \patternV { g g g aes g     | bes bes c bes | bes bes bes c bes | g g aes g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { ees ees ees | ees ees          | ees ees ees ees | ees r  }
  \changePitch \patternB { ees ees ees | ees ees          | c c f f         | bes, r }
  \changePitch \patternA { ees ees ees | ees ees          | ees ees ees ees | ees r  }
  \changePitch \patternC { g f ees     | aes, aes aes aes | bes bes         | ees r  }

  \changePitch \patternW { ees ees ees     | ees ees | f f f           | g g r     }
  \changePitch \patternX { aes aes aes     | ees ees | bes bes bes bes | ees ees r }
  \changePitch \patternY { ees ees ees ees | ees ees | ees ees ees ees | ees ees   }

}
}

Refrain = \lyricmode {

  “Come un -- to Me,” “come un -- to Me,” \bar "."
  “Come un -- to Me, and I will give you rest,” \bar "."
  I will give you rest, I will give you rest. \bar "."

}

BassRefrainA = \lyricmode {

  \override LyricText.font-size = #-2
  \override LyricHyphen.thickness = #0.7
  \repeat unfold 40 { \skip 4 }
  “Come un -- to Me,” “Oh come un -- to Me,”
  “Come un -- to Me, and

}

TenorRefrainA = \lyricmode {

  \override LyricText.font-size = #-2
  \override LyricHyphen.thickness = #0.7
  \repeat unfold 58 { \skip 4 }
  I will give, will give you rest.
  I will give, will give you rest.

}

wordsA = \lyricmode {
\set stanza = "1."

  “Come un -- to Me.” It is the Sav -- iour’s voice_– \bar "."
  The Lord of life, who bids thy heart re -- joice; \bar "."
  O wear -- y heart, with heav -- y cares op -- pressed, \bar "."
  “Come un -- to Me,” and I will give you rest. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

  Wear -- y with life’s long strug -- gle, full of pain,
  O doubt -- ing soul, thy Sav -- iour calls a -- gain;
  Thy doubts shall van -- ish, and thy sor -- rows cease:
  “Come un -- to Me,” and I will give you peace.

  \Refrain
}

wordsC = \lyricmode {
\set stanza = "3."

  O dy -- ing man, with guilt and sin dis -- mayed,
  With con -- science wak -- ened, of thy God a -- fraid;
  ’Twixt hopes and fears_– oh, end the anx -- ious strife!
  “Come un -- to Me,” and I will give you life.

}

wordsD = \lyricmode {
\set stanza = "4."

  Life, rest and peace, the flow’rs of death -- less bloom,
  The Sav -- iour gives us_– not be -- yond the tomb,
  But here, and now, on earth, the taste is giv’n
  Of joys which wait us thro’ the gates of heaven.

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
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
    >>
  \new Lyrics \with { alignAboveContext = men } \lyricsto tenors \TenorRefrainA
  \new Lyrics \with { alignBelowContext = men } \lyricsto basses \BassRefrainA
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
