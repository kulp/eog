\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %children
  hymnnumber = "319"
  title = "Little Child, Do You Love Jesus?" % not found at hymnary.org
  tunename = "Montclair"
  meter = "8. 7. 8. 7. D."
  poet = ""
  composer = "William B. Bradbury" % see https://hymnary.org/tune/montclair_bradbury
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=120
  \key c \major
  \partial 2
  \autoBeamOff
}

patternA = { c4 c | c2 c }
patternB = { c4 c | c2. c4 c c | c1 }
patternC = { c4 c | c2. c4 c c | c2 c }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { g c | c b d, f | a g }
  \changePitch \patternB { g c | b g a b | c }
  \changePitch \patternA { g c | c b d, f | a g }
  \changePitch \patternB { g c | b g a b | c }

  \changePitch \patternC { c b | a b c a | a g }
  \changePitch \patternC { c b | a b c a | a( g) }
  \changePitch \patternC { g c | e d c b | d c }
  \changePitch \patternB { b a | g c b d | c }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { e e | f f b, d | f e }
  \changePitch \patternB { e g | f f f f | e }
  \changePitch \patternA { e e | f f b, d | f e }
  \changePitch \patternB { e g | f f f f | e }

  \changePitch \patternC { g g | f f f f | f e }
  \changePitch \patternC { e e | f f f f | f( e) }
  \changePitch \patternC { e e | g f g g | f a }
  \changePitch \patternB { g f | e e d f | e }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { c g | g g b b | c c }
  \changePitch \patternB { c e | d b c d | c }
  \changePitch \patternA { c g | g g b b | c c }
  \changePitch \patternB { c e | d b c d | c }

  \changePitch \patternC { c c | c c c c | c c }
  \changePitch \patternB { g c | c c c c | c }
  \changePitch \patternC { c c | c b c c | a a }
  \changePitch \patternB { b c | c g g g | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { c c | d d g g | c, c }
  \changePitch \patternB { c c' | g g g g | c, }
  \changePitch \patternA { c c | d d g g | c, c }
  \changePitch \patternB { c c' | g g g g | c, }

  \changePitch \patternC { e e | f g a f | c c }
  \changePitch \patternB { c c | f g a f | c }
  \changePitch \patternC { c c | c d e e | f f }
  \changePitch \patternB { f f | g g g, g | c }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Lit -- tle child, do you love Je -- sus? \bar "."
Ask your lit -- tle heart to -- day; \bar "."
I will tell of One who loves you, \bar "."
Be your an -- swer what it may. \bar "."
Lis -- ten soft -- ly, lis -- ten hum -- bly; \bar "."
Sweet the sto -- ry is, and true; \bar "."
For my sto -- ry is of Je -- sus_– \bar "."
Je -- sus, who once died for you. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Lit -- tle child, the Sav -- iour loved you,
So He left His home on high;
Came on earth a low -- ly stran -- ger,
For your sins to bleed and die.
Sin had set its stamp up -- on you,
And must shut you out from God;
Je -- sus came to make a -- tone -- ment,
Tho’ it cost His pre -- cious blood.

}

wordsC = \lyricmode {
\set stanza = "3."

Lit -- tle child, the bless -- ed Sav -- iour
Wick -- ed men de -- spised and slew,
On the cru -- el cross they nailed Him,
With a spear they pierced Him, too.
“It is fin -- ished!” said the Sav -- iour;
Well He knew His work was done;
He for sin had made a -- tone -- ment,
He, God’s ho -- ly, spot -- less Son.

}

wordsD = \lyricmode {
\set stanza = "4."

All cre -- a -- tion stood in won -- der
As He bowed His head and died;
Rocks and hills were rent a -- sun -- der
When the Lord was cru -- ci -- fied.
In a cold, cold grave they laid Him,
Think -- ing not what they had done;
Killed the Lord of life and glo -- ry,
Killed the Christ, God’s much -- loved Son.

}

wordsE = \lyricmode {
\set stanza = "5."

Lit -- tle child, death could not hold Him,
So the grave gave up its prey;
Straight in -- to the heavens He en -- tered,
\italicsOn Thence \italicsOff He speaks to you to -- day.
Yes, His lov -- ing eye is on you,
He from sin would set you free,
Thus He speaks of lit -- tle chil -- dren,
“Suf -- fer them to come to Me.”

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
      \context Lyrics = five  \lyricsto sopranos \wordsE
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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
