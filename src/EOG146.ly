\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  \include "override/override-EOG146.ily"
}

\header{
  hymnnumber = "146"
  title = "All the Path the Saints Are Treading"
  tunename = ""
  meter = "8. 7. 8. 7. D."
  poet = "Mrs. J. A. Trench" % see https://hymnary.org/person/Trench_JA1 ; see http://www.hymntime.com/tch/bio/t/r/e/trench_jw.htm
  composer = "George F. Händel (adapted)" % not found at hymnary.org
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=80 }
tb = { \tempo 2=40 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/2
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  f2 a g c | bes4( a) g( f) a2 c |
  bes d a c | c b c1

  f,2 a g c | bes4( a) g( f) a2 c |
  bes d a c | c b c1

  a4( c) f( e) d2 c | a4( c) f( e) d2 c |
  a4( c) f( e) d2 c4( bes) | a2 c g1

  c2 f, a4( g) f2 | c'4( a) g( f) g2 f |
  c'2 f,4( e) f( bes) a( g) | a2 g f1

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f2 f f f | f f f f |
  f f4( e) f2 f | f f e1 |

  f2 f f f | f f f f |
  f f4( e) f2 f | f f e1 |

  f2 f f f | f f f f |
  f f f f | f f e1 |

  f2 f f f | f f e f |
  f d f4( g) f ~ f | f2 e f1 |

}
}

notesTenor = {
\global
\relative a {

  a2 c bes a | d4( c) bes( a) c2 a |
  d bes c c | d d c1

  a2 c bes a | d4( c) bes( a) c2 a |
  d bes c c | d d c1

  c2 c bes a | c c bes a |
  c a bes c | c c c1

  a2 a c4( bes) a2 | a4( c) bes( a) bes2 a
  a c4( bes) a( c) c( d) | c2 bes2 a1

}
}

notesBass = {
\global
\relative f {

  f2 f f f | f f f f |
  f g a a | g g c,1

  f2 f f f | f f f f |
  f g a a | g g c,1

  f2 a bes f | f a bes f |
  f4( e) d( c) bes( bes') a( g) | f2 a, c1

  f2 f f f | f f c f |
  f a4( g) f( e) f( bes,) | c2 c f,1

}
}

wordsA = \lyricmode {
\set stanza = "1."

All the path the saints are tread -- ing, \bar "."
Trod -- den by the Son of God; \bar "."
All the sor -- rows they are feel -- ing, \bar "."
Felt by Him up -- on the road; \bar "."
All the dark -- ness, and the sor -- row \bar "."
From a -- round and from with -- in, \bar "."
All the joy and all the tri -- umph, \bar "."
He passed thro’ a -- part from sin. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Now come forth in res -- ur -- rec -- tion,
Pass -- ing on -- ward to the throne,
Hav -- ing suf -- fered all the judg -- ment,
Borne the storm of wrath a -- lone;
He is a -- ble thus to suc -- cor
Those who tread the des -- ert sand,
Press -- ing on to res -- ur -- rec -- tion,
Where He sits at God’s right hand.

}

wordsC = \lyricmode {
\set stanza = "3."

Now He prais -- es in th’as -- sem -- bly,
Now the sor -- row all is passed;
His the ear -- nest of our por -- tion,
We must reach the goal at last.
Yes, He prais -- es; grace re -- count -- ing
All the path al -- read -- y trod,
We as -- so -- ci -- a -- ted with Him_–
God, our Fa -- ther and our God.

}

wordsD = \lyricmode {
\set stanza = "4."

Join the sing -- ing that He lead -- eth,
Loud to God our voi -- ces raise;
Ev -- ’ry step that we have trod -- den
Is a tri -- umph of His grace:
Wheth -- er joy, or wheth -- er tri -- al,
All can on -- ly work for good,
For He heal -- eth all_– who loves us,
And hath bought us with His blood.

}

wordsE = \lyricmode {
\set stanza = "5."

It is fin -- ished! It is fin -- ished!
Who can tell re -- demp -- tion’s worth?
He who knows it leads the sing -- ing,
Full the joy, as fierce the wrath.
Ta -- ken up in res -- ur -- rec -- tion,
Des -- ert ways re -- hearsed a -- bove,
Tell the power of God’s sal -- va -- tion,
And His nev -- er -- fail -- ing love.

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
