\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  hymnnumber = "262"
  title = "Satisfied with Thee"
  tunename = ""
  meter = "P. M."
  poet = "Miss C. A. Wellesley" % see https://hymnary.org/text/satisfied_with_thee_lord_jesus_i_am_bles
  composer = "Mrs. E. Milne" % or Henry Bennett : see https://hymnary.org/tune/satisfied_with_thee_lord_jesus_bennett
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  e4 f g a | g a b c |
  e2 c | d1 |
  e,4 f g a | g a b c |
  e2 f4( e) | d1 |
  c2. c4 | c4 b2. |
  d2. d4 | d c2. |
  e2. e4 | f2 a, |
  g4( e'2) d4 | c1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  c4 c c c | e f f g
  g2 fis | g1 |
  c,4 b c c | c c f e |
  g2 a | g1 |
  e2. e4 | e d2. |
  f2. f4 | f4 e2. |
  g2. bes4 | a2 f |
  e4( g2) f4 | e1 |

}
}

notesTenor = {
\global
\relative a {

  g4 a e f | c' c g c |
  c2 d2 | b1 |
  g4 g g f | g f g g |
  c2 c | b1 |
  g2. g4 | g4 g2. |
  b2. b4 | b c2. |
  c2. c4 | c2 d |
  c2. b4 | c1 |

}
}

notesBass = {
\global
\relative f {

  c4 c c c | c f d e |
  c2 a' | g1 |
  c,4 d e f | e f d c |
  c2 f | g1 |
  c,2. c4 | g4 g2. |
  g'2. g4 | g c,2. |
  c2. c4 | f2 d |
  g2. g4 | c,1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Sat -- is -- fied with Thee, Lord Je -- sus, \bar "."
I am blest; \bar "."
Peace which pass -- eth un -- der -- stand -- ing, \bar "."
On Thy breast; \bar "."
No more doubt -- ing, \bar "."
No more trem -- bling, \bar "."
No more trem -- bling, \bar "."
Oh, what rest! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Oc -- cu -- pied with me, Lord Je -- sus,
In Thy grace;
All Thy ways and thoughts a -- bout me,
On -- ly trace
Deep -- er sto -- ries
Of the glo -- ries,
Of the glo -- ries
Of Thy grace.

}

wordsC = \lyricmode {
\set stanza = "3."

Ta -- ken up with Thee, Lord Je -- sus,
I would be;
Find -- ing joy and sat -- is -- fac -- tion
All in Thee;
Thou the near -- est
And the dear -- est,
And the dear -- est
Un -- to me.

}

wordsD = \lyricmode {
\set stanza = "4."

List -- ’ning for Thy shout, Lord Je -- sus,
In the air;
When Thy saints shall rise, with joy, to
Meet Thee there.
Oh, what glad -- ness!
No more sad -- ness,
No more sad -- ness,
Sin nor care.

}

wordsE = \markuplist {

\line { Longing for the bride, Lord Jesus, }
\line { { \hspace #4 } Of Thy heart; }
\line { To be with Thee in the glory, }
\line { { \hspace #4 } Where Thou art. }
\line { { \hspace #2 } Love so groundless, }
\line { { \hspace #2 } Grace so boundless, }
\line { { \hspace #2 } Grace so boundless }
\line { { \hspace #4 } Wins my heart. }

}

wordsF = \markuplist {

\line { When Thy blood-bought church, Lord Jesus, }
\line { { \hspace #4 } Is complete; }
\line { When each soul is safely landed }
\line { { \hspace #4 } At Thy feet; }
\line { { \hspace #2 } What a story }
\line { { \hspace #2 } In the glory, }
\line { { \hspace #2 } In the glory }
\line { { \hspace #4 } She’ll repeat. }

}

wordsG = \markuplist {

\line { Oh, to praise Thee there, Lord Jesus, }
\line { { \hspace #4 } Evermore! }
\line { Oh, to grieve and wander from Thee }
\line { { \hspace #4 } Nevermore! }
\line { { \hspace #2 } Earth’s sad story }
\line { { \hspace #2 } Closed in glory, }
\line { { \hspace #2 } Closed in glory }
\line { { \hspace #4 } On yon shore. }

}

wordsH = \markuplist {

\line { Then Thy church will be, Lord Jesus, }
\line { { \hspace #4 } The display }
\line { Of God’s richest grace and kindness }
\line { { \hspace #4 } In that day; }
\line { { \hspace #2 } Marking pages, }
\line { { \hspace #2 } Wondrous stages, }
\line { { \hspace #2 } Wondrous stages, }
\line { { \hspace #4 } O’er earth’s way.}

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

\noPageBreak

\markup { \fontsize #0.3 \vcenter \column {
  \vspace #1
  \fill-line {
    \null
    \column {
    \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
    \line{ \bold 6 \column { \wordsF } }
    }
    \null
    \column {
    \line{ \bold 7 \column { \wordsG } } \combine \null \vspace #0.4
    \line{ \bold 8 \column { \wordsH } }
    }
    \null
  }
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
