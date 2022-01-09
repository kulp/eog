\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "237"
  title = "Lord, Thy Love Has Sought and Found Us"
  tunename = "Even Me"
  meter = "8. 7. 8. 7. 7. 7."
  poet = "J. J. Hopkins" % see https://hymnary.org/text/lord_thy_love_has_sought_and_found_us
  composer = "William B. Bradbury"% see https://hymnary.org/tune/lord_i_hear_of_showers_of_bless_bradbury
  tagline = ##f
}

ta = { \tempo 4=130 }
tb = { \tempo 4=65 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key aes \major
  \autoBeamOff
}

patternA = { \ta c2 c4 }
patternB = { \ta c2 c4 c2 c4 | c2 c4 c2. }
patternC = { \ta c2 c4 c2 c4 | c2 c4 \tb c2.\fermata }
patternD = { \ta c2 c4 c2 c4 | \tb c2\fermata c4\fermata c2.\fermata }
patternE = {     c2 c4 c2 c4 | c2 c4     c2._\fermata }
patternF = {     c2 c4 c2 c4 |     c2_\fermata c4_\fermata c2._\fermata }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { c des ees aes, | des c c bes }
  \changePitch \patternB { bes c des bes | aes g aes }
  \changePitch \patternA { c des ees aes, | des c c bes }
  \changePitch \patternB { bes c des bes | aes g aes }

  \changePitch \patternC { ees' c ees c | c aes c }
  \changePitch \patternD { c des ees aes, | c bes aes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { ees ees ees ees | ees ees ees ees }
  \changePitch \patternB { ees ees f f | ees ees ees }
  \changePitch \patternA { ees ees ees ees | ees ees ees ees }
  \changePitch \patternB { ees ees f f | ees ees ees }

  \changePitch \patternB { aes ees aes ees | ees ees aes }
  \changePitch \patternB { ees f ees ees | aes g aes }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { aes bes c c | bes aes aes g }
  \changePitch \patternB { g aes aes des | c bes c }
  \changePitch \patternA { aes bes c c | bes aes aes g }
  \changePitch \patternB { g aes aes des | c bes c }

  \changePitch \patternB { c aes c c | ees c ees }
  \changePitch \patternB { aes, aes aes c | ees des c }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { aes aes aes aes | g aes ees ees }
  \changePitch \patternB { ees aes des, des | ees ees aes, }
  \changePitch \patternA { aes' aes aes aes | g aes ees ees }
  \changePitch \patternB { ees aes des, des | ees ees aes, }

  \changePitch \patternE { aes' aes aes aes | < aes aes, > < aes aes, > < aes aes, > }
  \changePitch \patternF { aes des, c aes' | ees ees aes, }

}
}

% original has "refrain" but the term "refrain" is a bit strained, especially
% when verses 4-7 are not formatted in the original with refrains

wordsA = \lyricmode {
\set stanza = "1."

Lord, Thy love has sought and found us \bar "."
Wan -- d’ring in this des -- ert wide, \bar "."
Thou hast thrown Thine arms a -- round us, \bar "."
For us suf -- fered, bled and died: \bar "."
Sing, my soul, He lov -- ed thee, \bar "."
Je -- sus gave Him -- self for me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Hark! what sounds of bit -- ter weep -- ing,
From yon lone -- some gar -- den sweep?
’Tis the Lord His vig -- il keep -- ing,
Whilst His fol -- l’wers sink in sleep.
Ah, my soul, He lov -- ed thee,
Yes, He gave Him -- self for me.

}

wordsC = \lyricmode {
\set stanza = "3."

He is speak -- ing to His Fa -- ther,
Tast -- ing deep that bit -- ter cup,
Yet He takes it, will  -- ing rath -- er
For our sakes to drink it up.
Oh what love! He lov -- ed me!
Gave Him -- self, my soul, for thee.

}

wordsD = \markuplist {

\line { Then that closing scene of anguish; }
\line { { \hspace #2 } All God’s waves and billows roll }
\line { Over Him; there left to languish }
\line { { \hspace #2 } On the cross, to save my soul. }
\line { { \hspace #4 } Matchless love! how vast! how free! }
\line { { \hspace #4 } Jesus gave Himself for me. }

}

wordsE = \markuplist {

\line { Hark again! His cries are waking }
\line { { \hspace #2 } Echoes on dark Calvary’s hill; }
\line { God, my God, art Thou forsaking }
\line { { \hspace #2 } Him who always did Thy will? }
\line { { \hspace #4 } Ah, my soul, it was for thee; }
\line { { \hspace #4 } Yes, He gave Himself for me. }

}

wordsF = \markuplist {

\line { Lord, we joy, Thy toils are ended, }
\line { { \hspace #2 } Glad Thy suffering time is o’er; }
\line { To Thy Father’s throne ascended, }
\line { { \hspace #2 } There Thou liv’st to die no more. }
\line { { \hspace #4 } Yes, my soul, He lives for thee, }
\line { { \hspace #4 } He who gave Himself for me. }

}

wordsG = \markuplist {

\line { Lord, we worship and adore Thee }
\line { { \hspace #2 } For Thy rich, Thy matchless grace, }
\line { Perfect soon in joy before Thee, }
\line { { \hspace #2 } We shall see Thee face to face. }
\line { { \hspace #4 } Yet e’en now our song shall be, }
\line { { \hspace #4 } Jesus gave Himself for me. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesTenor \notesBass
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\noPageBreak

\markup { \fontsize #0.3 \vcenter \column {
  \vspace #1
  \fill-line {
    \null
    \column {
    \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
    \line{ \bold 5 \column { \wordsE } }
    }
    \null
    \column {
    \line{ \bold 6 \column { \wordsF } } \combine \null \vspace #0.4
    \line{ \bold 7 \column { \wordsG } }
    }
    \null
  }
} }

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
