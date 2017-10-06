\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  \include "override/override-EOG260.ily"
}

\header{
  hymnnumber = "260"
  title = "Precious Word of Deepest Meaning"
  tunename = ""
  meter = "8. 7. 8. 7. 8. 7. 8. 7. 7." % original has 8. 7. 8. 7. D.
  poet = ""
  composer = "From Mozart"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 6/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=80
  \key f \major
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  a8.[ bes16] a8 c4 c8 | g8.[ a16] g8 bes4 bes8 |
  f4 f8 g4 g8 | a4 c16[ bes] a4( g8) |
  a8.[ bes16] a8 c4 c8 | g8.[ a16] g8 bes4 bes8 |
  f4 g8 a4 bes8 | a4 g8 f4.

  c'8.[ d16] c8 d4 d8 | f8.[ e16] d8 d4 c8 |
  c8[ a] f c'[ bes] g | c[ a] f a4( g8) |
  a8.[ bes16] a8 c4 c8 | g8.[ a16] g8 bes4 bes8 |
  f4 g8 a4 bes8 | a4 g8 g4( a8) |
  a4 bes8 c4 d8 | a4 g8 f4 r8 |

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  f4 f8 f4 f8 | c4 c8 e4 e8 |
  d4 d8 e4 e8 | f4 g8 f4( e8) |
  f4 f8 f4 f8 | c4 c8 e4 e8 |
  f4 e8 f4 g8 | f4 e8 c4. |

  f4 f8 f4 f8 | f4 f8 f4 f8 |
  f4 c8 g'4 e8 | f4 d8 f4( e8) |
  f4 f8 f4 f8 | c4 c8 e4 e8 |
  d4 e8 f4 g8 | f4 e8 e4( f8) |
  f4 e8 f4 f8 | f4 e8 c4 r8 |

}
}

notesTenor = {
\global
\relative a {

  c4 c8 c4 c8 | c4 c8 c4 c8 |
  d4 a8 c4 c8 | c4 d8 c4. |
  c4 c8 c4 c8 | c4 c8 c4 c8 |
  c4 c8 c4 d8 | c4 bes8 a4. |
  a8.[ bes16] a8 bes4 bes8 | d8.[ c16] bes8 bes4 a8 |
  a4 a8 c4 c8 | c4 b8 c4. |
  c4 c8 c4 c8 | c4 c8 c4 c8 |
  a4 c8 c4 d8 | c4 bes8 bes4( c8) |
  c4 c8 c4 bes8 | c4 bes8 a4 r8 |

}
}

notesBass = {
\global
\relative f {

  f8.[ g16] f8 a4 a8 | e8.[ f16] e8 g4 g8 |
  d4 d8 c4 c8 | f4 bes8 c4( c,8) |
  f8.[ g16] f8 a4 a8 | e8.[ f16] e8 g4 g8 |
  d4 c8 f4 bes,8 | c4 c8 f4. |
  f4 f8 bes,4 bes8 | f'4 f8 f4 f8 |
  f4 f8 e4 bes'8 | a8[ f] g c,4. |
  f8.[ g16] f8 a4 a8 | e8.[ f16] e8 g4 g8 |
  d4 c8 f4 bes,8 | c4 c8 f4. |
  f4 g8 a4 bes8 | c,4 c8 f4 r8 |

}
}

wordsA = \lyricmode {
\set stanza = "1."

Pre -- cious word of deep -- est mean -- ing, \bar "."
Soft -- ly fall -- ing on mine ear; \bar "."
Fraught with joy, and com -- fort giv -- ing, \bar "."
Ban -- ish -- ing all dread and fear. \bar "."
“Trust,” yes, “trust,” ’tis sweet -- ly sound -- ing, \bar "."
Voice of Him who came to die, \bar "."
“Trust in Me and rest, thus find -- ing \bar "."
Cloud -- less joy with Me on high, \bar "."
Cloud -- less joy with Me on high.” \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Lost and ru -- ined, vile and way -- ward,
Deep -- ’ning gloom o’er -- hung my path;
Sins re -- count -- ing, death I fear -- ed,
Loomed be -- fore me end -- less wrath.
Now His voice, so sweet and ten -- der,
Gen -- tly whis -- pers to my soul,
\italicsOn “Trust, \italicsOff oh, trust in Me, the Sav -- iour,
I am He who makes thee whole,
I am He who makes thee whole.”

}

wordsC = \lyricmode {
\set stanza = "3."

Can I doubt, Lord, when I view Thee
In Thine hours of deep -- est woe;
Waves and bil -- lows roll -- ing o’er Thee,
Sor -- row Thine none else could know?
Doubt Thee, Je -- sus, will -- ing vic -- tim
In my stead on Cal -- v’ry’s tree!
Oh, what love, Lord, all tran -- scend -- ing,
Led Thee there to die for me,
Led Thee there to die for me.

}

wordsD = \lyricmode {
\set stanza = "4."

\italicsOn “Trust,” \italicsOff O Sav -- iour, Lord, I trust Thee,
Is the an -- swering word of faith
Of my soul_– till now so wear -- y_–
To Thy match -- less, per -- fect grace;
And thus trust -- ing, sim -- ply trust -- ing,
Joy and peace my heart pos -- sess;
Wait -- ing now for Thine own com -- ing,
Then to shine in end -- less bliss,
Then to shine in end -- less bliss.

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

\version "2.19.49"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond:
