\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG359.ily"
}

\header{
  %children
  hymnnumber = "359"
  title = "Those Who Are Young, O God"
  tunename = "Bethany II"
  meter = "6. 4. 6. 4. 6. 6. 6. 4."
  poet = "A. Midlane"
  composer = "L. Mason"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=90
  \key g \major
  \autoBeamOff
}

patternA = { c1 c2. c4 | c2. c4 c1 | }
patternB = { c1 c2 c2 | c\breve | }
patternC = { c2( c2) c2 c2 | c\breve | }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { b a g | g e e }
  \changePitch \patternB { d g b | a }
  \changePitch \patternA { b a g | g e e }
  \changePitch \patternC { d g fis a | g }
  \changePitch \patternA { d' e d | d b d }
  \changePitch \patternA { d e d | d b a }
  \changePitch \patternA { b a g | g e e }
  \changePitch \patternC { d g fis a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d c b | e c c }
  \changePitch \patternB { d d d | d }
  \changePitch \patternA { d c b | e c c }
  \changePitch \patternC { b d d d | d }
  \changePitch \patternA { g g g | g g g }
  \changePitch \patternA { g g g | d d d }
  \changePitch \patternA { d c b | e c c }
  \changePitch \patternC { b d d d | d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { g fis g | c g g }
  \changePitch \patternB { b g g | fis }
  \changePitch \patternA { g fis g | c g g }
  \changePitch \patternC { g b a c | b }
  \changePitch \patternA { b c b | b g b }
  \changePitch \patternA { b c b | a g fis }
  \changePitch \patternA { g fis g | c g g }
  \changePitch \patternC { g b a c | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { g d e | c c c }
  \changePitch \patternB { g b g | d' }
  \changePitch \patternA { g d e | c c c }
  \changePitch \patternB { d d d | g, }
  \changePitch \patternA { g' g g | g g g }
  \changePitch \patternA { g c, g' | fis g d }
  \changePitch \patternA { g d e | c c c }
  \changePitch \patternB { d d d | g, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Those who are young, O God, \bar "."
Make them Thine own; \bar "."
Hear from Thy blest a -- bode, \bar "."
Make them Thine own; \bar "."
Now in their ear -- ly days, \bar "."
Turn them to Thy blest ways, \bar "."
Save from the gid -- dy maze, \bar "."
Make them Thine own. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Those who are old -- er too,
Make them Thine own;
Give them af -- fec -- tions new,
Make them Thine own;
Now, in their man -- hood’s prime,
Now, in sal -- va -- tion’s time,
To Thee their hearts in -- cline,
Make them Thine own.

}

wordsC = \lyricmode {
\set stanza = "3."

Those who in years a -- bound,
Make them Thine own;
Now may the lost be found,
Make them Thine own;
Soon must their jour -- ney end,
Fast to the grave they wend;
Fa -- ther, their souls be -- friend,
Make them Thine own.

}

wordsD = \lyricmode {
\set stanza = "4."

Then shall they hap -- py be,
All made Thine own;
Shout then the vic -- to -- ry,
All, all Thine own!
Sa -- tan shall lose his prey,
Mer -- cy shall win the day;
Each shall with rap -- ture say,
“All, all Thine own!”

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
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
