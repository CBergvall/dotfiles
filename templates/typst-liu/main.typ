#import "template.typ": *

#show: project.with(
  course: "Kurskod: Kursnamn",
  title: "Titel",

  authors: (
    (name: "Carl Bergvall", email: "carbe814@student.liu.se"),
  ),

  table_of_c: false,

  term: "Höst/Vårterminen 2020",
  version: "1.0",
  date: "2020-01-01",
)

// #import "@preview/wordometer:0.1.5": total-words, word-count
// #show: word-count
// words: #total-words

// = Revisionshistorik
// #table(
//   columns: (5.5em, 1fr, 5.5em),
//   inset: 4pt,
//   stroke: 0.5pt,
//   [*Version*], [*Revisionsbeskrivning*], [*Datum*],
//   [1.0], [Första utkast], [2020-01-01],
// )

= Introduktion
#lorem(50)

= Exempel
#lorem(50)
