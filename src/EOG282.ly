\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "282"
  title = "What a Friend We Have in Jesus"
  tunename = "Scriven"
  meter = "8. 7. 8. 7. D."
  poet = "J. Scriven"
  composer = "C. C. Converse"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \autoBeamOff
}

patternA = { c4. c8 c c c c | c2 c4 c4 }
patternB = { c4. c8 c c c c | c2. c4 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { c c d c a f | f d r }
  \changePitch \patternB { c f a f c' a | g r }
  \changePitch \patternA { c c d c a f | f d r }
  \changePitch \patternB { c f a g f e | f r }
  \changePitch \patternA { g fis g a bes g | a c r }
  \changePitch \patternB { d d c a bes a | g r }
  \changePitch \patternA { c c d c a f | f d r }
  \changePitch \patternB { c f a g f e | f r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { f f f f f c | d bes r }
  \changePitch \patternB { c c c c f f | e r }
  \changePitch \patternA { f f f f f c | d bes r }
  \changePitch \patternB { a c f c c c | c r }
  \changePitch \patternA { e dis e f g e | f f r }
  \changePitch \patternB { f f f f g f | e r }
  \changePitch \patternA { f f f f f c | d bes r }
  \changePitch \patternB { a c f c c c | c r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a a bes a c a | bes f r }
  \changePitch \patternB { a a a a a c | c r }
  \changePitch \patternA { a a bes a c a | bes f r }
  \changePitch \patternB { f a c bes a g | a r }
  \changePitch \patternA { c c c c c c | c a r }
  \changePitch \patternB { bes bes c c c c | c r }
  \changePitch \patternA { a a bes a c a | bes f r }
  \changePitch \patternB { f a c bes a g | a r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { f f f f f f | bes, bes r }
  \changePitch \patternB { f' f f f f f | c r }
  \changePitch \patternA { f f f f f f | bes, bes r }
  \changePitch \patternB { c c c c c c | f r }
  \changePitch \patternA { c c c c c c | f f r }
  \changePitch \patternB { bes bes a f e f | c r }
  \changePitch \patternA { f f f f f f | bes, bes r }
  \changePitch \patternB { c c c c c c | f r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

What a Friend we have in Je -- sus, \bar "."
All our sins and griefs to bear; \bar "."
What a priv -- i -- lege to car -- ry \bar "."
Ev -- ’ry -- thing to God in prayer. \bar "."
O, what peace we oft -- en for -- feit, \bar "."
O, what need -- less pain we bear; \bar "."
All be -- cause we do not car -- ry \bar "."
Ev -- ’ry -- thing to God in prayer. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Have we tri -- als and temp -- ta -- tions?
Is there troub -- le an -- y -- where?
We should nev -- er be dis -- cour -- aged;
Take it to the Lord in prayer.
Can we find a Friend so faith -- ful,
Who will all our sor -- rows share?
Je -- sus knows our ev -- ’ry weak -- ness–
Take it to the Lord in prayer.

}

wordsC = \lyricmode {
\set stanza = "3."

Are we weak and heav -- y -- la -- den,
Cum -- bered with a load of care?
Pre -- cious Sav -- iour, still our ref -- uge,–
Take it to the Lord in prayer.
Do thy friends de -- spise, for -- sake thee?–
Take it to the Lord in prayer;
In His arm He’ll take and shield thee,
Thou wilt find a sol -- ace there.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
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
