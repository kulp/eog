\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  systems-per-page = ##f
  system-count = #(cond (is-eogsized 3) (#t #f))
  score-markup-spacing.padding = 3
  score-markup-spacing.basic-distance = 3
}

\header{
  %gospel
  hymnnumber = "100"
  title = "Let All Who Know the Joyful Sound"
  tunename = "Pembroke"
  meter = "8. 8. 6. D."
  poet = "T. Kelly"
  composer = "J. Foster"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=100 }
tb = { \tempo 2=50 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  g2 | b( a) g | d'1 d2 | c( b) a | b1
  b2 | a( e') d | g,( c) b | e,( a) g | fis1 \eogbreak
  a2 | b( cis) d | d1 cis2 | d1
  d2 | d1 d2 | d( c) b | a( b) c | b1 \eogbreak
  b2 | b1 b2 | e1 \grace { b2( a2) } g2 | d'( c) b | a1
  b2 | c( d) e | d1 fis,2 | g1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  d2 | d1 d2 | g( fis) g | g1 g2 | g1
  d2 | fis1 g2 | d( fis) g | e1 e2 | d1
  fis2 | g1 fis2 | e1 e2 | fis1
  g2 | b( a) g | g( fis) g | g1 fis2 | fis1
  a2 | g1 fis2 | e1 d2 | a'1 g2 | g( fis)
  g2 | g1 g2 | g( fis) d | d1

}
}

notesTenor = {
\global
\relative a {

  b2 | d( c) b | b( a) g | c( d) e | d1
  g,2 | a1 b2 | b(c) d | c1 b2 | a1
  d2 | d( e) a, | b1 a2 | a1
  b2 | d( c) b | b( a) g | c( b) a | b1
  b2 | e1 d2 | c1 d2 | d1 d2 | d1
  d2 | c( b) a | b( a) c | b1

}
}

notesBass = {
\global
\relative f {

  g2 | g1 g2 | d2. c4 b2 | e( d) c | g'1
  g2 | d( c) b | b'( a) g | c,1 cis2 | d1
  d2 | g( e) fis | g1 a2 | d,1
  g2 | g1 g2 | d1 d2 | d1 d2 | dis1
  dis2 | e( g) b | c1 b2 | fis1 g2 | d1
  g4( fis4) | e2( d) c | d1 d2 | g1

}
}

wordsA = \lyricmode {
\set stanza = "1."

Let all who know the joy -- ful sound, \bar "."
With glad -- ness send the ti -- dings round, \bar "."
And tell that God is love; \bar "."
That God so loved the world, He gave \bar "."
His own dear Son the world to save; \bar "."
God’s mes -- sage from a -- bove. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

That all who in the Son be -- lieve,
Shall nev -- er per -- ish, but re -- ceive
Life end -- less and di -- vine;
No con -- dem -- na -- tion e’er shall know,
From death to life they pass be -- low,
And then in glo -- ry shine.

}

wordsC = \lyricmode {
\set stanza = "3."

‘Tis not of works: let no man boast,
Save in His name who saves the lost_–
The Lord our Right -- eous -- ness!
Poor sin -- ner, now from work -- ing cease,
And claim from God a blood -- bought peace,
And Je -- sus, Lord, con -- fess.

}

wordsD = \markuplist {

\line { Let all who know our God rejoice, }
\line { Praise Him in songs with cheerful voice, }
\line { { \hspace #2 } And live to Him alone; }
\line { Let sinners too take up the strain, }
\line { Exalt the Lamb for sinners slain, }
\line { { \hspace #2 } The coming Saviour own. }

}

wordsE = \markuplist {

\line { The Spirit and the bride say, Come! }
\line { Let him that heareth, too, say, Come! }
\line { { \hspace #2 } Whoever thirsts may come; }
\line { Water of life is freely given }
\line { Till Christ the Lord descends from heaven; }
\line { { \hspace #2 } Lord Jesus, quickly come! }

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

\markup { \fill-line { \column {
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } } \combine \null \vspace #0.4
} } }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
