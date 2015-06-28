\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "Come, Ye Sinners, Poor and Needy"
  subsubtitle = "(Caersalem. 8. 7. 8. 7. 4. 7)"
  %meter = "8.7.8.7.4.7"
  poet = "Joseph Hart"
  composer = "Robert Edwards"
  %copyright = ""
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

patternDA = { c2 c2 c2 c2 | c1 c1      | \override Staff.NoteHead.style = #'altdefault c\breve \revert Staff.NoteHead.style }
patternDB = { c2 c2 c2 c2 | c1 c2( c2) | \override Staff.NoteHead.style = #'altdefault c\breve \revert Staff.NoteHead.style }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'()
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  %\partial 4
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
Full of pit -- y, love, and power; \bar "."
He is a -- ble, He is a -- ble, He is a -- ble, \bar "."
He is will -- ing, doubt no more. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Let not con -- science make you lin -- ger,
Nor of fit -- ness fond -- ly dream;
All the fit -- ness He re -- quir -- eth
Is to feel your need of Him;
This He gives you, this He gives you, this He gives you,
’Tis the Spir -- it’s ris -- ing beam.

}

wordsC = \lyricmode {
\set stanza = "3."

Come, ye wea -- ry, heav -- y -- la -- den,
Lost and ru -- ined by the fall;
If you tar -- ry till you’re bet -- ter,
You will nev -- er come at all.
Not the right -- eous, not the right -- eous, not the right -- eous,
Sin -- ners Je -- sus came to call.

}

wordsD = \markuplist {

\line { Agonizing in the garden, }
\line { Lo! the Saviour prostrate lies; }
\line { On the bloody tree behold Him. }
\line { Hear Him cry before He dies, }
\line { “It is finished!” “It is finished!” }
\line { Sinner, will not this suffice? }

}

wordsE = \markuplist {

\line { Lo! the Incarnate God ascended, }
\line { Pleads the merits of His blood; }
\line { Venture on Him, venture freely, }
\line { Let no other trust intrude: }
\line { None but Jesus, none but Jesus, }
\line { Can do helpless sinners good. }

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak

\markup { \fill-line { %\column {
  \hspace #0.1
  \line{ \bold 4 \column { \wordsD } } %\combine \null \vspace #0.4
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } } %\combine \null \vspace #0.4
  \hspace #0.1
} } %}

\version "2.18.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
