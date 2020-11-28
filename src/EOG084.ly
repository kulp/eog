\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG084.ily"
}

\header{
  %gospel
  hymnnumber = "84"
  title = "Free from the Law"
  tunename = "Once for All" % see https://hymnary.org/tune/free_from_the_law_o_happy_cond_bliss
  meter = "P. M. with Refrain"
  poet = "Philip P. Bliss" % see https://hymnary.org/text/free_from_the_law_o_happy_condition
  composer = "Philip P. Bliss" % see https://hymnary.org/text/free_from_the_law_o_happy_condition
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8 c8 c8 | c4. c4. c8 c8 c8      | c4. c4. }
patternAB = { c8 c8 c8 | c4. c4. c4    c8      | c4. c4. }
patternAC = { c4    c8 | c4. c4. c8 c8 c16 c16 | c4. c4. }
patternAD = { c4    c8 | c4. c4. c8 c8 c8      | c4. c4. }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 9/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { ees g c | bes g g f ees | g f }
  \changePitch \patternAA { f e f | aes c c bes aes | aes g }
  \changePitch \patternAA { ees g bes | ees bes bes aes g | c ~ c }
  \changePitch \patternAB { c aes c | bes g g f | ees ~ ees }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternAA { bes'[ c] d | ees ees ees d c | c bes } >>
  \changePitch \patternAA { bes[ c] d | ees ees ees d c | c bes }
  \changePitch \patternAA { ees, g c | bes g g f ees | c' ~ c }
  \changePitch \patternAB { c aes c | bes g g f | ees ~ ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees ees ees | ees ees ees ees ees | ees d }
  \changePitch \patternAA { d cis d | f aes aes g f | f ees }
  \changePitch \patternAA { ees ees g | g g g f ees | ees ~ ees }
  \changePitch \patternAB { ees ees ees | g ees d d | ees ~ ees }

  \changePitch \patternAA { bes'[ a] aes | g g g bes aes | aes g }
  \changePitch \patternAA { bes[ a] aes | g g f f ees | ees d }
  \changePitch \patternAA { ees ees ees | ees ees ees ees ees | ees ~ ees }
  \changePitch \patternAB { ees ees ees | ees ees d d | ees ~ ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g g g | g bes bes aes g | bes bes }
  \changePitch \patternAA { bes bes bes | bes bes bes bes bes | bes bes }
  \changePitch \patternAA { g bes bes | bes ees ees bes bes | aes ~ aes }
  \changePitch \patternAB { aes c ees | ees bes bes aes | g ~ g }

  \changePitch \patternAC { bes bes | bes bes bes bes c[ d] | ees ees }
  \changePitch \patternAD { bes bes | bes bes a a a | bes bes }
  \changePitch \patternAA { g g g | g bes bes aes g | aes ~ aes }
  \changePitch \patternAB { aes c aes | g bes bes aes | g ~ g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees ees ees | ees ees ees ees ees | bes bes }
  \changePitch \patternAA { bes bes bes | bes bes bes bes bes | ees ees }
  \changePitch \patternAA { ees ees ees | ees ees ees ees ees | aes ~ aes }
  \changePitch \patternAB { aes aes aes | bes bes bes, bes | ees ~ ees }

  \changePitch \patternAD { bes' bes | ees, ees ees ees ees | ees ees }
  \changePitch \patternAD { bes' bes | ees, ees f f f | bes, bes }
  \changePitch \patternAA { ees ees ees | ees ees ees ees ees | aes, ~ aes }
  \changePitch \patternAB { aes aes aes | bes bes bes bes | ees ~ ees }

}
}

Refrain = \lyricmode {

Once for all, O sin -- ner, re -- ceive it; \bar "."
Once for all, O bro -- ther, be -- lieve it; \bar "."
Cling to the cross, the bur -- den will fall; \bar "."
Christ has re -- deemed us once for all. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Free from the law, oh, hap -- py con -- di -- tion! \bar "."
Je -- sus has bled, and there is re -- mis -- sion! \bar "."
Cursed by the law, and bruised by the fall, \bar "."
Grace has re -- deemed us once for all. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Now are we free— there’s no con -- dem -- na -- tion;
Je -- sus pro -- vides a per -- fect  sal -- va -- tion;
“Come un -- to Me”— oh, hear His sweet call,
Come, and He saves us once for all.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

“Chil -- dren of God!” Oh, glo -- ri -- ous call -- ing!
Sure -- ly His grace will keep us from fall -- ing;
Pass -- ing from death to life at His call,
Bless -- ed sal -- va -- tion once for all.

}

wordsD = \lyricmode {
\set stanza = "4."

Soon He will come, the saints shall be rais -- ed;
We, who re -- main a -- live, shall be chang -- ed;
Then all, caught up, at His bless -- ed call,
Changed to His like -- ness, once for all.

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
