\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "240"
  title = "Mighty, Mighty Love of Jesus"
  tunename = ""
  meter = "8. 7. 8. 7. D."
  poet = "A. A. P."
  composer = "Geo. C. Stebbins"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key bes \major
  \autoBeamOff
}

patternA = { c4 c c8 c c8. c16 | c2 c4 c4 }
patternB = { c4 c c8 c c8. c16 | c2. c4 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { d d c g a c | bes f r }
  \changePitch \patternB { f bes bes d c bes | c r }
  \changePitch \patternA { d d c g a c | bes f r }
  \changePitch \patternB { g bes a bes c a | bes r }
  \eogbreak

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternA { c c d c a f | d' bes r } >>
  \changePitch \patternB { d d d f ees d | c r }
  \changePitch \patternA { d d c g a c | bes f r }
  \changePitch \patternB { g bes a bes c a | bes r }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { f f ees ees ees ees | d d r }
  \changePitch \patternB { d d d d e e | f r }
  \changePitch \patternA { f f ees ees ees ees | d d r }
  \changePitch \patternB { ees ees ees d ees ees | d r }

  \changePitch \patternA { ees ees f ees ees ees | f d r }
  \changePitch \patternB { f f f bes f f | f r }
  \changePitch \patternA { f f ees ees ees ees | d d r }
  \changePitch \patternB { ees ees ees d ees ees | d r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { bes bes a bes c a | bes bes r }
  \changePitch \patternB { bes bes bes bes g c | a r }
  \changePitch \patternA { bes bes a bes c a | bes bes r }
  \changePitch \patternB { bes bes c bes a c | bes r }

  \changePitch \patternA { a a a a c a | bes bes r }
  \changePitch \patternB { bes bes bes d c bes | a r }
  \changePitch \patternA { bes bes a bes c a | bes bes r }
  \changePitch \patternB { bes bes c bes a c | bes r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { bes bes f f f f | bes, bes r }
  \changePitch \patternB { bes d g g c, c | f r }
  \changePitch \patternA { bes bes f f f f | bes, bes r }
  \changePitch \patternB { ees g f f f f | bes, r }

  \changePitch \patternA { f' f f f f f | bes, bes r }
  \changePitch \patternB { bes' bes bes bes a bes | f r }
  \changePitch \patternA { bes bes f f f f | bes, bes r }
  \changePitch \patternB { ees g f f f f | bes, r }

}
}

Refrain = \lyricmode {

Pre -- cious, price -- less love of Je -- sus! \bar "."
All -- suf -- fi -- cient ’tis for me; \bar "."
All my sins and all my sor -- rows \bar "."
Ful -- ly met at Cal -- va -- ry. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Might -- y, might -- y love of Je -- sus! \bar "."
Great -- er love was nev -- er known; \bar "."
Love that stooped from heights of glo -- ry– \bar "."
Love that left, for me, a throne. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Won -- drous, won -- drous love of Je -- sus!
Once for me He lived a child–
Low -- ly Son of low -- ly moth -- er–
He, the Christ, the Un -- de -- filed!

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Faith -- ful, faith -- ful love of Je -- sus!
Count -- ing ev -- ’ry -- thing but loss,
Un -- to death for me sub -- mit -- ting–
E -- ven death up -- on the cross!

}

wordsD = \lyricmode {
\set stanza = "4."

Con -- quering, con -- quering love of Je -- sus!
Vic -- tor o’er the seal -- ed grave!
Tramp -- ling down the hosts of dark -- ness,
From their pow’r my soul to save.

}

wordsE = \markuplist {

\line { Tender, tender love of Jesus! }
\line { At the Father’s side He stands, }
\line { Interceding for me always, }
\line { Holding up His pierced hands! }

}

wordsF = \markuplist {

\line { Perfect, perfect love of Jesus! }
\line { In its fullness let me hide, }
\line { Till the King in all His beauty }
\line { Comes to claim His spotless bride. }

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
  \midi{
    \include "common/midi.ily"
  }
}

\noPageBreak

\markup { \fill-line {
  \hspace #0.1
  \line{ \bold 5 \column { \wordsE } }
  \hspace #0.1
  \line{ \bold 6 \column { \wordsF } }
  \hspace #0.1
} }

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
