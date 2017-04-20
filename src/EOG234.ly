\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "234"
  title = "Lead Me, Saviour"
  tunename = ""
  meter = "7. 7. 7. 7. and Refrain"
  poet = "F. M. Davis"
  composer = "F. M. Davis"
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key des \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  aes4.^\markup{\italic { With expression } } f8 aes8 des c bes | aes2. r4 |
  ges4. f8 ees bes' aes ges | f2. r4 |
  aes4. aes8 aes f aes des | bes2. r4 |
  c4. des8 c bes aes g | aes2.\fermata r4 |

  << s^\markup { \small \caps "Refrain" }
  { aes2 f4 r | des'2 aes4 r } >>
  f'4. ees8 des bes aes f | ees4.( f8 ges2) |
  f4. f8 f f ges aes | bes2.
  c8 des | aes4 f^\markup{\italic{rit. e dim.}} ges c, | des2. r4 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f4. des8 f bes aes ges | f8 f ges ges f4 r4 |
  ees4. des8 c ges' f ees | des des des des des4 r4 |
  f4. f8 f des f f | ges8 ges ges ges ges4 r4 |
  ees4. f8 ees des c bes | c des ees f \tb ges4\fermata \ta r4 |

  f2 des4 r | f2 f4 r |
  aes4. aes8 aes ges f des | c4.( des8 ees2) |
  des4. des8 des des c des | ges2.
  e8 e | f4 des ees aes, | aes4 bes8 bes aes4 r4 |

}
}

notesTenor = {
\global
\relative a {

  des2 des | des8 des ees ees des4 r |
  aes2 aes | aes8 aes aes aes aes4 r |
  des2 des | des8 des des des des4 r |
  aes2 ees | aes8 bes c des ees4 r |

  des2 aes4 r | aes2 des4 r |
  r4 des8 c des des des aes | aes4 aes8 aes c2 |
  r4 aes8 aes aes aes aes des | des4 des8 des des4
  des8 des | des4 aes aes ges | f4 ges8 ges f4 r |

}
}

notesBass = {
\global
\relative f {

  des2 des | des8 des c c des4 r |
  aes'2 aes, | des8 des des des des4 r |
  des2 des | ges8 ges ges ges ges4 r |
  aes2 ees | aes,8 aes aes aes aes4\fermata r4 |

  des2 des4 r | des2 des4 r |
  r4 des'8 aes f ges des des | aes4 aes8 aes aes2 |
  r4 des8 des des des ees f | ges4 ges8 ges ges4
  g8 g | aes4 aes aes, aes | des2. r4 |

}
}

% TODO refrain small words
Refrain = \lyricmode {

Lead me, lead me, \bar "."
Sav -- iour, lead me lest I stray;__ \bar "."
Gen -- tly down the stream of time, \bar "."
Lead me, Sav -- iour, all the way. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Sav -- iour, lead me, lest I stray, \bar "."
Gen -- tly lead me all the way; \bar "."
I am safe when by Thy side, \bar "."
I would in Thy love a -- bide. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Thou, the ref -- uge of my soul
When life’s storm -- y bil -- lows roll,
I am safe when Thou art nigh,
All my hopes on Thee re -- ly.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Sav -- iour, lead me, then, at last,
When the storm of life is past,
To the land of end -- less day,
Where all tears are wiped a -- way.

}

underWords = \lyricmode {
\override LyricText.font-size = #-2
\set stanza = \markup { \small "1." }

Sav -- iour, lead me, lest I stray,
Gen -- tly lead me all the way;
I am safe when by Thy side,
I would in Thy love a -- bide.

\repeat unfold 11 \skip 4
lest I stray;
\repeat unfold 7 \skip 4
stream of time,
\repeat unfold 7 \skip 4
all the way.

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
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
      \context Lyrics = four \with { alignAboveContext = men } \lyricsto tenors \underWords
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
