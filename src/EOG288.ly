\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  system-system-spacing.padding = 11
}

\header{
  %gospel
  hymnnumber = "288"
  title = "Rise, My Soul! Behold, ’Tis Jesus"
  tunename = "Sicilian Mariners"
  meter = "8. 7. 8. 7."
  poet = "J. Denham Smith"
  composer = "Sicilian Air"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  c4 d | c8.[ bes16] a8[ bes] | c4 d | c8.[ bes16] a8 r8 |
  c4 c | d e8[ f] | e4 d | c2 |
  g8.[ a16] g8.[ a16] | bes4 bes | a8.[ bes16] a8.[ bes16] c4 c |
  f8[ e] d[ c] | f[ d] c[ bes] | a4 g | f2 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f4 f | f f | f f | f f8 r |
  f4 g | g g8[ a] | g4. f8 | e2 |
  e8.[ f16] e8.[ f16] | e8[ d] c[ e] | f4 f | f8[ e] f[ g] |
  f4 f | f8[ g] a8[ f] | f4 e | f2 |

}
}

notesTenor = {
\global
\relative a {

  a4 bes | a8.[ g16] f8[ g] | a4 bes | a8.[ g16] f8 r |
  a4 c | b c | c b | c2 |
  c4 bes8.[ a16] | g8[ f] e[ g] | a8.[ d16] c8.[ bes16] | a8[ bes] a[ g] |
  a4 bes8[ c] | d[ e] f[ d] | c4 c8[ bes] | a2 |

}
}

notesBass = {
\global
\relative f {

  f4 f | f f | f f | f f8 r |
  f4 e | d c8[ f] | g4 g, | c2 |
  c4 c | c c | f f | f8[ g] f[ e] |
  d8[ c] bes[ a] | bes4 a8[ bes] | c4 c | f2 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Rise, my soul! Be -- hold, ’tis \italicsOn Je -- sus, \bar "."
Je -- sus \italicsOff fills thy won -- d’ring eyes; \bar "."
See Him now, in glo -- ry seat -- ed, \bar "."
Where thy sins no more can rise. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

There in right -- eous -- ness tran -- scend -- ent,
Lo! He doth in heaven ap -- pear,
Shows the \italicsOn blood of His a -- tone -- ment
As thy ti -- tle to be there. \italicsOff

}

wordsC = \lyricmode {
\set stanza = "3."

All thy sins were laid up -- on Him,
Je -- sus bore them on the tree;
God who knew them laid them on Him,
And, be -- liev -- ing, \italicsOn thou art free. \italicsOff

}

wordsD = \lyricmode {
\set stanza = "4."

God now brings thee to His dwell -- ing,
Spreads for thee His feast di -- vine,
Bids thee wel -- come, ev -- er tell -- ing
What a por -- tion there is thine.

}

wordsE = \markuplist {

\line { In that circle of God’s favor– }
\line { { \hspace #2 } Circle of the Father’s love– }
\line { All is rest, and rest forever, }
\line { { \hspace #2 } All is perfectness above. }

}

wordsF = \markuplist {

\line { Blessed, glorious word \italic forever, }
\line { { \hspace #2 } Yea, \italic forever is the word; }
\line { Nothing can the ransomed sever, }
\line { { \hspace #2 } Naught divide them from the Lord. }

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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

\markup { \fill-line {
  \null
  \column {
    \line{ \bold 5 \column { \wordsE } }
    \vspace #1
    \line{ \bold 6 \column { \wordsF } }
  }
  \null
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
