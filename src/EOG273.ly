\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 5) (#t #f))
  system-count = #(cond (is-eogsized 6) (#t #f))
}

\header{
  hymnnumber = "273"
  title = "Up Yonder, in a Heavenly Mansion"
  tunename = ""
  meter = "P. M."
  poet = "A. H. Rule"
  composer = "S. C. Foster" % Stephen Foster
  tagline = ##f
}

ta = { \tempo 4=120 }
tb = { \tempo 4=60 }

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
\relative c' {

  f2 ees8 des f ees | des4 des' bes des |
  aes2 f4 des4 | ees2. r4 | \eogbreak
  f2 ees8 des f ees | des4 des' bes des |
  aes4 f8 des ees4 ees | des2. r4 | \eogbreak
  f2 ees8 des f ees | des4 des' bes des |
  aes2 f4 des4 | ees2. r4 | \eogbreak
  f2 ees8 des f ees | des4 des' bes des |
  aes4 f8 des ees4 ees8 ~ ees8 | des2. r4 | \eogbreak

  << s^\markup { \small \caps "Refrain" }
  { c'4. des8 ees4 aes, | aes4. bes8 aes4 des } >>
  des4 bes ges bes | aes2. r4 |
  f2 ees8 des f ees | des4 des' bes \tb des\fermata \ta | % TODO make the fermata a bit longer ?
  aes4 f8 des ees4 ees8 des8 | des2. r4 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  des2 des8 des des des | des4 f ges ges |
  f2 des4 des | c2. r4 |
  des2 des8 des des des | des4 f ges ges |
  f4 des8 des c4 c | des2. r4 |
  des2 des8 des des des | des4 f ges ges |
  f2 des4 des | c2. r4 |
  des2 des8 des des des | des4 f ges ges |
  f4 des8 des c4 c8 ~ c8 | des2. r4 |

  ees4. f8 ges4 ges | f4. ges8 f4 f |
  ges4 ges ges ges | f2. r4 |
  des2 des8 des des des | des4 f ges ges |
  f4 des8 des c4 c8 des | des2. r4 |

}
}

notesTenor = {
\global
\relative a {

  aes2 ges8 f aes ges | f4 aes bes bes |
  des2 aes4 g | aes2. r4 |
  aes2 ges8 f aes ges | f4 aes bes bes |
  des4 aes8 f ges4 ges | f2. r4 |
  aes2 ges8 f aes ges | f4 aes bes bes |
  des2 aes4 g | aes2. r4 |
  aes2 ges8 f aes ges | f4 aes bes bes |
  des4 aes8 f ges4 ges8 ~ ges | f2. r4 |

  ees'4. des8 c4 ees | des4. des8 des4 aes4 |
  bes4 des des des | des2. r4 |
  aes2 ges8 f aes ges | f4 aes bes bes |
  des4 aes8 f ges4 ges8 f | f2. r4 |

}
}

notesBass = {
\global
\relative f {

  des2 des8 des des des | des4 des ges ges |
  des2 des4 bes | aes2. r4 |
  des2 des8 des des des | des4 des ges ges |
  aes4 aes8 aes aes,4 aes | des2. r4 |
  des2 des8 des des des | des4 des ges ges |
  des2 des4 bes | aes2. r4 |
  des2 des8 des des des | des4 des ges ges |
  aes4 aes8 aes aes,4 aes8 ~ aes | des2. r4 |

  aes'4. aes8 aes4 aes | des,4. des8 des4 des |
  ges4 ges bes ges | des2. r4 |
  des2 des8 des des des | des4 des ges ges_\fermata |
  aes4 aes8 aes aes,4 aes8 des | des2. r4 |

}
}

Refrain = \lyricmode {

All the world is sad and drear -- y, \bar "."
Ev -- ’ry -- where I roam: \bar "."
O Sav -- iour, how my heart grows wear -- y, \bar "."
Wait -- ing to see Thee at home. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Up yon -- der, in a heaven -- ly man -- sion, \bar "."
Far, far a -- way, \bar "."
There’s where I seek my heaven -- ly por -- tion, \bar "."
There’s where I long to stay. \bar "."
This world is all a wear -- y des -- ert; \bar "."
Stran -- ger I roam; \bar "."
I’m wait -- ing for the bless -- ed mo -- ment \bar "."
I’ll see my Sav -- { \mon } iour at { \moff } home. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

O Sav -- iour, when shall end earth’s sto -- ry?
When wilt Thou come?
When shall I see Thy heaven -- ly glo -- ry?
When dwell with Thee at home?
“A lit -- tle while” will bring sal -- va -- tion,
No more I’ll roam;
Soon I shall see my heaven -- ly man -- sion,
My own e -- ter -- nal home.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

There with my bless -- ed Lord and Sav -- iour,
In bliss un -- told,
Fill -- ing my hap -- py heart with rap -- ture,
He will His love un -- fold.
My wan -- d’rings then shall all be o -- ver,
Hap -- py I’ll be;
Oh, quick -- ly come and take me, Sav -- iour,
Ev -- er to be with Thee.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
