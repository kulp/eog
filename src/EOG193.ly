\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  system-count = #(cond (is-eogsized 5) (#t #f))
}

\header{
  hymnnumber = "193"
  title = "Sweet Peace, The Gift of God’s Love"
  tunename = ""
  meter = ""
  poet = "P. P. Bilhorn"
  composer = "P. P. Bilhorn"
  tagline = ##f
}

ta = { \tempo 8=120 }
tb = { \tempo 8=80 } % not half the normal tempo in this case (aesthetic)

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key a \major
  \partial 8
  \autoBeamOff
}

patternA = { c8 | c8. c16 c8 c c c | c4. c4 }
patternB = { c8 | c8. c16 c8 c c c | c4 c8 c4 }
patternC = { c8 | c4 c8 c8. c16 c8 | c4. c4 c8 }

notesSoprano = {
\global
\relative c' {

  e8 | cis'8. b16 a8 cis, e a | gis4. ~ gis4 \eogbreak
  \changePitch \patternA { e | d' cis b fis gis fis | e ~ e } \eogbreak
  \changePitch \patternA { e | e' d cis b a gis | gis( fis) }
  \changePitch \patternC { fis | e a gis a b | a ~ a r }

  \eogbreak
  << s^\markup { \small \caps "Refrain" }
  { cis4. a | d cis } >>
  b8. b16 b8 b a fis | e4.~ \tb e4 \fermata \ta \eogbreak
  \changePitch \patternA { e | a a a a b cis | d ~ d }
  fis,8 | e4 e8 e e e | e4. ~ e4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternB { cis | e d cis a cis cis | d d d }
  \changePitch \patternB { d | e e e d d d | cis d cis }
  \changePitch \patternA { cis | e e e e e eis | eis( fis) }
  \changePitch \patternC { d | cis cis d cis d | cis ~ cis r }

  e4. cis | fis e
  dis8. dis16 dis8 dis dis dis | e8[ b] cis d4
  \changePitch \patternA { d | cis cis cis a' gis g | fis ~ fis }
  d8 | cis4 cis8 b cis d | cis4. ~ cis4

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternB { a | a a a e a a | b b b }
  \changePitch \patternB { gis | b a gis gis b gis | a fis e }
  \changePitch \patternA { a | cis b a gis a b | b( a) }
  \changePitch \patternC { a | a a b a gis | a ~ a r }

  a4. a | a a
  fis8. fis16 fis8 fis b a | gis4 a8 b4
  gis8 | a8. e16 e8 cis' d e16[ a,] | a4. ~ a4
  a8 | a4 a8 gis a b | a4. ~ a4

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternA { a | a a a a a a | e' ~ e }
  \changePitch \patternA { e | e e e e e e | a, ~ a }
  \changePitch \patternA { a | a a a b cis cis | d ~ d }
  \changePitch \patternC { d | e e e e e | a, ~ a r }

  a4. a | a a
  b8. b16 b8 b b b | e4. ~ e4_\fermata
  \changePitch \patternA { e | a, a a a' a a | d, ~ d }
  d8 | e4 e8 e e e | a,4. ~ a4

}
}

Refrain = \lyricmode {

Peace, peace, sweet peace, \bar "."
Won -- der -- ful gift from a -- bove; %{HIDE>%} (a -- bove;) %{<HIDE%} \bar "."
Oh, won -- der -- ful, won -- der -- ful peace, \bar "."
Sweet peace, the gift of God’s love! \bar "."

}

wordsA = \lyricmode {
\set stanza = "1."

There comes to my heart a sweet strain, %{HIDE>%} (sweet strain,) %{<HIDE%} \bar "."
A glad and a joy -- ous re -- frain; %{HIDE>%} (re -- frain;) %{<HIDE%} \bar "."
I sing it a -- gain and a -- gain, \bar "."
Sweet peace, the gift of God’s love. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Through Christ on the cross peace was made; %{HIDE>%} (was made,) %{<HIDE%}
My debt by His death was all paid; %{HIDE>%} (all paid;) %{<HIDE%}
No oth -- er foun -- da -- tion is laid
For peace, the gift of God’s love.

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

When Je -- sus as Lord I had owned, %{HIDE>%} (had owned,) %{<HIDE%}
My heart with His peace did a -- bound; %{HIDE>%} (a -- bound;) %{<HIDE%}
In Him a rich bless -- ing I found,
Sweet peace, the gift of God’s love.

}

wordsD = \lyricmode {
\set stanza = "4."

In Je -- sus for peace I a -- bide, %{HIDE>%} (a -- bide,) %{<HIDE%}
And as I keep close to His side, %{HIDE>%} (His side,) %{<HIDE%}
There’s noth -- ing but peace doth be -- tide,
Sweet peace, the gift of God’s love.

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
      \context Lyrics = one   \lyricsto altos \wordsA
      \context Lyrics = two   \lyricsto altos \wordsB
      \context Lyrics = three \lyricsto altos \wordsC
      \context Lyrics = four  \lyricsto altos \wordsD
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
