\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG168.ily"
}

\header{
  %gospel
  hymnnumber = "168"
  title = "In Tenderness He Sought Me"
  tunename = ""
  meter = "P. M. with Refrain"
  poet = "W. Spencer Walton" % see https://hymnary.org/text/in_tenderness_he_sought_me
  composer = "Adoniram J. Gordon" % see https://hymnary.org/tune/in_tenderness_he_sought_me_gordon
  tagline = ##f
}

ta = { \tempo 8=150 }
tb = { \tempo 8=75 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \partial 8
  \autoBeamOff
}

patternAA = { c8 | c4 c8 c4 c8 | c4. c4 }
patternBA = { c8 | c4 c8 c4 c8 | c4 c8 c4 }
patternCA = { c8 | c4 c8 c4 c8 | c4. c4. | c4. c4. }

patternDA = { c4 c8 c4 c8 | c4. c4. }
patternDB = { c4 c8 c4 c8 | c4 c8 c4 c8 | c4. c4. }
patternDC = { c4 c8 c4 c8 | c4 c8 c4 c8 | c4. c4 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { d | d g g a | g fis }
  \changePitch \patternAA { g | a gis a b | g ~ g  } \eogbreak
  \changePitch \patternAA { d | d b' b c | b a }
  \changePitch \patternAA { a | a fis g e | d ~ d } \eogbreak
  \changePitch \patternBA { d | c' c b b | a a g }
  \changePitch \patternCA { g | e e a g | fis e | d ~ \tb d \fermata \ta } \eogbreak

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternDA { d g g a | g fis } >>
  \changePitch \patternDA { d | a' a b | a g }
  \changePitch \patternDB { b c d b | c a b g | a ~ a }
  \changePitch \patternDC { b d c a | g g fis a | g ~ g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d | d d d d | d d }
  \changePitch \patternAA { d | d d d fis | d ~ d }
  \changePitch \patternAA { d | d g g g | e e }
  \changePitch \patternAA { g | fis d e cis | d ~ d }
  \changePitch \patternBA { d | d d d d | d d d }
  \changePitch \patternCA { d | cis cis cis cis | d cis | d( c) }

  \changePitch \patternDA { b d d d | d d }
  \changePitch \patternDA { d d d d | d d }
  \changePitch \patternDB { g a b g | a d, d d | fis ~ fis }
  \changePitch \patternDC { g f e e | d d d d | d ~ d }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b | b b b c | b a }
  \changePitch \patternAA { b | c b c d | b ~ b }
  \changePitch \patternAA { b | b d d e | d c }
  \changePitch \patternAA { e | d a a g | fis ~ fis }
  \changePitch \patternBA { fis | fis fis g g | c c b }
  \changePitch \patternCA { b | a a e a | a g | fis ~ fis }

  \changePitch \patternDA { g b b c | b a }
  \changePitch \patternDA { c c c d | c b }
  \changePitch \patternDB { d d d d | d d d b | d ~ d }
  \changePitch \patternDC { d b g c | b b a c | b ~ b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g | g g g g | d d }
  \changePitch \patternAA { d | d d d d | g ~ g }
  \changePitch \patternAA { g | g g g g | c, c }
  \changePitch \patternAA { cis | d d a a | d ~ d }
  \changePitch \patternBA { d | d d d d | d d g }
  \changePitch \patternCA { g | a a, a a | a a | d ~ d_\fermata }

  \changePitch \patternDA { g, g' g g | d d }
  \changePitch \patternDA { fis fis d d | g <g g,> }
  \changePitch \patternDB { g g g g | fis fis g g | d ~ d }
  \changePitch \patternDC { g g | c, c | d d d d | g ~ g }

}
}

Refrain = \lyricmode {

Oh, the love that sought me! \bar "."
Oh, the blood that bought me! \bar "."
Oh, the grace that brought me to Him -- self, \bar "."
Won -- drous grace that brought me to Him -- self. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

In ten -- der -- ness He sought me, \bar "."
Wear -- y and sick with sin, \bar "."
And on His shoul -- ders brought me \bar "."
Back to Him -- self a -- gain; \bar "."
While ti -- dings of the lost one found \bar "."
Made heav -- en’s courts with praise re -- sound. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

He washed the bleed -- ing sin -- wounds,
And poured in oil and wine;
He whis -- pered to as -- sure me,
“I’ve found thee; thou art Mine”;
I nev -- er heard a sweet -- er voice,
It made my ach -- ing heart re -- joice.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

He point -- ed to the nail -- prints;
For me His blood was shed,
A mock -- ing crown so thorn -- y
Was placed up -- on His head:
I won -- dered what He saw in me
To suf -- fer such deep ag -- o -- ny.

}

wordsD = \markuplist {

\line { I’m sitting in His presence, }
\line { { \hspace #2 } The sunshine of His face, }
\line { While with adoring wonder }
\line { { \hspace #2 } His blessings I retrace. }
\line { It seems as if eternal days }
\line { Are far too short to sound His praise. }

}

wordsE = \markuplist {

\line { So while the hours are passing, }
\line { { \hspace #2 } All now is perfect rest; }
\line { I’m waiting for the morning, }
\line { { \hspace #2 } The brightest and the best, }
\line { When He will call me to His side, }
\line { The portion of His spotless bride. }

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

\markup { \fontsize #0.3 \vcenter \column {
  \vspace #1
  \fill-line {
    \null
    \line{ \bold 4 \column { \wordsD } }
    \null
    \line{ \bold 5 \column { \wordsE } }
    \null
  }
} }

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
