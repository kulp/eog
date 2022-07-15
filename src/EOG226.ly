\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  %gospel
  hymnnumber = "226"
  title = "I Once Was a Stranger"
  tunename = "Adeste Fideles"
  meter = "5—11s." % original has 11. 11. 11. 11.
  poet = "Robert Murray McCheyne" % see https://hymnary.org/text/i_once_was_a_stranger_to_grace_and_to_go
  composer = "John Francis Wade" % see https://hymnary.org/tune/adeste_fideles_wade
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key a \major
  \partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a4 | a2 e4 a | b2 e,4 cis' | cis( b) cis d | cis2( b4)
  a4 | a2 gis4 fis | gis( a) b cis | gis2 fis4. e8 | e2.
  e'4 | e2 d4 cis | d2 cis4 cis | b( cis) a b | gis4.( fis8 e4)
  a4 | a( gis) a b | a2 e4 cis' | cis( b) cis d | cis2( b4)
  cis4 | d( cis) b a | gis2 a4 d | cis2 b4. a8 | a2.

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  e4 | e2 cis4 e | e2 e4 e | e2 e4 fis | e2.
  cis4 | dis2 e4 dis | e( dis) e e | e2 dis4. e8 | e2.
  a4 | a2 gis4 a | b2 a4 a | fis( eis) fis fis | e2.
  e4 | e2 e4 e | e2 e4 a | a( gis) a b | a2( gis4)
  a4 | gis( a) b dis, | e2 e4 a | a2 gis4. a8 | a2.

}
}

notesTenor = {
\global
\relative a {

  cis4 | cis2 a4 a | gis2 gis4 a | a( gis) a a | a2( gis4)
  a4 | fis2 b4 b | b( a) gis e | b'2 a4. gis8 | gis2.
  cis4 | cis2 d4 e | e2 e4 e | d( gis,) a dis | e4.( a,8 gis4)
  cis4 | cis( b) cis d | cis2 cis4 e | e2 e4 fis | e2.
  cis4 | b( cis8[) dis] e4 b | b2 cis4 fis | e2 e4( d8) cis | cis2.

}
}

notesBass = {
\global
\relative f {

  a4 | a2 a,4 cis | e2 e4 a | a( e) a d, | e2.
  fis4 | b,2 b'4 a | gis( fis) e a, | b2 b4. e8 | e2.
  cis'4 | cis2 b4 a | gis2 a4 a | d,4( cis) fis b, | e2.
  a4 | e2 e4 e | a,2 a4 a' | a( e) a d, | e2.
  a4 | b( a) gis fis | e( d) cis b | e2 e4. a,8 | a2.

}
}

wordsA = \lyricmode {
\set stanza = "1."

I once was a stran -- ger to grace and to God; \bar "."
I knew not my dan -- ger, I felt not my load; \bar "."
Though friends spoke in rap -- ture of Christ on the tree, \bar "."
“Je -- ho -- vah Tsid -- ke -- nu” was noth -- ing to me, \bar "."
“Je -- ho -- vah Tsid -- ke -- nu” was noth -- ing to me. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

When free grace a -- woke me by light from on high,
Then le -- gal fears shook me, I trem -- bled to die:
No ref -- uge, no safe -- ty, in self could I see;
“Je -- ho -- vah Tsid -- ke -- nu” my Sav -- iour must be,
“Je -- ho -- vah Tsid -- ke -- nu” my Sav -- iour must be.

}

wordsC = \lyricmode {
\set stanza = "3."

My ter -- rors all van -- ished be -- fore the sweet name;
My guilt -- y fears ban -- ished, with bold -- ness I came
To drink at the foun -- tain, life -- giv -- ing and free,
“Je -- ho -- vah Tsid -- ke -- nu”  is all things to me,
“Je -- ho -- vah Tsid -- ke -- nu”  is all things to me.

}

wordsD = \lyricmode {
\set stanza = "4."

“Je -- ho -- vah Tsid -- ke -- nu!” my treas -- ure and boast;
“Je -- ho -- vah Tsid -- ke -- nu!” I ne’er can be lost;
In Thee I shall con -- quer by flood and by field,
My ca -- ble, my an -- chor, my breast -- plate and shield,
My ca -- ble, my an -- chor, my breast -- plate and shield!

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
