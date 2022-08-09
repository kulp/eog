\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG128.ily"
}

\header{
  %gospel
  hymnnumber = "128"
  title = "Though All the Beasts That Live and Feed"
  tunename = "Meribah" % see https://hymnary.org/tune/meribah_mason
  meter = "8. 8. 6. D."
  poet = "Thomas Kelly" % see https://bibletruthpublishers.com/though-all-the-beasts-that-live-and-feed/thomas-kelly/little-flock-hymnbook/hymnbooks/la79570
  composer = "Lowell Mason" % see https://hymnary.org/tune/meribah_mason
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=60 }
tb = { \tempo 2=30 }

patternAA = { c2 | c4. c8 c4 c4 c4      c4 | c1 }
patternAB = { c2 | c4. c8 c4 c4 c8[ c8] c4 | c1 }

patternBA = { c2 | c4 c4 c2 c2 | c1 }

patternCA = { c2 | c4 c4 c4 c4 c4 c4 | c1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 3/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key ees \major
  \partial 2
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { ees | g g g f g aes | bes }
  \changePitch \patternAA { g | c c c bes aes g | f } \eogbreak
  \changePitch \patternBA { bes | d c bes a | bes }

  \changePitch \patternCA { bes | ees bes bes g aes c | bes } \eogbreak
  \changePitch \patternCA { bes | ees bes bes g aes c | bes }
  \changePitch \patternBA { ees, | f aes g f | ees }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { ees | ees ees ees d ees d | ees }
  \changePitch \patternAB { ees | ees ees ees ees c d ees | d }
  \changePitch \patternBA { f | f g f ees | d }

  \changePitch \patternCA { ees | ees ees ees ees ees ees | ees }
  \changePitch \patternCA { d | ees ees ees ees ees ees | ees }
  \changePitch \patternBA { ees | ees ees ees d | ees }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { g | bes bes bes bes bes bes | g }
  \changePitch \patternAA { bes | aes aes aes bes bes bes | bes }
  \changePitch \patternBA { d bes ees d c | bes }

  \changePitch \patternCA { g | g bes bes bes aes aes | g }
  \changePitch \patternCA { bes | bes g g bes aes aes | g }
  \changePitch \patternBA { bes | c c bes aes | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { ees | ees ees ees aes g f | ees }
  \changePitch \patternAA { ees | aes aes aes g f ees | bes }
  \changePitch \patternBA { bes | d ees f f | bes, }

  \changePitch \patternCA { ees | ees g g ees c aes | ees' }
  \changePitch \patternCA { aes | g ees ees des c aes | ees' }
  \changePitch \patternBA { g | aes aes bes bes, | ees }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Though all the beasts that live and feed \bar "."
Up -- on a thou -- sand hills should bleed— \bar "."
Tho’ all their blood should flow, \bar "."
The sac -- ri -- fice would be in vain, \bar "."
The stain of sin would still re -- main: \bar "."
Sin is not can -- celled so. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

“A bet -- ter sac -- ri -- fice” than these
It needs, the con -- science to ap -- pease
Or sat -- is -- fy the Lord:
No blood hath vir -- tue to a -- tone
For man’s of -- fence, but His a -- lone
Whose ti -- tle is “The Word.”

}

wordsC = \lyricmode {
\set stanza = "3."

His who could say, Him -- self the Son,
“My Fa -- ther and My -- self are one,”
Who made the world a -- round;
His who Je -- ho -- vah’s Fel -- low stood,
And claimed e -- qual -- i -- ty with God,
Whose glo -- ry knows no bounds.

}

wordsD = \markuplist {

\line { Jesus the Christ, on earth His name, }
\line { He came—in love to sinners came—}
\line { { \hspace #2 } And bowed His head and died; }
\line { A full atonement now is made, }
\line { The ransom, by His death, is paid, }
\line { { \hspace #2 } And Justice satisfied. }

}

wordsE = \markuplist {

\line { That sinners might draw near to Him, }
\line { God planned this great, this gracious scheme, }
\line { { \hspace #2 } And found the ransom too: }
\line { Let all His saints their voices raise, }
\line { And sing the great Redeemer’s praise }
\line { { \hspace #2 } While endless ages flow. }

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

\noPageBreak

\markup { \fontsize #0.3 \fill-line { \vcenter \column {
  \vspace #1
  \line{ \bold 4 \column { \wordsD } } \combine \null \vspace #0.4
  \line{ \bold 5 \column { \wordsE } }
} } }

\version "2.22.0"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
