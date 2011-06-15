\paper {
  #(set-paper-size "letter")
indent = 0\cm
top-margin = 1\cm
bottom-margin = 1\cm
left-margin = 2\cm
right-margin = 2\cm
}

\include "inc/changePitch.ly"


\header{
title = "As the Serpent Raised by Moses"
subsubtitle = "(Take The World But Give Me Jesus. 8. 7. 8. 7. D.)"
%meter = "8.7.8.7. D."
%poet = ""
%composer = ""
%copyright = ""
tagline = ##f
}

pattern = { f8. g16 | a4. a8 g8. a16 | c4 bes bes8. a16 | g4. f8 g8. a16 | f2 }

notesSoprano = {
\relative a' {

f g | a a g a | c bes bes a | g f g a | f
f g | a a g a | c bes bes a | g f a g | f
c' c | d d bes d | c a a a | g g a b | c
f, g | a a g a | c bes bes a | g f a g | f

}
}

notesAlto = {
\relative e' {

f f | f f e f | e e g f | e f e e | c
c e | f f e f | e e g f | e f e e | f
f f | f f f f | f f f f | e g f f | e
c c | f f e f | e e g f | e f e e | f

}
}

notesTenor = {
\relative a {

a bes | c c c c | c c c c | bes a bes c | a
a bes | c c c c | c c c c | bes a c bes | a
a a | bes bes d bes | a c c c | c e d d | c % TODO slur
a bes | c c c c | c c c c | bes a c bes | a

}
}

notesBass = {
\relative a {

f f | f f bes a | g g e f | c c c c | f
f f | f f bes a | g g e f | c c c c | f
f f | bes bes, bes bes | f' f f f | g g g g | c,
f f | f f bes a | g g e f | c c c c | f

}
}

\score {
<<
\relative c' \new Staff {
\autoBeamOff
\override Staff.TimeSignature #'style = #'() \time 3/4
%\tempo 4 = 90
\key f \major
\partial 4
\clef treble <<
\changePitch \pattern \notesSoprano
\changePitch \pattern \notesAlto
>> }
\addlyrics {
\set stanza = "1."

As the ser -- pent raised by Mos -- es \bar "|"
Healed the fier -- y ser -- pent’s bite, \bar "|"
Je -- sus now, Him -- self dis -- clos -- es \bar "|"
To the wound -- ed sin -- ner’s sight: \bar "|"
Hear His gra -- cious in -- vi -- ta -- tion, \bar "|"
“I have life and peace to give, \bar "|"
I have wrought out full sal -- va -- tion, \bar "|"
Sin -- ner, look to Me and live.” \bar "|"

%    minimumVerticalExtent = #'(-1.5 . 1.5)
} \addlyrics {
\set stanza = "2."

“Grieve a -- bout your sins no lon -- ger,
Well I know their might -- y guilt:
But My love than death is stron -- ger,
I My pre -- cious blood have spilt:
Tho’ your heart has long been har -- dened,
Look on Me— it soft shall grow;
Your trans -- gres -- sions shall be par -- doned,
And I’ll wash you white as snow.”

} \addlyrics {
\set stanza = "3."

“I have seen what you were do -- ing,
Tho’ you lit -- tle tho’t of Me;
You were mad -- ly bent on ru -- in,
But, I said— it shall not be:
You had been for -- ev -- er wretch -- ed,
Had I not es -- poused your part;
Now be -- hold My arms out -- stretch -- ed
To re -- ceive you to My heart.”

}

\relative c,
\new Staff {
\autoBeamOff
\override Staff.TimeSignature #'style = #'()
\time 3/4
\key f \major
\clef bass <<
\changePitch \pattern \notesTenor
\changePitch \pattern \notesBass
>> }
>>
\midi{}
\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

}

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

