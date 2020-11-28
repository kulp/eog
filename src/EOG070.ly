\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  \include "override/override-EOG070.ily"
}

\header{
  %gospel
  hymnnumber = "70"
  title = "Christ Is Coming, Oh Be Ready"
  tunename = "Laßt mich geh’n" % see https://hymnary.org/text/lasst_mich_gehn_lasst_mich_gehn
  meter = "8. 7. 8. 7. 7." % original has 8. 7. 8. 7.
  poet = "Mrs. A. H. Rule" % not found at hymnary.org
  composer = "Karl Friedrich Voigtländer" % see https://hymnary.org/tune/lasst_mich_gehn_voigtlaender
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=70 }
tb = { \tempo 4=35 }

patternAA = { c8. c16 | c4 c4 c8. c16 | c4 c4 }
patternAB = { c8. c16 | c4 c4 c8. c16 | c2 }
patternAC = { c8. c16 | c4 c4 c8. c16 | c4 c8 c8 }
patternAD = { c8. c16 | c4. c8 c8. c16 | c4 c8 c8 }

patternBA = { c8 c8 | c4 c4 c8 c8 | c4 c4 }
patternBB = { c8 c8 | c4 c4 c8 c8 | c2 }

patternCA = { c8 c8 | c8 c8 c4 c4 | c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g f | f e c' a | a g }
  \changePitch \patternBA { e g | g f d f | f( e) }
  \changePitch \patternAC { c' b | b a c a | a g r }
  \changePitch \patternAD { e' c | b a g f | f( e) r }
  \changePitch \patternCA { e g | c g e' d | c }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e d | d c f f | f e }
  \changePitch \patternBA { c e | e d d d | d( c) }
  \changePitch \patternAC { e g | g f a f | f e r }
  \changePitch \patternAD { g g | g f e d | d( c) r }
  \changePitch \patternCA { c e | g g g f | e }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { g g | g g c c | c }
  \changePitch \patternBB { g g | b b g b | g }
  \changePitch \patternAC { g g | c c c c | c c r }
  \changePitch \patternAD { c c | c c c b | g ~ g r }
  \changePitch \patternCA { g c | c c c b | c }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { c c | c c a' f | c }
  \changePitch \patternBB { c c | g g b g | c }
  \changePitch \patternAC { c e | f f f a | c c, r }
  \changePitch \patternAD { c e | f f g g | c, ~ c r }
  \changePitch \patternCA { c c | e e g g | c, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Christ is com -- ing, oh, be read -- y; \bar "."
Let not slum -- ber dull your eyes; \bar "."
Do not say, “My Lord de -- lay -- eth”; \bar "."
He is com -- ing, oh, be wise! \bar "."
%{HIDE>%} He is com -- ing, oh, be wise! \bar "." %{<HIDE%}

}

wordsB = \lyricmode {
\set stanza = "2."

Some with emp -- ty lamps will hast -- en,
Seek -- ing oil for them to buy;
But, a -- las! they’ll nev -- er en -- ter;
Vain for them has been the cry.
%{HIDE>%} Vain for them has been the cry. %{<HIDE%}

}

wordsC = \lyricmode {
\set stanza = "3."

Such, with hearts of an -- guish burn -- ing,
When they find the door is shut,
Will, in ter -- ror, cry, “Lord, o -- pen”;
He will say, “I know you not.”
%{HIDE>%} He will say, “I know you not.” %{<HIDE%}

}

wordsD = \lyricmode {
\set stanza = "4."

Then be read -- y, oh, be read -- y;
Heed the cry while yet you may;
With lamps trimmed and burn -- ing bright -- ly,
Wait that com -- ing, bless -- ed day.
%{HIDE>%} Wait that com -- ing, bless -- ed day. %{<HIDE%}

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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
