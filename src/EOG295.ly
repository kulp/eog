\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
}

\header{
  hymnnumber = "295"
  title = "Hark! The Voice of Jesus Calling"
  tunename = "Evening Prayer"
  meter = "8. 7. 8. 7. 4. 7."
  poet = "A Midlane"
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 a | b4 g c b | b2 a |
  g4 c b a | g2 fis | g1 | \eogpagebreak
  g2 a | b4 g c b | b2 a |
  g4 c b a | g2 fis | g1 |

  << s^\markup { \small \caps "Refrain" }
  { d'2 e | d b | d e | d b | } >>
  g4 a b a | g2 fis | g1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 fis | g4 d d d | g2 fis |
  e4 e g e | d2 d | d1 |
  d2 fis | g4 d d d | g2 fis |
  e4 e g e | d2 d | d1 |

  g2 g | g g | g g | g g |
  d4 fis g e | d2 d | d1 |

}
}

notesTenor = {
\global
\relative a {

  b2 d | d4 b a g | d'2 d |
  b4 a d c | b2 a4( c) | b1 |
  b2 d | d4 b a g | d'2 d |
  b4 a d c | b2 a4( c) | b1 |

  b2 c | b d | b c | b d |
  d4 d d c | b2 a4( c) | b1 |

}
}

notesBass = {
\global
\relative f {

  g2 d | g4 b fis g | d2 d |
  e4 a, b c | d2 d | g,1 |
  g'2 d | g4 b fis g | d2 d |
  e4 a, b c | d2 d | g,1 |

  g'2 c, | g' g | g c, | g' g |
  b4 a g c, | d2 d | g,1 |

}
}

Refrain = \lyricmode {

“Take sal -- va -- tion, %{HIDE>%} take -- sal -- va -- tion– %{<HIDE%} \bar "." % meter says 8.7.8.7.4.7., so put only four syllables in lyrics
Take it now and hap -- py be.” \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Hark! the voice of Je -- sus call -- ing– \bar "."
“Come, ye chil -- dren, come to Me; \bar "." \eogbreak
I have rest and peace to of -- fer, \bar "."
Rest, dear chil -- dren, now for thee.” \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Yes; tho’ high in heav’n -- ly glo -- ry,
Still the Sav -- iour calls to thee;
Faith can hear His gra -- cious ac -- cents–
“Come, dear chil -- dren, come to Me.”

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Soon that voice will cease its call -- ing,
Now it speaks and speaks to thee;
Chil -- dren, heed the gra -- cious mes -- sage–
To the blood for ref -- uge flee:

}

wordsD = \lyricmode {
\set stanza = "4."

Life is found a -- lone in Je -- sus,
On -- ly there ’tis of -- fered thee–
Of -- fered with -- out price or mon -- ey,
’Tis the gift of God sent free.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
