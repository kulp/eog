\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  page-count = #(cond (is-eogsized 2) (#t #f))
  system-count = #(cond (is-eogsized 6) (#t #f))
}

\header{
  hymnnumber = "299"
  title = "Come, Children, and Learn of the Infinite Grace"
  markuptitle = \markup \center-column { "Come, Children, and Learn of the" "Infinite Grace" \vspace #0.4 }
  tunename = "Grace"
  meter = "P. M."
  poet = ""
  composer = ""
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
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees8[ f] | g4 f8 g bes[ aes] g aes | c4 bes8. bes16 bes4
  g8[ aes] | bes[ g] ees' d c[ bes] aes g | g4( f2)
  ees8( f) | g4 f8 g bes[ aes] g aes | c4 bes8. bes16 bes4
  aes8( f) | ees4 ees8 g g[ f] ees d | f4( \tb ees2\fermata) \ta

  g8[ aes] | bes[ g] d' c bes[ aes] g f | aes4 g8. g16 g4
  g8[ aes] | bes[ g] ees' d c[ bes] aes g | g4( f2)
  ees8 f | g4 f8 g bes[ aes] g aes | c4 bes8. bes16 bes4
  aes8 f | ees4 ees8 g g[ f] ees d | f4( ees2)

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4 | ees ees8 ees f4 ees8 ees | ees4 ees8. ees16 ees4
  ees4 | ees g8 bes aes[ g] f ees | ees4( d2)
  ees8 ~ ees | ees4 ees8 ees f4 ees8 ees | ees4 ees8. ees16 ees4
  c8 ~ c | bes4 ees8 ees c4 bes8 bes | d4( ees2)

  ees8[ f] | g[ ees] aes aes f4 d8 d | d4 ees8. ees16 ees4
  ees4 | ees g8 bes aes[ g] f ees | ees4( d2)
  ees8 ees | ees4 ees8 ees f4 ees8 ees | ees4 ees8. ees16 ees4
  c8 c | bes4 ees8 ees c4 bes8 bes | d4( ees2)

}
}

notesTenor = {
\global
\relative a {

  g8[ aes] | bes4 aes8 bes f4 bes8 aes | aes4 g8. g16 g4
  bes4 | bes c8 c c4 c8 c bes2.
  g8( aes) | bes4 aes8 bes f4 bes8 aes | aes4 g8. g16 g4
  c8( aes) | g4 g8 ees bes'8[ aes] g f | aes4( g2)

  bes4 | ees b8 c f,4 bes8 aes | f4 g8. g16 g4
  bes4 | bes c8 c c4 c8 c bes2.
  g8 aes | bes4 aes8 bes f4 bes8 aes | aes4 g8. g16 g4
  c8 aes | g4 g8 ees bes'8[ aes] g f | aes4( g2)

}
}

notesBass = {
\global
\relative f {

  ees4 | ees4 ees8 ees d4 ees8 c | aes4 ees'8. ees16 ees4
  ees8[ f] | g[ ees] c c f4 aes,8 aes | bes2.
  ees8 ~ ees | ees4 ees8 ees d4 ees8 c | aes4 ees'8. ees16 ees4
  aes,8 ~ aes | bes4 c8 c f,4 bes8 bes | bes4( ees2)

  ees4 | ees ees8 ees d4 bes8 bes | ees4 ees8. ees16 ees4
  ees8[ f] | g[ ees] c c f4 aes,8 aes | bes2.
  ees8 ees | ees4 ees8 ees d4 ees8 c | aes4 ees'8. ees16 ees4
  aes,8 aes | bes4 c8 c f,4 bes8 bes | bes4( ees2)

}
}

wordsA = \lyricmode {
\set stanza = "1."

Come, chil -- dren and learn of the in -- fin -- ite grace \bar "."
Of Je -- sus in com -- ing to die; \bar "."
{ \mon } How He { \moff } left His high throne, in the glo -- ry a -- bove, \bar "."
His beau -- ti -- ful home in the sky. \bar "."
O, think of the Lamb who on Cal -- va -- ry died, \bar "."
And died for such sin -- ners as we; \bar "."
Of the thorns on His brow, and the spear in His side, \bar "."
When He suf -- fered and bled on the tree. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Ah! nev -- er was sor -- row so bit -- ter as this,
The an -- guish He suf -- fered be -- low,
{ \mon } For the { \moff } dear Son of God had done noth -- ing a -- miss,
{ \mon } ’Twas for { \moff } oth -- ers He tast -- ed such woe.
O, think of His love when He gave up His life
For sin -- ners so guilt -- y as we;
’Twas for them that He fin -- ished the con -- flict and strife,
’Twas for them that He bled on the tree.

}

wordsC = \lyricmode {
\set stanza = "3."

Give ear, lit -- tle ones, is it noth -- ing to you,
The tale of His won -- der -- ful grace?
{ \mon } When He { \moff } comes in the clouds, will you joy -- ful -- ly view,
Or trem -- ble to look at His face?
O, think of the Lamb who on Cal -- va -- ry died,
And died for such sin -- ners as we;
Of the thorns on His brow, and the spear in His side,
When He suf -- fered and bled on the tree.

}

wordsD = \lyricmode {
\set stanza = "4."

When He com -- eth back in His glo -- ry so bright,
The wick -- ed may well have de -- spair;
But chil -- dren who love Him will rise with de -- light,
To meet their blest Lord in the air.
O, think of His love when He gave up His life
For sin -- ners so guilt -- y as we;
’Twas for them that He fin -- ished the con -- flict and strife,
’Twas for them that He bled on the tree.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
