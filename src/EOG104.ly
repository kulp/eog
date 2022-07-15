\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG104.ily"
}

\header{
  %gospel
  hymnnumber = "104"
  title = "Not All the Gold of All the World"
  tunename = "Materna" % see https://hymnary.org/tune/materna_ward
  meter = "C. M. D."
  poet = "Albert Midlane" % see https://hymnary.org/text/not_all_the_gold_of_all_the_world
  composer = "Samuel A. Ward" % see https://hymnary.org/tune/materna_ward
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=88 }
tb = { \tempo 2=44 }

patternAA = { c2 | c2. c4 c2 c2 | c2. c4 c2 }

patternBA = { c2 | c2 c2 c2 c2 | c1. }
patternBB = { c2 | c4( c4) c2 c2 c2 | c2( c2 c2) }
patternBC = { c2 | c4( c4) c2 c2 c2 | c1. }
patternBD = { c2 | c2 c2 c2 c2 | c2( c2 c2) }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g | g e e g | g d d }
  \changePitch \patternBA { e | f g a b | g }
  \changePitch \patternAA { g | g e e g | g d d }
  \changePitch \patternBA { d' | cis d e a,! | d }

  \changePitch \patternAA { g, | e' e d c | c b b }
  \changePitch \patternBA { c | d b a g | c }
  \changePitch \patternAA { c | c a a c | c g g }
  \changePitch \patternBA { g | a c g d' | c }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e | e c c e | d b b }
  \changePitch \patternBB { e | c f f e f | d b c }
  \changePitch \patternAA { d | c c c e | d b b }
  \changePitch \patternBD { g' | g g g fis | g fis g }

  \changePitch \patternAA { g | g g f e | f f f }
  \changePitch \patternBD { f | f f f f | e f a }
  \changePitch \patternAA { g | f f f f | e e e }
  \changePitch \patternBA { e | f f f f | e }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c | c g g g | g g g }
  \changePitch \patternBC { b | a c d c f, | g }
  \changePitch \patternAA { f | e g g a | b g g }
  \changePitch \patternBD { d' | e d c! d | d c b }

  \changePitch \patternAA { b | c a b c | g g g }
  \changePitch \patternBD { a | g d' c g | g a c }
  \changePitch \patternAA { bes | a c c a | g c c }
  \changePitch \patternBA { c | c a b b | c }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { c | c c c c | b g g }
  \changePitch \patternBD { g | a b c d | b g a }
  \changePitch \patternAA { b | c c c c | d d d }
  \changePitch \patternBD { b' | ais b c! c | b a g }

  \changePitch \patternAA { g | c, c c c | d d d }
  \changePitch \patternBA { c | b g a b | c }
  \changePitch \patternAA { c | f f f f | g g g }
  \changePitch \patternBA { g | g g g g, | c }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Not all the gold of all the world, \bar "."
And all its wealth com -- bined, \bar "."
Could give re -- lief, or com -- fort yield, \bar "."
To one dis -- tract -- ed mind; \bar "."
’Tis on -- ly to the pre -- cious blood \bar "."
Of Christ the soul can fly, \bar "."
There on -- ly can a sin -- ner find \bar "."
A flow -- ing full sup -- ply. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Gold could not give the heart -- re -- lief
The mal -- e -- fac -- tor craved,
Ah, no! ’twas Christ, the Christ of God,
That dy -- ing sin -- ner saved;
Faith’s view of Him who bleed -- ing hung
A vic -- tim by his side.
He saw, he knew the Lord was there,
The Lord for him had died.

}

wordsC = \lyricmode {
\set stanza = "3."

Oh, what can e -- qual joy di -- vine,
And what can sweet -- er be
Than know -- ing that this Christ is mine
To all e -- ter -- ni -- ty?
Safe in the Lord, with -- out a doubt,
By vir -- tue of the blood;
For noth -- ing can de -- stroy the life
That’s hid with Christ in God.

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
