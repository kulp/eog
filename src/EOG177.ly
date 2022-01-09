\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG177.ily"
}

\header{
  %gospel
  hymnnumber = "177"
  title = "Nor Silver Nor Gold"
  tunename = ""
  meter = "P. M. with Refrain" % something like 12. 11. 12. 11. with Refrain
  poet = "James M. Gray" % see https://hymnary.org/text/nor_silver_nor_gold_hath_obtained_my_red
  composer = "Daniel B. Towner" % see https://hymnary.org/tune/nor_silver_nor_gold_towner
  tagline = ##f
}

ta = { \tempo 4=80 }
tb = { \tempo 4=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key d \major
  \partial 8
  \autoBeamOff
}

patternA = { c8 | c4 c8 c c4 c8 c | c4 c8. c16 c8 c4 }
patternB = { c8 | c4 c8 c c4 c8 c | c4 c8 c c4. }
patternC = { c8 | c4 c8 c c4 c8 c | c4 c8 c c c4 }
patternD = { c8 | c4 c8 c c c4 c8 | c4 c8 c c4 }

notesSoprano = {
\global
\relative c'' {

  a8 | a4 fis8 a d4 a8 fis | a4 g8. a16 g8 e4
  g8 | g4 e8 g b4 a8 a | a4 g8 g fis4.
  a8 | a4 fis8 a d4 cis8 d | e4 d8 b b a4
  fis8 | e4 fis8 gis a d4 cis8 | cis4 b8 b \tb a4 \fermata \ta \bar "."

}
}

notesSopranoRefrain = {
\relative c'' {

  << s^\markup { \small \caps "Refrain" }
  { \tuplet 3/2 { << { \voiceOne a8 } \new Voice { \voiceTwo a8 } >> << { b cis } { gis g } >> } } >>

  \partCombine
  \relative c' {
    | d'2 ~ d8 d8 cis8. b16 | cis4 g2
    g8. g16 | cis2 ~ cis8 cis8 b8. g16 | fis2.
  }
  \relative c' {
    | fis2 ~ fis8 fis8 g8. g16 | g4 e2
    e8. d16 | g2 ~ g8 g8 g8. e16 | d2.
  }

  \tuplet 3/2 { << { \voiceOne a8 } \new Voice { \voiceTwo a8 } >> << { b cis } { gis g } >> }
  \partCombine
  \relative c'' {
    | d2 ~ d8 d8 e8. d16 | cis4 b2
    b8 b | a4. a8 g4 e |
  }
  \relative c' {
    | fis2 ~ fis8 fis8 g8. fis16 | a4 g2
    g8 d | d4. fis8 e4 cis |
  }
  << { \voiceOne d2. } \new Voice { \voiceTwo d2. } >>
  \partCombine r8 r8

  \bar "|."

}
}

notesSopranoRefrainPacing = {
\global
\relative c,, {

  r8 | r4 r8 r r4 r8 r | r4 r8. r16 r8 r4
  r8 | r4 r8 r r4 r8 r | r4 r8 r r4.
  r8 | r4 r8 r r4 r8 r | r4 r8 r r r4
  r8 | r4 r8 r r r4 r8 | r4 r8 r r4

  %\repeat unfold 32 \skip 4
  \tuplet 3/2 { a8 a a }
    | d'2 ~ d8 d8 cis8. b16 | cis4 g2
    g8. g16 | cis2 ~ cis8 cis8 b8. g16 | fis2.

  \tuplet 3/2 { a8 a a }
    | d2 ~ d8 d8 e8. d16 | cis4 b2
    b8 b | a4. a8 g4 e | d2. r8

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { fis | fis d fis fis fis d | g e e e cis }
  \changePitch \patternB { e | e cis e g fis fis | fis e e d }
  \changePitch \patternC { fis | fis d fis fis g a | g g g g fis }
  \changePitch \patternD { d | cis d e e e e | e e e e }

  % excludes refrain (moved to Soprano) due to bad interactions between
  % \tuplet, \partCombine, and NullVoice

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { d | d a d d d a | cis a a a a }
  \changePitch \patternB { cis | cis cis cis d d d | d cis cis d }
  \changePitch \patternC { d | d a a a a a | b b d d d }
  \changePitch \patternD { a | a gis b a gis a | a gis d' cis }

  r4 | r \tuplet 3/2 { a8 a a } a4 \tuplet 3/2 { a8 a a } | a8. a16 a8. a16 cis8 cis
  r4 | r4 e8. e16 e4 cis8. a16 | a8. a16 a8. a16 a4
  r4 | r \tuplet 3/2 { a8 a a } a4 r8. a16 | g8. a16 b8. cis16 d8. d16
  d8 d8 | d4. d8 cis4 a8[ g] | fis2. r8

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { d | d d d d d d | e cis cis a a }
  \changePitch \patternB { a' | a a a d, d fis | a a, a d }
  \changePitch \patternC { d | d d d d e fis | g g g d d }
  \changePitch \patternD { d | e e d cis b a | e' e e a,_\fermata }

  r4 | r \tuplet 3/2 { d8 d d } d4 \tuplet 3/2 { e8 e e } | a8. a16 a8. a16 a8 a
  r4 | r4 a8. a16 a4 a,8. a16 | d8. d16 d8. d16 d4
  r4 | r \tuplet 3/2 { d8 d d } d4 r8. d16 | g8. g16 g8. g16 g8. g16
  g8 g8 | fis4. d8 a4 a | d2. r8

}
}

Refrain = \lyricmode {

{ \mon } I am re -- { \moff } deemed, __ but not with sil -- ver; \bar "."
I am bought, __ but not with gold; \bar "."
{ \mon } Bought with a { \moff } price— the blood of Je -- sus, \bar "."
Pre -- cious price of love un -- told. \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

Nor sil -- ver nor gold hath ob -- tained my re -- demp -- tion, \bar "."
Nor rich -- es of earth could have saved my poor soul; \bar "."
The blood of the cross is my on -- ly foun -- da -- tion, \bar "."
The death of my Sav -- iour now mak -- eth me whole. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Nor sil -- ver nor gold hath ob -- tained my re -- demp -- tion,
The guilt on my con -- science too heav -- y had grown;
The blood of the cross is my on -- ly foun -- da -- tion,
The death of my Sav -- iour a -- lone could a -- tone.

}

wordsC = \lyricmode {
\set stanza = "3."

Nor sil -- ver nor gold hath ob -- tained my re -- demp -- tion,
The ho -- ly com -- mand -- ment for -- bade me draw near;
The blood of the cross is my on -- ly foun -- da -- tion,
The death of my Sav -- iour re -- mov -- eth my fear.

}

wordsD = \lyricmode {
\set stanza = "4."

Nor sil -- ver nor gold hath ob -- tained my re -- demp -- tion,
The way in -- to heav -- en could not thus be bought;
The blood of the cross is my on -- ly foun -- da -- tion,
The death of my Sav -- iour re -- demp -- tion hath wrought.

}

underWords = \lyricmode {

{ \repeat unfold 46 \skip 4 }
{ \mon } I am re -- deemed, I am re -- deemed, { \moff } but not with sil -- ver;
I am bought, I am bought, but not with gold;
{ \mon } Bought with a { \moff } price— the pre -- cious blood of Je -- sus,

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set Staff.autoBeaming = ##f
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \set ChoirStaff.printPartCombineTexts = ##f
      {
        \partCombine #'(2 . 11) \notesSoprano \notesAlto
        \context Voice = sopranosRefrain { \notesSopranoRefrain }
      }
      \context NullVoice = sopranos { \voiceOne \notesSoprano }
      \context NullVoice = sopranosRefrainPacing { \voiceFour \notesSopranoRefrainPacing }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = two   \lyricsto sopranosRefrainPacing \Refrain
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \set Staff.autoBeaming = ##f
      \clef bass
      \set ChoirStaff.printPartCombineTexts = ##f
      \partCombine #'(2 . 11) \notesTenor \notesBass
      \context NullVoice = tenors { \voiceOne << \notesTenor >> }
    >>
    \context Lyrics = four \lyricsto tenors \underWords
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
