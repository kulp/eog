\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = #(cond (is-eogsized 5) (#t #f))
  system-count = #(cond (is-eogsized 6) (#t #f))
}

\header{
  %gospel
  hymnnumber = "114"
  title = "Saved Through the Blood of Jesus"
  tunename = "Heart’s Refuge"
  meter = "7. 6. 7. 6. D. with Refrain"
  poet = "H. d’A. Champney"
  composer = "W. H. Doane"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a4 g8. f16 c4 f | a4.( bes8) a2 |
  c4 d8. c16 a4 f | g2 ~ g4 r4 |

  a4 g8. f16 c4 f | a4.( bes8) c2 |
  c8[ bes] a g f4 e | f1 |

  g4 g8. a16 g4 g | g2 c |
  b4 b8. b16 a4 g | g2( c) |

  g4 g8. a16 g4 c | c2 a |
  g4 b8. c16 d4 b | c2( bes) |

  << s^\markup { \small \caps "Refrain" }
  { a4 g8. f16 c4 f | a4.( bes8) a2 | } >>
  c4 d8. c16 a4 f | g2 ~ g4 r4 |

  a4 g8. f16 c4 f | a4.( bes8) c2 |
  c8[ bes] a g f4 e | f1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f4 c8. c16 c4 c | f2 f |
  f4 f8. f16 f4 f | e2 ~ e4 r4 |

  f4 c8. c16 c4 c | f2 ees |
  d4 d8 d c4 c | c1 |

  e4 e8. f16 e4 e | e2 e |
  d4 f8. f16 f4 f | e1 |

  e4 e8. f16 e4 e | f2 f |
  e4 d8. e16 f4 d | e4( f g2) |

  f4 c8. c16 c4 c | f2 f |
  f4 f8. f16 f4 f | e2 ~ e4 r4 |

  f4 c8. c16 c4 c | f2 ees |
  d4 d8 d c4 c | c1 |

}
}

notesTenor = {
\global
\relative a {

  c4 bes8. a16 a4 a | c4.( d8) c2 |
  a4 bes8. a16 c4 a | c2 ~ c4 r4 |

  c4 bes8. a16 a4 a | c2 f, |
  f4 c'8 bes a4 g | a1 |

  c4 c8. c16 c4 c | c2 g |
  g4 d'8. d16 c4 b | c2( g) |

  c4 c8. c16 c4 bes! | a2 c |
  c4 g8. g16 g4 g | g2( c) |

  c4 bes8. a16 a4 a | c4.( d8) c2 |
  a4 bes8. a16 c4 a | c2 ~ c4 r4 |

  c4 bes8. a16 a4 a | c2 f, |
  f4 c'8 bes a4 g | a1 |

}
}

notesBass = {
\global
\relative f {

  f4 f8. f16 f4 f | f2 f |
  f4 f8. f16 f4 f | c2 ~ c4 r4 |

  f4 f8. f16 f4 f | f2 a, |
  bes4 bes8 bes c4 c | f1 |

  c4 c8. c16 c4 c | c2 c |
  g'4 g8. g16 g4 g | c,1 |

  c4 c8. c16 c4 c | f2 f |
  g4 g8. g16 g,4 g | c4( d e2) |

  f4 f8. f16 f4 f | f2 f |
  f4 f8. f16 f4 f | c2 ~ c4 r4 |

  f4 f8. f16 f4 f | f2 a, |
  bes4 bes8 bes c4 c | f1 |

}
}

Refrain = \lyricmode {

Saved through the blood of Je -- sus, \bar "."
Per -- fect and on -- ly plea; \bar "."
Naught else a -- vails for sin -- ners, \bar "."
Naught else a -- vails for me. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Saved through the blood of Je -- sus, \bar "."
Saved from the curse of sin, \bar "."
Saved now to share Christ’s glo -- ry, \bar "."
Are all who trust in Him. \bar "."
Joy is a -- mong the an -- gels, \bar "."
And in the heart of God, \bar "."
As each un -- wor -- thy sin -- ner \bar "."
Trusts in the pre -- cious blood. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Saved through the blood of Je -- sus,
That great High Priest a -- bove,
Who bears them on His shoul -- ders
And on His heart of love.
No lamb shall ev -- er per -- ish,
En -- trust -- ed to His care,
So those who trust in Je -- sus
Are saved from doubt and fear.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Saved in that on -- ly Ref -- uge,
Where ev -- ’ry soul may hide,
Saved from this world of e -- vil,
With Christ they’re cru -- ci -- fied;
Saved too from ma -- ny_a sor -- row,
Saved from an ach -- ing heart,
Since Christ to all who trust Him
Will per -- fect peace im -- part.

}

wordsD = \lyricmode {
\set stanza = "4."

Saved too to tell the sto -- ry
To sin -- ners ev -- ’ry -- where,
To tell of Christ in glo -- ry,
Who bled and suf -- fered here.
Saved now to wait with pa -- tience,
Look -- ing by faith a -- far,
Till just be -- fore the dawn -- ing
Ris -- es the Morn -- ing Star.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
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
      \partcombine #'(2 . 9) \notesTenor \notesBass
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
