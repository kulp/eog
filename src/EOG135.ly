\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG135.ily"
}

\header{
  %gospel
  hymnnumber = "135"
  title = "There Is No Other Name than Thine" % see https://hymnary.org/text/there_is_no_other_name_than_thine
  tunename = "Old Hundredth"
  meter = "L. M."
  poet = "" % see https://hymnary.org/text/there_is_no_other_name_than_thine
  composer = "Genevan Psalter, 1551" % see https://hymnary.org/tune/old_hundredth_bourgeois
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

patternAA = { c2 }
patternAB = { c2 | c2. c4 c2 c2 | c2. c4 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key a \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { a | a gis fis e | a b cis }
  \changePitch \patternAA { cis | cis cis b a | d cis b }
  \changePitch \patternAA { a | b cis b a | fis gis a }
  \changePitch \patternAA { e' | cis a b d | cis b a }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e | e e cis cis | cis e e }
  \changePitch \patternAA { e | e e e cis | fis e e }
  \changePitch \patternAA { e | e e e e | d d cis }
  \changePitch \patternAB { e | e dis e fis | e d cis }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { cis | cis b a gis | fis gis a }
  \changePitch \patternAA { cis | a a gis a | a a gis }
  \changePitch \patternAA { cis | b a gis a | a b a }
  \changePitch \patternAA { b | a a gis a | a gis a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { a | a e fis cis | fis e a, }
  \changePitch \patternAA { a' | a cis, e fis | d a e' }
  \changePitch \patternAA { a | gis a e cis | d b fis' }
  \changePitch \patternAA { gis | a fis e d | e e a, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

There is no oth -- er name than Thine, \bar "."
Je -- ho -- vah -- Je -- sus— name di -- vine; \bar "."
On which to rest for sins for -- given, \bar "."
For peace with God, for hope of heaven. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Name a -- bove ev -- ery name, Thy praise
Shall fill yon courts through end -- less days,
Je -- ho -- vah -- Je -- sus— name di -- vine,
Rock of sal -- va -- tion— Thou art mine.

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
