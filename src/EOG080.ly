\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  page-count = ##f
}

\header{
  title = "Down From the Glory Came God’s Blessed Son"
  subsubtitle = "(Jesus Is Calling.)"
  %meter = ""
  poet = "Arthur Cutting"
  composer = "Geo. C. Stebbins"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=66 }
tb = { \tempo 4=44 }

patternAA = { c8 c8 c8 c8 c8 c8 | c8 c8 c8 c4. }

patternBA = { c8 c8 c8 c4. }

patternCA = { c8 c8 c8 c8 c8 c8 | c4. c4 r8 }

patternDA = { c4. ~ c8 c8 c8 | c4. ~ c4 r8 }
patternDB = { c4 c8 c8 c8 c8 | c4 c8 c4 r8 }

patternEA = { c4. ~ c8 c8 c8 | c4. ~ c8 c8 c8 | c8. c16 c8 c8 c8 c8 | c4. ~ c4 r8 }
patternEB = { c8. c16 c8 c8 c8 c8 | c8 c8 c8 c4 c8 | c8. c16 c8 c8 c8 c8 | c4. ~ c4 r8 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 6/8
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g g g g e f | g a b c }
  \changePitch \patternBA { c b a b | a g fis g }
  \changePitch \patternAA { g g g g e f | g a b c }
  \changePitch \patternCA { b a b d c a | g ~ g r }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternDA { c c b a | b b | d d c b | c c r } >>
  \changePitch \patternEA { e e d c | c c b! a | g g g g a b | c c r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e e e e c d | e f f e }
  \changePitch \patternBA { f f f f | f e dis e }
  \changePitch \patternAA { e e e e c d | e f f e }
  \changePitch \patternCA { d d d fis fis fis | g( f) r }

  \changePitch \patternDA { e e e e | f f | f f e d | e e r }
  \changePitch \patternEA { < bes' g > ~ < bes g > < bes f > < bes e, > | a a g f | e e e f f f | e e r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c c c c g g | c c g g }
  \changePitch \patternBA { g d' d d | c c c c }
  \changePitch \patternAA { c c c c g g | c c g g }
  \changePitch \patternCA { g fis g a d c | b ~ b r }

  \changePitch \patternDB { g g g g g | g g g | b b b c g | g g g r }
  \changePitch \patternEB { c c c c c c | c c c c c | c c c b c d | c c r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { c c c c c c | c c c c }
  \changePitch \patternBA { g' g g g | c, c c c }
  \changePitch \patternAA { c c c c c c | c c c c }
  \changePitch \patternCA { d d d d d d | g ~ g r }

  \changePitch \patternDB { c, c c c c | d d d | g g g g g | c, c c r }
  \changePitch \patternEB { c c c c c c | f f f f f | g g g g g g | c, c r }

}
}

RefrainA = \lyricmode {

Might -- y to save, __ { \break } might -- y to save, __ \bar "."
Now __ in the { \pageBreak } glo -- ry, He’s a -- ble and wil -- ling to save. \bar "."

}

RefrainB = \lyricmode {

Sin -- ners to save, __ sin -- ners to save, __
Now __ He is right -- eous -- ly a -- ble the guil -- ty to save.

}

RefrainC = \lyricmode {

Haste __ thee a -- way, __ haste __ thee a -- way, __
In __ fin -- ite love __ waits to wel -- come the sin -- ner to -- day.

}

wordsA = \lyricmode {
\set stanza = "1."

Down from the glo -- ry came God’s bless -- ed Son, \bar "."
Lost ones { \break } to save, lost ones to save, \bar "."
Went in -- to death and the vic -- to -- ry won, \bar "." { \break }
Tri -- um -- phant rose from the grave. __ \bar "."

\RefrainA

}

wordsB = \lyricmode {
\set stanza = "2."

Sin’s bit -- ter judg -- ment He bore on the tree,
Dy -- ing to save, dy -- ing to save,
So that the sin -- ner might just -- ly go free,
His pre -- cious blood Je -- sus gave. __

\RefrainB

}

wordsC = \lyricmode {
\set stanza = "3."

Sin -- ner, God bids thee, on Je -- sus be -- lieve,
Now while you may, now while you may,
Peace and sal -- va -- tion through Him you’ll re -- ceive,
Do not, o, do not de -- lay! __

\RefrainC

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

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
