\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
}

\header{
  %gospel
  hymnnumber = "264"
  title = "The Perfect Righteousness of God"
  tunename = "Duke Street"
  meter = "L. M."
  poet = "A. Midlane"
  composer = "John Hatton"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key ees \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees2 g4 aes | bes2 c4( d) | ees2 d4( c) | bes1 |
  bes2 bes4 bes | c2 bes | aes g | f1 |
  g2 g4 f | ees( g) bes( ees) | c( bes) aes( g) | f1 |
  bes2 c4 d | ees2. aes,4 | g2 f | ees1 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees2 ees4 ees | ees2 ees4( f) | g2 f4( ees) | d1 |
  ees2 ees4 ees | ees2 ees4( bes) | c( d) ees2 | d1 |
  ees2 ees4 bes | bes( ees) ees2 | ees2 d4( ees) | d1 |
  ees2 ees4 f | g2. f4 | ees2 d | ees1 |

}
}

notesTenor = {
\global
\relative a {

  g2 bes4 aes | g2 aes | g4( bes) bes( a) | bes1 |
  g2 g4 bes | aes2 bes4( g) | aes2 bes | bes1 |
  bes2 bes4 bes | g( bes) bes2 | c4( ees) bes2 | bes1 |
  bes2 aes4 aes | g4.( aes8 bes4) c | bes2 bes4( aes) | g1 |

}
}

notesBass = {
\global
\relative f {

  ees2 ees4 c | bes2 aes4( f') | ees2 f | bes,1 |
  ees2 ees4 g | aes2 g | f ees | bes1 |
  ees2 ees4 d | ees2 g | aes4( g) f( ees) | bes1 |
  g'2 aes4 f | ees4.( f8 g4) aes4 | bes2 bes, | ees1 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

The per -- fect right -- eous -- ness of God \bar "."
Is wit -- nessed in the Sav -- iour’s blood; \bar "."
’Tis in the cross of Christ we trace \bar "."
His right -- eous -- ness, yet won -- drous grace. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

God could not pass the sin -- ner by,
His sin de -- mands that he must die;
But in the cross of Christ we see
How God can save, yet right -- eous be.

}

wordsC = \lyricmode {
\set stanza = "3."

The sin is laid on Je -- sus’ head,
’Tis in His blood sin’s debt is paid;
God’s jus -- tice can de -- mand no more,
And mer -- cy can dis -- pense her store.

}

wordsD = \lyricmode {
\set stanza = "4."

The sin -- ner who be -- lieves is free,
Can say, “The Sav -- iour died for me”;
Can point to the a -- ton -- ing blood,
And say, “This made my peace with God.”

}

wordsE = \lyricmode {
\set stanza = "5."

How won -- drous the re -- demp -- tion plan,
De -- signed by God for ru -- ined man!
His bless -- ed Son in death laid low,
That He might end -- less life be -- stow.

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
