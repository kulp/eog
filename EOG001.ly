\paper {
  #(set-paper-size "letter")
indent = 0\cm
top-margin = 1\cm
bottom-margin = 1\cm
left-margin = 2\cm
right-margin = 2\cm
}

\header{
title = "“Come!” ’Tis Jesus Gently Calling"
subsubtitle = "(’Tis So Sweet to Trust in Jesus. 8. 7. 8. 7. D.)"
%meter = "8.7.8.7. D."
poet = "Annie S. Ormsby"
composer = "Wm. J. Kirkpatrick"
%copyright = ""
tagline = ##f
}

notesSoprano = {
\relative a' {
c4 bes aes4. g8 f4 aes f ees | aes4 c ees4. c8 bes4 aes bes2
c4 bes aes4. g8 f4 aes f ees | aes4 c f,4. bes8 aes4 g aes2
c4 ees ees c bes aes c bes | c ees ees4. c8 bes4 aes bes2
c4 bes aes ees des'4. f,8 f4 ees | aes c f,4. bes8 aes4 g aes2
}
}

notesAlto = {
\relative e' {
ees4 des c4. ees8 des4 des des c | ees4 aes aes4. aes8 ees4 d ees2
ees4 des c4. ees8 des4 des des c | c4 ees des4. f8 ees4 ees ees2
aes4 aes aes aes g f aes g | aes aes aes4. aes8 ees4 d ees2
ees4 des c c f4. des8 des4 c | c ees des4. f8 ees4 ees ees2
}
}

notesTenor = {
\relative a {
aes4 ees ees4. aes8 aes4 aes \new Voice { \voiceOne aes aes } | c4 ees c4. ees8 ees4 bes g2
aes4 ees ees4. aes8 aes4 aes \new Voice { \voiceOne aes aes } | ees4 aes aes4. des8 c4 bes c2
ees4 c c ees des c ees ees | ees c c4. ees8 ees4 bes g2
aes4 ees ees aes aes4. aes8 aes4 aes | ees aes aes4. des8 c4 bes c2
}
}

notesBass = {
\relative a, {
aes4 aes aes4. c8 des4 f \new Voice { \voiceTwo aes aes } | aes4 aes aes4. aes8 g4 f ees2
aes,4 aes aes4. c8 des4 f \new Voice { \voiceTwo aes aes } | aes,4 aes des4. des8 ees4 ees aes,2
aes'4 aes aes aes ees f ees ees | aes aes aes4. aes8 g4 f ees2
aes,4 aes aes aes des4. des8 aes4 aes | aes aes des4. des8 ees4 ees aes2
}
}

\score {
<<
\relative c' \new Staff {
\override Staff.TimeSignature #'style = #'() \time 4/4
\tempo 4 = 90
\key aes \major
\clef treble << \notesSoprano \notesAlto >> }
\addlyrics {
\set stanza = "1."
“Come!” ’tis Je -- sus gen -- tly cal -- ling
“Ye with care and toil op -- pressed, \break
With your guilt how -- e’er ap -- pall -- ing—
Come, and I will give you rest.” \break
For your sin He “once has suf -- fered,”
On the cross the work was done, \break
And the word by God now ut -- tered
To each wear -- y soul is “Come!”
%    minimumVerticalExtent = #'(-1.5 . 1.5)
} \addlyrics {
\set stanza = "2."
“Come!” the Fa -- ther’s house stands o -- pen,
With its love and light and song;
And re -- turn -- ing to that Fa -- ther,
All to you may now be -- long.
From sin’s dis -- tant land of fam -- ine,
Toil -- ing ’neath the mid -- day sun,
To a Fa -- ther’s house of plen -- ty,
And a Fa -- ther’s wel -- come, “Come!”
} \addlyrics {
\set stanza = "3."
“Come!” for night is gath -- ’ring quick -- ly
O’er the world’s fast -- fleet -- ing day:
If you lin -- ger till the dark -- ness
You will sure -- ly miss your way.
And still wait -- ing— sad -- ly wait -- ing,
Till the day its course has run,
With His pa -- tience un -- a -- ba -- ting
Je -- sus lin -- gers for you— “Come!”
} \addlyrics {
\set stanza = "4."
“Come!” for an -- gel -- hosts are mus -- ing
O’er this sight so strange -- ly sad:
God “be -- seech -- ing”— man re -- fus -- ing
To be made for -- ev -- er glad!
From the world and its de -- lu -- sion
Now our voi -- ces rise as one;
While we shout God’s in -- vi -- ta -- tion,
Heav’n it -- self re -- ech -- oes “Come!”
}
\relative c, \new Staff { \override Staff.TimeSignature #'style = #'() \time 4/4 \key aes \major \clef bass << \notesTenor \notesBass >> }
>>
\midi{}
\layout{}
}

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

