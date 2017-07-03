\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "105"
  title = "Nothing but the Name of Jesus"
  tunename = "Refuge"
  meter = "8. 7. 8. 7. D."
  poet = ""
  composer = "J. P. Holbrook"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \override TupletBracket.bracket-visibility = ##f
  \ta
  \key d \major
  \partial 2
  \autoBeamOff
}

% rewrote voies as chords to work around unfortunate interactions between
% \partcombine and \tuplet

notesSoprano = {
\global
\relative c' {

  fis4. fis8 | fis2. d4 g4. fis8 | fis2\( d2\)
  \tuplet 3/2 { d4\( e4 fis4\) } | g2. b4 a4. g8 | fis1 \eogbreak
  d4. d8 | e2 ~ \repeat unfold 2 { \tuplet 3/2 { e4\( dis e\) } } | fis2\( d2\)
  d4. d8 | e2 ~ \tuplet 3/2 { e4\( dis e\) } \tuplet 3/2 { e\( g fis\) } | d1 \eogbreak
  a'4. a8 | fis'2. e4 \stemUp \tuplet 3/2 { e4^\( d b\) } \stemNeutral | a2\( fis2\)
  d'4. b8 | a2. fis4 e4. fis8 | g1 \eogbreak
  fis4. a8 | fis'2. e4 \stemUp \tuplet 3/2 { e4^\( d b\) } \stemNeutral | a2\( fis2\)
  d'4. b8 | a2. d,4 fis4. e8 | d1 \eogbreak

  \bar "|."

}
}

notesAltoB = {
\relative e' {

  \override TupletBracket.bracket-visibility = ##f
  \omit TupletNumber
  \repeat unfold 54 \skip 4
  \tuplet 3/2 { g2 g4 }
  \repeat unfold 22 \skip 4
  \tuplet 3/2 { g2 g4 }

}
}

notesAlto = {
\global
\relative e' {

  \repeat unfold 48 \skip 4
  fis4. fis8 | a2. g4 s2 | fis2\( d2\) % s2 stands in for \tuplet 3/2 { g2 g4 }
  fis4. g8 | fis2. d4 cis4. d8 | e1
  d4. fis8 | a2. g4 s2 | fis2\( d2\) % s2 stands in for \tuplet 3/2 { g2 g4 }
  fis4. g8 | fis2. d4 d4. cis8 | d1

}
}

% notesTenor contains two notes from notesBass due to workaround for
% \partcombine with \tuplet
notesTenor = {
\global
\relative a {

  \override TupletBracket.direction = #UP
  a4. a8 | a2. fis4 b4. a8 | a2\( fis2\)
  \tuplet 3/2 { fis4\( g a\) } | b2. d4 cis4. b8 | a1
  fis4. fis8 | g2 ~ \repeat unfold 2 { \tuplet 3/2 { g4\( fis g\) } } | a2\( fis2\)
  fis4. fis8 | g2 ~ \tuplet 3/2 { g4\( fis g\) } \tuplet 3/2 { g4\( b a\) } | fis1
  a4. a8 | d2. cis4 \tuplet 3/2 { <b g>2 <d g,,>4 } | d2\( a2\)
  a4. b8 | d2. a4 a4. d8 | cis1
  a4. a8 | d2. cis4 \tuplet 3/2 { <b g>2 <d g,,>4 } | d2\( a2\)
  a4. b8 | d2. fis,4 a4. g8 | fis1

}
}

notesBass = {
\global
\relative f {

  \repeat unfold 48 \skip 4
  d4. d8 | d2. d4 s2 | d1 % s2 stands in for \tuplet 3/2 { g2 g,4 }
  d4. d8 | d2. d4 a4. a8 | a1
  d4. d8 | d2. d4 s2 | d1 % s2 stands in for \tuplet 3/2 { g2 g,4 }
  d4. d8 | d2. d4 a4. a8 | d1

}
}

wordsA = \lyricmode {
\set stanza = "1."

Noth -- ing but the name of Je -- sus \bar "."
Can _ a -- vail in dan -- ger’s hour; \bar "."
Noth -- ing but _ the name _ of Je -- sus, \bar "."
When the clouds _ of trou -- _ ble lower; \bar "."
On -- ly through the blood _ of Je -- sus \bar "."
Can the guilt -- y soul have peace; \bar "."
On -- ly through the death _ of Je -- sus \bar "."
Sa -- tan’s cap -- tives find re -- lease. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Dy -- ing sin -- ner, look to Je -- sus,
Lift -- _ ed on the cross for thee;
See the ho -- _ ly Sav -- _ iour, Je -- sus,
Stretched and nailed _ up -- on _ the tree.
Why that pier -- cing cry _ of an -- guish?
Why did God His Son for -- sake?
Shall the spot -- less Vic -- _ tim lan -- guish?
Must His heart for sor -- rows break?

}

wordsC = \lyricmode {
\set stanza = "3."

Sin -- ner, hear the match -- less sto -- ry,
Lis -- _ ten sim -- ply and be -- lieve;
From the ris -- _ en Lord _ in glo -- ry,
Life, e -- ter -- _ nal life, _ re -- ceive;
Je -- sus died– thy con -- _ dem -- na -- tion,
Thine, be -- liev -- er, Je -- sus bore;
Con -- quered grave, thy de -- _ so -- la -- tion,
Rose, and lives to die no more.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice = altosB { \voiceTwo << \notesAltoB >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
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
