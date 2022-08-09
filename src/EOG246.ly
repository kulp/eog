\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "246"
  title = "Oh, for the Robe of Whiteness"
  tunename = "Work"
  meter = "7. 6. 7. 6. D."
  poet = "Charitie Lees Smith Bancroft" % see https://hymnary.org/text/o_for_the_robes_of_whiteness_o_for_the
  composer = "Lowell Mason" % see https://hymnary.org/tune/work_for_the_night_is_coming_mason
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key f \major
  \autoBeamOff
}

patternA = { c4 c8. c16 c4 c | c2 c }
patternB = { c4 c8. c16 c4 c | c2. c4 }
patternC = { c4 c8. c16 c4 c | c4.( c8) c2 }
patternD = { c4 c8  c8  c4 c | c2. c4 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { c a bes c c | d c }
  \changePitch \patternB { f, f f f g | a r }
  \changePitch \patternA { c a bes c c | d c }
  \changePitch \patternD { f, f g a g | f r }

  \changePitch \patternC { g g g g a | bes a g }
  \changePitch \patternB { a^\markup{\italic cres.} a a a b | c r }
  \changePitch \patternA { c a bes c c | d c }
  \changePitch \patternD { f, f g a g | f r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { a f g a a | bes a }
  \changePitch \patternB { f f f f e | f r }
  \changePitch \patternA { a f g a a | bes a }
  \changePitch \patternD { f f f f e | f r }

  \changePitch \patternC { e e e e f | g f e }
  \changePitch \patternB { f f f f f | e r }
  \changePitch \patternA { a f g a a | bes a }
  \changePitch \patternD { f f f f e | f r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { f f f f f | f f }
  \changePitch \patternB { a a a a c | c r }
  \changePitch \patternA { f, f f f f | f f }
  \changePitch \patternD { c' c d c bes | a r }

  \changePitch \patternA { c c c c c | c c }
  \changePitch \patternB { c c c a f | g r }
  \changePitch \patternA { f f f f f | f f }
  \changePitch \patternD { c' c d c bes | a r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { f f f f f | bes, f' }
  \changePitch \patternB { f f f f c | f r }
  \changePitch \patternA { f f f f f | bes, f' }
  \changePitch \patternD { a a bes c c, | f r }

  \changePitch \patternA { c c c c c | c c }
  \changePitch \patternB { f f f f d | c r }
  \changePitch \patternA { f f f f f | bes, f' }
  \changePitch \patternD { a a bes c c, | f r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Oh, for the robe of white -- ness, \bar "."
To walk with Christ in light! \bar "."
Oh, for the glo -- rious bright -- ness \bar "."
Of day with -- out a night! \bar "."
We would a name of fa -- vor, \bar "."
Graved on the stone of white; \bar "."
We’d taste that man -- na’s fla -- vor, \bar "."
Re -- served for heaven’s de -- light. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

’Tis sweet, the thought of ris -- ing
The ris -- en Lord to meet;
Or changed, our -- selves sur -- pris -- ing,
Like Him for whom we wait.
What joy su -- preme in see -- ing
The Sav -- iour face to face—
The peace -- ful joy of be -- ing
For -- ev -- er in that place!

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus, Thou King of glo -- ry,
We soon shall dwell with Thee,
And sing Thy love’s bright sto -- ry,
When we Thy glo -- ry see.
E’en now our souls would en -- ter
The ho -- li -- est on high,
That all our love might cen -- ter
On Thee who cam’st to die.

}

wordsD = \lyricmode {
\set stanza = "4."

At God’s right hand in glo -- ry
Thou sitt’st, Thy work com -- plete,
Till per -- fect -- ed the sto -- ry
That gives us too our seat.
Then o’er the wide cre -- a -- tion
Thy pow’r will stretch its arm;
Se -- cure from all temp -- ta -- tion,
Free from all hu -- man harm.

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
      \context Lyrics = four  \lyricsto sopranos \wordsD
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
