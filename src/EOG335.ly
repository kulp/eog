\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG335.ily"
}

\header{
  %children
  hymnnumber = "335"
  title = "I Am So Glad That Our Father in Heaven"
  tunename = ""
  meter = "10. 10. 10. 10. with Refrain"
  poet = "Philip P. Bliss" % see https://hymnary.org/text/i_am_so_glad_that_our_father_in_heaven
  composer = "Philip P. Bliss" % see https://hymnary.org/tune/i_am_so_glad_that_our_father_in_bliss
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  d8 d d d d d | d g a b4. |
  a8 a a a a g | b b a g4. |
  d8 d d d d d | d g a b4. |
  a8 a a a a g | b b a g4. | \bar ".|:-||" \eogbreak

  \repeat volta 2 {
    d'8^\markup { \small \caps "Refrain" } d d d4 b8 | a g e e4. |
    d8 d d
  } \alternative {
    { a'4. | d,8 g a b4. }
    { a4 b8 g4. ~ g }
  }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  b8 b b b b b | b b c d4. |
  d8 d d cis cis cis | d d c! b4. |
  b8 b b b b b | b b c d4. |
  d8 d d cis cis cis | d d c! b4. |

  \repeat volta 2 {
    g'8 g g d4 f8 | e e c c4. |
    c8 c c
  } \alternative {
    { c4. | b8 b c d4. }
    { c4 d8 b4. ~ b }
  }

}
}

notesTenor = {
\global
\relative a {

  g8 g g g g g | g g fis g4. |
  fis8 fis fis g g g | g g fis g4. |
  g8 g g g g g | g g fis g4. |
  fis8 fis fis g g g | g g fis g4. |

  \repeat volta 2 {
    b8 b b b4 d8 | c g g g4. |
    fis8 fis fis
  } \alternative {
    { fis4. | g8 g fis g4. }
    { fis4 fis8 g4. ~ g }
  }

}
}

notesBass = {
\global
\relative f, {

    g8 g g g g g | g b d g4. |
    d8 d d e e e | d d d g,4. |
    g8 g g g g g | g b d g4. |
    d8 d d e e e | d d d g,4. |

  \repeat volta 2 {
    g'8 g g g4 g8 | c,8 c c c4. |
    d8 d d
  } \alternative {
    { d4. | g,8 b d g4. }
    { d4 d8 g,4. ~ g }
  }

}
}

Refrain = \lyricmode {

I am so glad that Je -- sus loves me, \bar "."
Je -- sus loves me, Je -- sus loves me, %{HIDE>%} e -- ven me. %{<HIDE%} % \bar "."
%LYRICS I am so glad that Jesus loves me,
%LYRICS Jesus loves even me.

}

wordsA = \lyricmode {
\set stanza = "1."

I am so glad that our Fa -- ther in heaven \bar "."
Tells of His love in the Book He has giv’n; \bar "."
Won -- der -- ful things in the Bi -- ble I see; \bar "."
This is the dear -- est, that Je -- sus loves me. % \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Though I for -- get Him and wan -- der a -- way,
Still He does love me wher -- ev -- er I stray;
Back to His dear, lov -- ing arms would I flee
When I re -- mem -- ber that Je -- sus loves me.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus loves me, and I know I love Him,
Love brought Him down my poor soul to re -- deem;
Yes, it was love made Him die on the tree;
Oh, I am cer -- tain that Je -- sus loves me.

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
}

\include "score-EOG335.ily"

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
