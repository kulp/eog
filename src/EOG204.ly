\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "204"
  title = "A Little Talk With Jesus"
  tunename = ""
  meter = "P. M."
  poet = "R. L. Allan"
  composer = "H. Hankinson"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 2/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=70
  \key ees \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  ees8 ~ ees | g bes aes g | f ees
  g8( bes) c ees d c | bes4
  aes8( g) | f bes d c | bes aes
  g8( f) ees g f ees | f4
  g8( aes) bes8 g f ees | a a
  g8( f) | ees' c a f | bes4
  c8( d) | ees d c bes | bes aes
  g8( f) | ees^\markup{ \italic rit. } d c d | ees4

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees8 ~ ees | ees ees ees ees | d ees
  ees8 ~ ees | ees ees ees ees | ees4
  f8( ees) | d f f ees | d f
  ees8( d) | ees ees c c | d4
  ees8 ~ ees | ees ees f c | ees ees
  ees8( f) | f f ees ees | d4
  ees8( f) | ees g aes ees | ees ees
  c8 ~ c | bes bes c bes | bes4

}
}

notesTenor = {
\global
\relative a {

  g8 ~ g | bes g c bes | aes g
  bes8( g) | aes c bes aes | g4
  bes8 ~ bes | bes d bes a | bes bes
  bes8 ~ bes | bes c a a | bes4
  bes8 ~ bes | bes bes bes c | c c
  bes8( a) | a a c a | bes4
  aes8 ~ aes | g bes ees des | des c
  bes8( aes) | g f aes aes | g4

}
}

notesBass = {
\global
\relative f {

  ees8 ~ ees | ees ees ees ees | bes ees
  ees8 ~ ees | aes, aes' aes c, | ees4
  d8( ees) | f f f f | bes, d
  ees8( aes) | g c, f f | bes,4
  ees8( f) | g ees d c | f f
  f8 ~ f | f f f f | bes,4
  bes8 ~ bes | ees ees ees g | aes aes
  aes,8 ~ aes | bes bes bes bes | ees4

}
}

wordsA = \lyricmode {
\set stanza = "1."

A lit -- tle talk with Je -- sus– \bar "."
{ \mon } How it { \moff } smoothes the rug -- ged road, \bar "."
{ \mon } How it { \moff } seems to help me on -- ward, \bar "."
{ \mon } When I { \moff } faint be -- neath my load: \bar "."
{ \mon } When my { \moff } heart is crushed with sor -- row, \bar "."
{ \mon } And my { \moff } eyes with tears are dim, \bar "."
{ \mon } There is { \moff } naught can yield me com -- fort \bar "."
{ \mon } Like a { \moff } lit -- tle talk with Him. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

I tell Him I am wear -- y,
{ \mon } And I { \moff } fain would be at rest,
{ \mon } And I’m { \moff } dai -- ly, hour -- ly long -- ing
{ \mon } For a { \moff } home up -- on His breast;
{ \mon } And He { \moff } an -- swers me so sweet -- ly,
In tones of ten -- d’rest love,
{ \mon } “I am { \moff } com -- ing soon to take thee
{ \mon } To my { \moff } hap -- py home a -- bove.”

}

wordsC = \lyricmode {
\set stanza = "3."

I know the way is drear -- y,
To yon -- der far -- off clime,
{ \mon } But a { \moff } lit -- tle talk with Je -- sus
Will while a -- way the time:
And yet the more I know Him,
And all His grace ex -- plore,
It on -- ly sets me long -- ing
To know Him more and more.

}

wordsD = \lyricmode {
\set stanza = "4."

I can -- not live with -- out Him,
Nor would I if I could;
He is my dai -- ly por -- tion,
My med -- icine and my food:
He’s al -- to -- geth -- er love -- ly,
None can with Him com -- pare–
The chief a -- mong ten thou -- sand,
The fair -- est of the fair.

}

wordsE = \lyricmode {
\set stanza = "4."

{ \mon } So I’ll { \moff } wait a lit -- tle lon -- ger,
Till His ap -- point -- ed time,
And glo -- ry in the know -- ledge
That such a hope is mine;
Then in my Fa -- ther’s dwell -- ing,
Where man -- y man -- sions be,
I’ll sweet -- ly talk with Je -- sus,
And He shall talk with me.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \partcombine #'(2 . 9) \notesSoprano \notesAlto
      \context NullVoice = sopranos { \voiceOne << \notesSoprano >> }
      \context NullVoice = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
      \context Lyrics = five  \lyricsto sopranos \wordsE
    >>
    \context Staff = men <<
      \clef bass
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
