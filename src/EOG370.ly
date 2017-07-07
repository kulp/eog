\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 5) (#t #f))
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
          \lower #1 \fromproperty #'header:poet
          \smaller \bold \mysubtitle
          \lower #1 \fromproperty #'header:composer
        }

        \vspace #0.5

        \override #'(baseline-skip . 2.5)
        \small \fill-line {
          \wordwrap { “Know ye not, that to whom ye yield yourselves servants to obey, his servants ye are to whom ye obey; ... even so now yield your members servants to righteousness unto holiness.” — "Romans 6:16, 19." } } % TODO original has right-justified reference
      }
    }
  }
}

\header{
  %children
  hymnnumber = "370"
  title = "Yield Not to Temptation"
  tunename = ""
  meter = "11. 11. 11. 12. with Refrain"
  poet = "H. R. Palmer"
  composer = "H. R. Palmer"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 2=80
  \key a \major
  \autoBeamOff
}

patternA = { c2. c4 c c | c2. c | c2. c4 c c | c2. ~ c }
patternB = { c2 c4 c c c | c2. c }
patternC = { c2. c4 c c | c2. c | c2 c4 c c c | c2. ~ c }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { cis cis d cis | b b | a a b a | gis gis }
  \changePitch \patternA { fis fis gis a | e a | b b a b | cis cis }
  \changePitch \patternA { cis cis d cis | b b | a a b a | gis gis }
  \changePitch \patternC { fis fis gis a | e a | cis cis b a b | a a }

  \eogbreak
  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternB { e e e fis e | e a } >>
  \changePitch \patternB { b b b a b | cis a }
  \changePitch \patternB { a a a gis fis | e a }
  \changePitch \patternB { cis cis b a b | a ~ a }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { e e e e | e d | cis fis gis fis | eis eis }
  \changePitch \patternA { fis d e fis | e cis | e e e e | e e }
  \changePitch \patternA { a a b a | gis gis | fis fis gis fis | eis eis }
  \changePitch \patternC { fis d e fis | e cis | e e d d d | cis cis }

  \changePitch \patternB { cis cis cis d cis | cis cis }
  \changePitch \patternB { e e e e e | e cis }
  \changePitch \patternB { fis fis fis e d | e cis }
  \changePitch \patternB { e e d d d | cis ~ cis }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a a b a | gis gis | a cis cis cis | cis cis }
  \changePitch \patternA { a a a a | a a | gis gis fis gis | a a }
  \changePitch \patternA { e' e e e | e d | cis cis cis cis | cis cis }
  \changePitch \patternC { a a a a | a a | a a gis fis gis | a a }

  \changePitch \patternB { a a a a a | a a }
  \changePitch \patternB { gis gis gis fis gis | a a }
  \changePitch \patternB { a a a a a | a a }
  \changePitch \patternB { a a gis fis gis | a ~ a }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { a a, a a | e' e | fis fis fis fis | cis cis }
  \changePitch \patternA { d d d d | cis fis | e e e e | a, a }
  \changePitch \patternA { a' a a a | e e | fis fis fis fis | cis cis }
  \changePitch \patternC { d d d d | cis fis | e e e e e | a, a }

  \changePitch \patternB { a a a a a | a a }
  \changePitch \patternB { e' e e e e | a a, }
  \changePitch \patternB { d d d d d | cis fis }
  \changePitch \patternB { e e e e e | a, ~ a }

}
}

Refrain = \lyricmode {

Ask the Sav -- iour to help you, \bar "."
Com -- fort, streng -- then and keep you; \bar "."
He is will -- ing to aid you; \bar "."
He will car -- ry you through. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Yield not to temp -- ta -- tion, \bar "."
For yield -- ing is sin; \bar "."
Each vic -- tory will help you \bar "."
Some oth -- er to win; \bar "."
Fight prayer -- ful -- ly on -- ward, \bar "."
Dark pas -- sions sub -- due; \bar "."
Look ev -- er to Je -- sus, \bar "."
He will car -- ry you through. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Shun e -- vil com -- pan -- ions,
Bad lan -- guage dis -- dain;
God’s name hold in rev -- erence–
Don’t take it in vain;
Be thought -- ful and ear -- nest,
Kind -- heart -- ed and true;
Look ev -- er to Je -- sus,
He will car -- ry you through.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

To him that o’er -- com -- eth
God giv -- eth a crown;
Thro’ faith we shall con -- quer,
Though oft -- en cast down;
He who is our Sav -- iour
Our strength will re -- new;
Look ev -- er to Je -- sus,
He will car -- ry you through.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
