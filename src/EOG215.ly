\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-last-bottom = ##t
  system-system-spacing.padding = 6
}

\header{
  hymnnumber = "215"
  title = "Happy They Who Trust in Jesus"
  tunename = "Segur"
  meter = "8. 7. 8. 7. 8. 7." % original has 8. 7. 8. 7. 4. 7
  poet = "T. Kelly"
  composer = "J. P. Holbrook, 1822 -"
  tagline = ##f
}

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature.style = #'numbered
  \time 9/8
  \override Score.MetronomeMark.transparent = ##t % hide all fermata changes too
  \tempo 4=100
  \key ees \major
  \partial 4.
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  bes4 g8 | ees'4. ~ ees4 d8 f8[ ees] c | bes4. g
  g8[ aes] bes | f4. ~ f4 f8 bes4 aes8 | g4. ~ g4 r8
  bes4 g8 | ees'4. ~ ees4 d8 f8[ ees] c | bes4. g
  ees'8[ d] c | <f bes,>4. ~ <f bes,>4 bes,8 d4 c8 | bes4. ~ bes
  f8[ e] f | aes4. f aes8[ g] aes | c4. bes
  ees8[ d] f | bes,4. ~ bes4 g8 aes8[ f] g | ees4. ~ ees

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  ees4 ees8 | g4. ~ g4 g8 aes4 aes8 | g4. ees
  ees8[ f] g | bes,4. ~ bes4 bes8 g'4 f8 | ees4. ~ ees4 r8
  ees4 ees8 | g4. ~ g4 g8 aes4 aes8 | g4. ees
  ees8[ f] g | f4. ~ f4 d8 f4 ees8 | d4. ~ d
  d8[ cis] d | f4. d f8[ e] f | aes4. g
  g4 aes8 | g4. ~ g4 ees8 d4 d8 | bes4. ~ bes

}
}

notesTenor = {
\global
\relative a {

  g4 g8 | bes4. ~ bes4 bes8 c4 d8 | ees4. bes
  r4 r8 | R1*9/8 | r4. r4.
  g4 g8 | bes4. ~ bes4 bes8 c4 d8 | ees4. bes
  c8[ b] c | d4. ~ d4 bes8 bes4 a8 | bes4. ~ bes
  { \repeat unfold 9 \skip 4 }
  bes4 c8 | ees4. ~ ees4 bes8 bes4 aes8 | g4. ~ g


}
}

notesBass = {
\global
\relative f {

  ees4 ees8 | ees4. ~ ees4 ees8 <ees aes,>4 <ees aes,>8 | ees4. ees
  r4 r8 | R1*9/8 | r4. r4.
  ees4 ees8 | ees4. ~ ees4 ees8 aes,4 aes8 | ees'4. ees
  c8[ d] ees | f4. ~ f4 f8 f4 f8 | bes,4. ~ bes
  \override NoteHead.font-size = #-4
  bes4. | bes bes bes | ees4. ees
  \override NoteHead.font-size = #0
  ees4 ees8 | ees4. ~ ees4 ees8 bes4 bes8 | ees4. ~ ees

}
}

wordsA = \lyricmode {
\set stanza = "1."

Hap -- py they who trust in Je -- sus; \bar "."
Sweet their por -- tion is and sure; \bar "."
When the foe on oth -- ers seiz -- es, \bar "."
He will keep His own se -- cure. \bar "."
Hap -- py peo -- ple; hap -- py peo -- ple; \bar "."
Hap -- py, tho’ de -- spised and poor. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Since His love and mer -- cy found us,
We are pre -- cious in His sight;
Thou -- sands now may fall a -- round us,
Thou -- sands more be put to flight;
But His pres -- ence, but His pres -- ence,
Keeps us safe by day and night.

}

wordsC = \lyricmode {
\set stanza = "3."

Lo! our Sav -- iour nev -- er slum -- bers,
Ev -- er watch -- ful is His care;
Tho’ we can -- not boast of num -- bers,
In His strength se -- cure we are.
Sweet their por -- tion, sweet their por -- tion,
Who our Sav -- iour’s kind -- ness share.

}

wordsD = \lyricmode {
\set stanza = "4."

As the bird, be -- neath her feath -- ers,
Guards the ob -- jects of her care,
So the Lord His chil -- dren gath -- ers,
Spreads His wings and hides them there.
Thus pro -- tect -- ed, thus pro -- tect -- ed,
All their foes they bold -- ly dare.

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
