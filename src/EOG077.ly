\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG077.ily"
}

\header{
  %gospel
  hymnnumber = "77"
  title = "Come, Ye Sinners, Poor and Needy"
  tunename = "Caersalem" % see https://hymnary.org/tune/caersalem_edwards
  meter = "8. 7. 8. 7. 8. 4. 7." % original has 8. 7. 8. 7. 4. 7
  poet = "Joseph Hart" % see https://hymnary.org/text/come_ye_sinners_poor_and_needy_weak_and
  composer = "Robert Edwards" % see https://hymnary.org/tune/caersalem_edwards
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=160 }
tb = { \tempo 4=80  }

patternAA = { c2 c4( c4) c2 c4( c4) | c2 c4( c4) c2 c2 }
patternAB = { c2 }
patternAC = { c2 c2 c2 c2 | c2 c4( c4) c2 c2 }

patternBA = { c2 c2 c2 c4( c4) | c2 c4( c4) c1 }
patternBB = { c2 c2 c2 c4( c4) | c2 c2      c1 }
patternBC = { c2 c2 c2 c2      | c2 c2      c1 }

patternCA = { \patternAB }

patternDA = { c2 c2 c2 c2 | c1 c1      | c\breve }
patternDB = { c2 c2 c2 c2 | c1 c2( c2) | c\breve }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g d g b g b | d c b a g }
  \changePitch \patternBA { b a g c b | a d cis d }
  \changePitch \patternAA { g, d g b g b | d c b a g }
  \changePitch \patternBA { b a g c b | a d cis d }

  \changePitch \patternCA { b b b a | c c c b | g b b a }
  \changePitch \patternDA { b a g c | b a | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { d d g g | g g fis g }
  \changePitch \patternBB { g fis g a g | fis g fis }
  \changePitch \patternAB { d d g g | g g fis g }
  \changePitch \patternBB { g fis g a g | fis g fis }

  \changePitch \patternCA { g g g fis | g g g g | d g g fis }
  \changePitch \patternDA { g fis e g | g fis | g }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAC { b b d e | d e d c b }
  \changePitch \patternBC { d c b d | d e d }
  \changePitch \patternAC { b b d e | d e d c b }
  \changePitch \patternBC { d c b d | d e d }

  \changePitch \patternCA { d d d d | c c e d | b b d d }
  \changePitch \patternDB { d c b e | d d c | b }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { g g g e | b c d g }
  \changePitch \patternBB { g d e fis g | a a, d }
  \changePitch \patternAB { g g g e | b c d g }
  \changePitch \patternBB { g d e fis g | a a, d }

  \changePitch \patternCA { g g, d' d | e c g' g | g e d d }
  \changePitch \patternDA { g d e c | d d | g, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Come, ye sin -- ners, poor and need -- y, \bar "."
Weak and wound -- ed, sick and sore, \bar "."
Je -- sus read -- y stands to save you, \bar "."
Full of pit -- y, love and power; \bar "."
He is a -- ble, %{HIDE>%} He is a -- ble, %{<HIDE%} He is a -- ble, \bar "."
He is will -- ing, doubt no more. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Let not con -- science make you lin -- ger,
Nor of fit -- ness fond -- ly dream;
All the fit -- ness He re -- quir -- eth
Is to feel your need of Him;
This He gives you, %{HIDE>%} this He gives you, %{<HIDE%} this He gives you,
’Tis the Spir -- it’s ris -- ing beam.

}

wordsC = \lyricmode {
\set stanza = "3."

Come, ye wear -- y, heav -- y -- la -- den,
Lost and ru -- ined by the fall;
If you tar -- ry till you’re bet -- ter,
You will nev -- er come at all.
Not the right -- eous, %{HIDE>%} not the right -- eous, %{<HIDE%} not the right -- eous—
Sin -- ners Je -- sus came to call.

}

wordsD = \markuplist {

\line { Agonizing in the garden, }
\line { { \hspace #2 } Lo! the Saviour prostrate lies; }
\line { On the bloody tree behold Him, }
\line { { \hspace #2 } Hear Him cry before He dies, }
\line { { \hspace #4 } “It is finished!” “It is finished!” }
\line { { \hspace #2 } Sinner, will not this suffice? }

}

wordsE = \markuplist {

\line { Lo! the Incarnate God ascended, }
\line { { \hspace #2 } Pleads the merits of His blood; }
\line { Venture on Him, venture freely, }
\line { { \hspace #2 } Let no other trust intrude: }
\line { { \hspace #4 } None but Jesus, none but Jesus, }
\line { { \hspace #2 } Can do helpless sinners good. }

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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
