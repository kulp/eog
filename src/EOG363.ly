\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG363.ily"
}

\header{
  %children
  hymnnumber = "363"
  title = "The Flood"
  tunename = "Chamouni" % original has all capitals
  meter = "8. 7. 8. 7. D."
  poet = "Gordon Hayhoe" % not found at hymnary.org
  composer = "George Lomas" % see https://hymnary.org/tune/chamouni_lomas
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=140
  \key ees \major
  \partial 2
  \autoBeamOff
}

patternA = { c4 c | c2. c4 c c | } % s2 s
patternB = { c4 c | c c c2. c4 | } % s1

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { ees f | g aes g f } f2 ees
  \changePitch \patternA { g aes | bes ees d c } bes1
  \changePitch \patternA { bes des | c bes aes g } bes2 aes
  \changePitch \patternA { g f | ees f g a } bes1
  \changePitch \patternA { bes bes | bes bes aes g } bes2 aes
  \changePitch \patternA { g f | ees f g ees } g2( f)
  \changePitch \patternA { g bes | ees ees, f g } bes2 aes
  \changePitch \patternB { g f | ees f g f | } ees1

  \bar "|."

  \eogpagebreak

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { bes bes | ees ees ees d | } d2 ees
  \changePitch \patternA { ees ees | ees ees aes aes } aes1
  \changePitch \patternA { g g | g g f e } f2 f
  \changePitch \patternA { d b | c f ees ees } d1
  \changePitch \patternA { f f | e g f e } f2 f
  \changePitch \patternA { d d | c f ees ees | } ees2( d)
  \changePitch \patternA { ees f | ees ees d e } e2 f
  \changePitch \patternB { ees c | ees ees ees d } ees1

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { g aes | bes c bes aes } aes2 g
  \changePitch \patternA { bes bes | bes bes d ees } f1
  \changePitch \patternA { ees bes | c c c c } c2 c
  \changePitch \patternA { b g | g bes g f } f1
  \changePitch \patternA { d' d | c c c c } c2 c
  \changePitch \patternA { b b | c bes bes a } bes1
  \changePitch \patternA { bes f | g bes bes bes | } c2 c
  \changePitch \patternB { bes aes | g a bes aes } g1

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { ees ees | ees ees ees ees } ees2 ees
  \changePitch \patternA { ees f | g g f ees } d1
  \changePitch \patternA { ees ees | e e c c | } f2 f
  \changePitch \patternA { g g | c, d ees c | } bes1
  \changePitch \patternA { bes bes | c c c c } f2 f
  \changePitch \patternA { g g | c, d ees c | } bes1
  \changePitch \patternA { ees d | c g' aes g | } f2 f,
  \changePitch \patternB { g aes | c c bes bes | } ees1

}
}

wordsA = \lyricmode {
\set stanza = "1."

Long a -- go a flood was com -- ing \bar "."
On the world with e -- vil filled, \bar "."
But a man of faith, named No -- ah, \bar "."
Warned of God, an ark did build. \bar "."
Years passed by, while God in pa -- tience, \bar "."
Wait -- ed ere the flood be -- gan; \bar "."
No -- ah preached, and warned, and plead -- ed, \bar "."
Tell -- ing of God’s gra -- cious plan. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Boys and girls, and men, and wo -- men,
Laughed and scoffed at what they heard;
Chose to fol -- low sin -- ful pleas -- ures,
Thought -- less of the warn -- ing word.
But at last— the ark com -- plet -- ed—
Time had come for rain to fall;
Birds and beasts by twos and sev -- ens,
Gath -- ered in, with food for all.

}

wordsC = \lyricmode {
\set stanza = "3."

Creep -- ing things were not for -- got -- ten.
Two of each were shel -- tered there—
For while fool -- ish men are scoff -- ing,
Lit -- tle things will show God’s care!
No -- ah too, and all his house -- hold,
Safe -- ly o’er the thresh -- old passed; % original has "treshold"
Then God shut the door up -- on them—
Judg -- ment’s day had come at last.

}

wordsD = \markuplist {

\line { Rain came down, and floods of water }
\line { { \hspace #2 } Covered hills and mountains o’er, }
\line { All were drowned outside the shelter, }
\line { { \hspace #2 } Just as Noah warned before. }
\line { But the ark, and all within it, }
\line { { \hspace #2 } Calmly rose above the tide; }
\line { Judgment’s storms can never reach them }
\line { { \hspace #2 } Who in God’s own Word confide! }

}

wordsE = \markuplist {

\line { God has warned of greater sorrows, }
\line { { \hspace #2 } He has told of judgment sore }
\line { Which will fall on Christ-rejectors }
\line { { \hspace #2 } When the day of grace is o’er. }
\line { But His only Son once suffered, }
\line { { \hspace #2 } He for us the judgment bore; }
\line { Those who come to Him are sheltered }
\line { { \hspace #2 } By His blood, forevermore. }

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

\markup { \fill-line { \vcenter \column {
  \vspace #1
  \line{ \bold 4 \column { \wordsD } }
  \vspace #0.8
  \line{ \bold 5 \column { \wordsE } }
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
