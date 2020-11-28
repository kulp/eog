\include "common/global.ily"
\paper {
  \include "common/paper.ily"
}

\header{
  hymnnumber = "249"
  title = "Oh, How He Loves!"
  tunename = ""
  meter = "8. 4. 8. 4. 8. 8. 8. 4."
  poet = "John Newton, adapted by Marianne Nunn" % see https://hymnary.org/text/one_there_is_above_all_others_o_how_he_l ; see https://hymnary.org/text/one_there_is_above_all_others_well_deser
  composer = "Hubert P. Main" % see https://hymnary.org/tune/one_there_is_above_all_others_main
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 4/4
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=90
  \key d \major
  \autoBeamOff
}

patternA = { c4. c8 c4 c4 | }
patternB = { c2 c4. c8 | c2. c4 }
patternC = { c4 c c c | c4. c8 c4 c | }
patternD = { c4 c c4. c8 | c4 c c c }
patternE = { c2 c4 c | c2. c4 }
patternF = { c4( c) c4. c8 | c2. c4 }

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { a a a fis | d' b a fis }
  \changePitch \patternB { b a fis | e r } \eogbreak
  \changePitch \patternA { a a a fis | d' b a fis }
  \changePitch \patternF { a d e cis | d r } \eogbreak

  \changePitch \patternC { e, e e fis | a g g e }
  \changePitch \patternC { fis fis fis g | b a a fis } \eogbreak
  \changePitch \patternD { d' d d d | e d d b }
  \changePitch \patternE { a d cis | d r } \eogbreak

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternA { fis fis fis d | g g fis d }
  \changePitch \patternB { d d d | cis r }
  \changePitch \patternA { d d fis d | d g fis d }
  \changePitch \patternB { fis g e | fis r }

  \changePitch \patternC { cis cis cis d | fis e e cis }
  \changePitch \patternC { d d d e | g fis fis d }
  \changePitch \patternD { fis g a a | g g g g }
  \changePitch \patternE { fis fis e | fis r }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternA { a a a a | b d d a }
  \changePitch \patternB { g a a | a r }
  \changePitch \patternA { fis fis a a | b d d a }
  \changePitch \patternF { d a a a | a r }

  \changePitch \patternC { a a a a | a a a a }
  \changePitch \patternC { a a a a | d d d a }
  \changePitch \patternD { a a a c | b b b d }
  \changePitch \patternE { d a a | a r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternA { d d d d | d d d d }
  \changePitch \patternB { g fis d | a' r }
  \changePitch \patternA { d, d d d | g g d d }
  \changePitch \patternB { d a a | d r }

  \changePitch \patternC { a a a a | a a a a }
  \changePitch \patternC { d d d d | d d d d }
  \changePitch \patternD { d e fis fis | g g g g }
  \changePitch \patternE { a a, a | d r }

}
}

wordsA = \lyricmode {
\set stanza = "1."

One there is a -- bove all oth -- ers, \bar "."
Oh, how He loves! \bar "."
His is love be -- yond a broth -- er’s, \bar "."
Oh, how He loves! \bar "."
Earth -- ly friends may fail or leave us, \bar "."
One day soothe, the next day grieve us, \bar "."
But this Friend will ne’er de -- ceive us, \bar "."
Oh, how He loves! \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Joy and peace it is to know Him,
Oh, how He loves!
Think, oh, think how much we owe Him,
Oh, how He loves!
With His pre -- cious blood He bought us,
In the wil -- der -- ness He sought us,
To His loved ones safe -- ly brought us,
Oh, how He loves!

}

wordsC = \lyricmode {
\set stanza = "3."

We have found a friend in Je -- sus,
Oh, how He loves!
’Tis His great de -- light to bless us,
Oh, how He loves!
How our hearts de -- light to hear Him
Bid us dwell in safe -- ty near Him!
Why should we dis -- trust or fear Him?
Oh, how He loves!

}

wordsD = \lyricmode {
\set stanza = "4."

Thro’ His name we are for -- giv -- en,
Oh, how He loves!
Back -- ward shall our foes be driv -- en,
Oh, how He loves!
Best of bless -- ings He’ll pro -- vide us,
Naught but good shall e’er be -- tide us,
Safe to glo -- ry He will guide us,
Oh, how He loves!

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
