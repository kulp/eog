\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  systems-per-page = ##f
  \include "override/override-EOG170.ily"
}

\header{
  hymnnumber = "170"
  title = "Jesus! Oh Name Divinely Sweet!" % see https://hymnary.org/text/jesus_o_name_divinely_sweet_how_charming
  tunename = "Mendip" % see https://hymnary.org/tune/mendip_english
  meter = "C. M."
  poet = "Samuel Stennett" % see https://hymnary.org/text/jesus_o_name_divinely_sweet_how_charming
  composer = "English Melody" % see https://hymnary.org/tune/mendip_english
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes4 | bes aes g bes | ees d c
  c4 | bes g ees ees | f2.
  ees8[ f] | g4 g f ees | bes' bes aes
  aes8[ bes] | c4 aes f f | ees2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4 | ees c8[ d] ees4 f | ees ees ees
  d4 | ees ees ees ees | d2.
  bes4 | ees ees d c | ees des c
  aes'8[ bes] | aes4 ees ees d | ees2.

}
}

notesTenor = {
\global
\relative a {

  g4 | g aes bes bes | c bes aes
  aes4 | bes bes bes a | bes2.
  g8[ aes] | bes4 bes aes g | ees ees ees
  c'4 | c c bes bes8[ aes] | g2.

}
}

notesBass = {
\global
\relative f {

  ees4 | g f ees d | c g aes
  f'4 | g ees c c | bes2.
  ees4 | ees ees bes c | g g aes
  aes'8[ g] | f4 aes bes bes, | ees2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus! Oh name di -- vine -- ly sweet! \bar "."
How sooth -- ing is the sound! \bar "."
What joy -- ful news, what heaven -- ly pow’r, \bar "."
In that blest name is found! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Our souls, as guilt -- y and con -- demned,
In hope -- less fet -- ters lay;
Our souls with count -- less sins de -- filed,
Of death and hell the prey.

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus, to purge a -- way our guilt,
A will -- ing vic -- tim fell,
And on His cross tri -- um -- phant broke
The bands of death and hell.

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
  #(cond ((ly:get-option 'eog-midi-permitted) #{ \midi{
    \include "common/midi.ily"
  } #}))
}

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
