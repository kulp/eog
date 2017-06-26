\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  % decrease system-to-system padding to fit onto page with previous score
  system-system-spacing.padding = 0
  system-system-spacing.basic-distance = 0
  markup-system-spacing.padding = 0
  markup-system-spacing.basic-distance = 0
  scoreTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      \override #'(baseline-skip . 3.5)
      \column {
        \fill-line {
          \huge \larger \larger \bold {
            \concat { "  " \fromproperty #'header:hymnnumber }
            \mytitle
            \null
          }
        }
        \fill-line {
          % less lowering (to save vertical space)
          \lower #1 \fromproperty #'header:poet
          \smaller \bold \mysubtitle
          \lower #1 \fromproperty #'header:composer
        }
      }
    }
  }
}


\header{
  %gospel
  hymnnumber = "75"
  title = "I Gave My Life For Thee"
  tunename = "Gift"
  meter = "6. 6. 6. 6. 6. 6."
  poet = "F. R. Havergal"
  composer = "P. P. Bliss"
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

patternAA = { c8 | c4 c8 c4 c8 | c4.( c8[ c8]) }
patternAB = { c8 | c4 c8 c4 c8 | c4. c4        }

patternBA = \patternAB
patternBB = { c8 | c4 c8 c8[ c8] c8 | c4. c4   }

patternAC = \patternBB

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key c \major
  \partial 8
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g | g g e g | a c b }
  \changePitch \patternBA { a | g g f g | e ~ e }
  \changePitch \patternAA { g | g g e g | a c b }
  \changePitch \patternBB { a | g g b a b | c ~ c }

	\bar ".|:-||"
	\repeat volta 2 {

  \changePitch \patternAC { c | d d d c b | c( g) }
  \changePitch \patternBB { c | b b b a b | c ~ c }

	}

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { e | e e c e | f a g }
  \changePitch \patternBA { f | e e d b | c ~ c }
  \changePitch \patternAA { e | e e c e | f a g }
  \changePitch \patternBA { f | e g f f | e ~ e }

	\repeat volta 2 {

  \changePitch \patternAC { e | f f f e d | e ~ e }
  \changePitch \patternBA { e | f f f f | e ~ e }

	}

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAB { c | c c g c | c ~ c }
  \changePitch \patternBA { c | c c b g | g ~ g }
  \changePitch \patternAB { c | c c g c | c ~ c }
  \changePitch \patternBA { c | c e d d | c ~ c }

	\repeat volta 2 {

  \changePitch \patternAC { c | b b b c d | c ~ c }
  \changePitch \patternBA { c | d d d g, | g ~ g }

	}

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAB { c | c c c c | f ~ f }
  \changePitch \patternBA { f | g g g g | c, ~ c }
  \changePitch \patternAB { c | c c c c | f ~ f }
  \changePitch \patternBA { f | g g g g | c, ~ c }

	\repeat volta 2 {

  \changePitch \patternAB { c | g' g g g | c, ~ c }
  \changePitch \patternBA { c | g' g g g | c, ~ c }

	}

}
}

wordsA = \lyricmode {
\set stanza = "1."

I gave my life for thee, \bar "."
My pre -- cious blood I shed, \bar "."
That thou might’st ran -- somed be, \bar "."
And quick -- ened from the dead; \bar "."
I gave my life for thee, \bar "."
What has thou given for Me? \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

My Fa -- ther’s house of light,
My glo -- ry -- cir -- cled throne
I left, for earth -- ly night,
For wan -- d’rings sad and lone;
I left it all for thee,
Hast thou left aught for Me?

}

wordsC = \lyricmode {
\set stanza = "3."

I suf -- fered much for thee,
More than thy tongue can tell,
Of bit -- terest ag -- on -- y,
To res -- cue thee from hell;
I’ve borne it all for thee,
What has thou borne for Me?

}

wordsD = \lyricmode {
\set stanza = "4."

And I have brought to thee,
Down from my home a -- bove,
Sal -- va -- tion full and free,
My par -- don and my love;
I bring rich gifts to thee,
What hast thou brought to Me?

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partcombine #'(2 . 9) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
      \context NullVoice = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos \unfoldRepeats { \voiceOne << \notesSoprano >> }
      \context Voice  = altos \unfoldRepeats { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \context Voice  = tenors \unfoldRepeats { \voiceOne << \notesTenor >> }
      \context Voice  = basses \unfoldRepeats { \voiceTwo << \notesBass >> }
    >>
  >>
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
