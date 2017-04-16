\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "2"
  title = "As the Serpent Raised by Moses"
  tunename = "Take The World But Give Me Jesus"
  meter = "8. 7. 8. 7. D."
  %poet = ""
  %composer = ""
  %copyright = ""
  tagline = ##f
}

pattern = { f8. g16 | a4. a8 g8. a16 | c4 bes bes8. a16 | g4. f8 g8. a16 | f2 }

global = {
  \include "common/overrides.ily"
  \autoBeamOff
  \override Staff.TimeSignature.style = #'numbered \time 3/4
  \once \override Score.MetronomeMark.transparent = ##t
  \tempo 4 = 70
  \key f \major
  \partial 4
}

notesSoprano = {
\global
\relative a' {

  \changePitch \pattern { f g | a a g a | c bes bes a | g f g a | f }
  \changePitch \pattern { f g | a a g a | c bes bes a | g f a g | f }
  \changePitch \pattern { c' c | d d bes d | c a a a | g g a b | c }
  \changePitch \pattern { f, g | a a g a | c bes bes a | g f a g | f }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \pattern { f f | f f e f | e e g f | e f e e | c }
  \changePitch \pattern { c e | f f e f | e e g f | e f e e | f }
  \changePitch \pattern { f f | f f f f | f f f f | e g f f | e }
  \changePitch \pattern { c c | f f e f | e e g f | e f e e | f }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \pattern { a bes | c c c c | c c c c | bes a bes c | a }
  \changePitch \pattern { a bes | c c c c | c c c c | bes a c bes | a }
  \changePitch \pattern { a a | bes bes d bes | a c c c | c e d d | s \insert { c4.( bes8) } } % slur
  \changePitch \pattern { a bes | c c c c | c c c c | bes a c bes | a }

}
}

notesBass = {
\global
\relative a {

  \changePitch \pattern { f f | f f bes a | g g e f | c c c c | f }
  \changePitch \pattern { f f | f f bes a | g g e f | c c c c | f }
  \changePitch \pattern { f f | bes bes, bes bes | f' f f f | g g g g | c, }
  \changePitch \pattern { f f | f f bes a | g g e f | c c c c | f }

}
}

wordsA = \lyricmode {
\set stanza = "1."

  As the ser -- pent raised by Mos -- es \bar "."
  Healed the fier -- y ser -- pent’s bite, \bar "."
  Je -- sus now, Him -- self dis -- clos -- es \bar "."
  To the wound -- ed sin -- ner’s sight: \bar "."
  Hear His gra -- cious in -- vi -- ta -- tion, \bar "."
  “I have life and peace to give, \bar "."
  I have wrought out full sal -- va -- tion, \bar "."
  Sin -- ner, look to Me and live.” \bar "."
}

wordsB = \lyricmode {
\set stanza = "2."

  “Grieve a -- bout your sins no lon -- ger,
  Well I know their might -- y guilt:
  But My love than death is stron -- ger,
  I My pre -- cious blood have spilt:
  Tho’ your heart has long been har -- dened,
  Look on Me— it soft shall grow;
  Your trans -- gres -- sions shall be par -- doned,
  And I’ll wash you white as snow.”
}

wordsC = \lyricmode {
\set stanza = "3."

  “I have seen what you were do -- ing,
  Tho’ you lit -- tle tho’t of Me;
  You were mad -- ly bent on ru -- in,
  But, I said— it shall not be:
  You had been for -- ev -- er wretch -- ed,
  Had I not es -- poused your part;
  Now be -- hold My arms out -- stretch -- ed
  To re -- ceive you to My heart.”
}


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
    >>
    \context Staff = men <<
      \clef bass
      \partcombine #'(2 . 9) \notesTenor \notesBass
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

