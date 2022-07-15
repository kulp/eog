\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %children
  hymnnumber = "326"
  title = "To Israel’s Land, When Israel Sinned"
  tunename = "Wilson" % not found at hymnary.org
  meter = "C. M. D."
  poet = "" % see https://books.google.com/books?id=7DkHAAAAQAAJ&pg=PA255&lpg=PA255&dq=%22To+Israel’s+Land,+When+Israel+Sinned%22&source=bl&ots=asxGO9vTgP&sig=yoFEvjwg0yaaMWAY6ma9-wLTbII&hl=en&sa=X&ved=0ahUKEwiRy5btx9zXAhVosVQKHXmwAFIQ6AEIMDAC#v=onepage&q&f=false ; "Mrs. W."
  composer = ""
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key bes \major
  \partial 4
  \autoBeamOff
}

patternA = { c4 | c8 c c4 c | c8 c8 c4 }
patternB = { c4 | c4. c8 c c | c2 }

notesSoprano = {
\global
\relative c' {

  \changePitch \patternA { f | bes bes bes a | a g g }
  \changePitch \patternB { bes | f g f ees | d }
  \changePitch \patternA { f | bes bes bes a | a g g }
  \changePitch \patternB { bes | f bes c a | bes }

  \changePitch \patternA { bes | c c c c | d d d }
  \changePitch \patternB { d | ees d c bes | c }
  \changePitch \patternA { f, | bes bes bes a | a g g }
  \changePitch \patternB { bes | f bes c a | bes }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { d | d d d f | f ees ees }
  \changePitch \patternB { ees | d d c c | bes }
  \changePitch \patternA { ees | f f d f | f ees ees }
  \changePitch \patternB { ees | d f g f | f }

  \changePitch \patternA { f | f f f f | f f f }
  \changePitch \patternB { f | f f f d | f }
  \changePitch \patternA { ees | d d d f | f ees ees }
  \changePitch \patternB { ees | d f f f | f }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes | f f f bes | bes bes bes }
  \changePitch \patternB { g | bes bes a f | f }
  \changePitch \patternA { a | bes bes bes bes | bes bes bes }
  \changePitch \patternB { g | bes bes bes ees | d }

  \changePitch \patternA { d | a a a a | bes bes bes }
  \changePitch \patternB { d | c bes a g | a }
  \changePitch \patternA { a | bes bes bes bes | bes bes bes }
  \changePitch \patternB { g | bes d ees ees | d }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { bes | bes bes bes d | ees ees ees }
  \changePitch \patternB { ees | f f f a, | bes }
  \changePitch \patternA { c | d d bes d | ees ees ees }
  \changePitch \patternB { ees | f d ees f | bes, }

  \changePitch \patternA { bes' | f f f f | bes, bes bes }
  \changePitch \patternB { bes' | a bes f g | f }
  \changePitch \patternA { f | bes, bes bes d | ees ees ees }
  \changePitch \patternB { ees | f f f, f | bes }

}
}

wordsA = \lyricmode {
\set stanza = "1."

To Is -- rael’s land, when Is -- rael sinned, \bar "."
A band of Syr -- ians came, \bar "."
Took cap -- tive thence a lit -- tle maid \bar "."
Who knew God’s ho -- ly name. \bar "."
She wait -- ed up -- on Naa -- man’s wife: \bar "."
A might -- y cap -- tain he, \bar "."
But, sad to tell, all cov -- ered o’er \bar "."
With dread -- ful lep -- ro -- sy. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

The lit -- tle cap -- tive soon makes known
What won -- ders may be wrought
By God’s own proph -- et, in her land,
And begs he may be sought.
Proud Naa -- man left his na -- tive land,
Com -- mend -- ed by his lord,
And car -- ried in his lep -- rous hand
A pres -- ent and re -- ward.

}

wordsC = \lyricmode {
\set stanza = "3."

With hors -- es and with char -- iot grand,
The war -- rior soon is seen,
Be -- fore E -- li -- sha’s door, to stand
With high and haught -- y mien.
“Go, wash in Jor -- dan, and be clean,”
The proph -- et’s mes -- sage giv’n;
But this ill suits the war -- rior’s mind—
His char -- iot back is driven.

}

wordsD = \lyricmode {
\set stanza = "4."

The ser -- vants now draw near, and say
In words both wise and kind,
“If some great thing thou hadst to do,
Wouldst thou have been be -- hind?”
Then Naa -- man yield -- ed, spite of pride;
He washed and he was clean;
And all who now in Christ con -- fide
Are washed from ev -- ’ry sin.

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

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
