\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  \include "override/override-EOG022.ily"
}

\header{
  %gospel
  hymnnumber = "22"
  title = "Jesus Is a Loving Saviour"
  tunename = "Wellesley" % see https://hymnary.org/tune/wellesley_tourjee
  meter = "8. 7. 8. 7."
  poet = ""
  composer = "Lizzie S. Tourjée" % see https://hymnary.org/tune/wellesley_tourjee
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=76 }
tb = { \tempo 2=38 }

patternAA = { c2 c4( c4) | c2 c2 } %
patternAB = { c2 c2 }
patternAC = { c2 c4( c4) | c2 c4( c4) | c2 c4( c4) | c2 c2} %
patternAD = { c2 c2 | c4( c4) c4( c4) | c2 c2 | c1 } %
patternAE = { c2 c2 | c2 c4( c4) | c2 c2 | c1 } %
patternAF = { c2 c2 | c4( c4) c4( c4) | c4( c4) c4( c4) | c1 } %
patternAG = { c2 c2 | c2 c2 | c2 c2 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g c d | c b     | g d' e | d c }
  \changePitch \patternAG { a g   | f e     | d fis  | g   }
  \changePitch \patternAC { g a g | g e' c  | g a g  | g c }
  \changePitch \patternAD { c c   | c e c a | g d'   | c   }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAB { e e | f f   | f f | e e }
  \changePitch \patternAG { c c | b c   | d c | b   }
  \changePitch \patternAB { f' f | e e   | f f | e e }
  \changePitch \patternAE { e f | e e f | d f | e   }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { c g | g g     | g g     | g g }
  \changePitch \patternAG { f g | g g     | fis a   | g   }
  \changePitch \patternAB { b b | c g     | g b     | c g }
  \changePitch \patternAF { c c | c b a c | c b a b | c   }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { c c    | d g,      | b g  | c c }
  \changePitch \patternAG { f e    | d c       | d d  | g,  }
  \changePitch \patternAB { g' g   | c, c      | b g  | c c }
  \changePitch \patternAD { a' aes | g gis a f | g g, | c   }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Je -- sus is a { \italicsOn } lov -- ing { \italicsOff } Sav -- iour, \bar "."
Love it was that brought Him low; \bar "." \eogbreak
Come, He says, in words of mer -- cy, \bar "."
Prove my lov -- ing -- kind -- ness now. \bar "." \eogbreak

}

wordsB = \lyricmode {
\set stanza = "2."

Je -- sus is a { \italicsOn } might -- y { \italicsOff } Sav -- iour,
Strong His out -- stretched arm to save;
He has van -- quished death and Sa -- tan,
He has tri -- umphed o’er the grave.

}

wordsC = \lyricmode {
\set stanza = "3."

Je -- sus is a { \italicsOn } will -- ing { \italicsOff } Sav -- iour,
Ful -- ly, free -- ly He for -- gives;
And the soul which looks un -- to Him
From that hap -- py mo -- ment lives.

}

wordsD = \lyricmode {
\set stanza = "4."

Je -- sus is a { \italicsOn } right -- eous { \italicsOff } Sav -- iour,
He has suf -- fered once for sins;
Death He suf -- fered, ere in tri -- umph
He could bring re -- demp -- tion in.

}

wordsE = \lyricmode {
\set stanza = "5."

Je -- sus is a { \italicsOn } last -- ing { \italicsOff } Sav -- iour,
Ev -- er will His love en -- dure;
Souls which rest by faith up -- on Him
Are e -- ter -- nal -- ly se -- cure.

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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
