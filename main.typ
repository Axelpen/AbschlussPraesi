#import "@preview/touying:0.7.3": *
#import themes.university: *
#import themes.metropolis: *
#import "@preview/cetz:0.5.0"
#import "@preview/fletcher:0.5.8" as fletcher: node, edge
#import "@preview/numbly:0.1.0": numbly
#import "@preview/theorion:0.6.0": *
#import cosmos.clouds: *
#show: show-theorion

// cetz and fletcher bindings for touying
#let cetz-canvas = touying-reducer.with(reduce: cetz.canvas, cover: cetz.draw.hide.with(bounds: true))
#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  // align: horizon,
  // config-common(handout: true),
  config-common(frozen-counters: (theorem-counter,)),  // freeze theorem counter for animation
  config-info(
    title: [],
    subtitle: [Implementierung einer Client-Server Architektur zur zentralen Speicherung von Log-Daten auf Basis von ASP.NET Core],
    author: [Alexander Penck],
    date: datetime.today(),
    institution: [N.CAD Technology GmbH],
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

== Agenda <touying:hidden>

#components.adaptive-columns(outline(title: none, indent: 1em))

= Wer sind wir
#image("images/ncad.png")

== Wer sind wir
- N.CAD Technology GmbH
- 35 Mitarbeiter
- CAD/CAM Software
- 

= Analyse

== Analyse - Was?
- Persistente Speicherung von Log-Daten
- Log-Sendung per REST-API über HTML
- Verschlüsselung durch Challenge-Response


== Analyse - Wieso?
- MsgWin limitiert
- Häufig auftretende Fehler vermeiden
- Hohe Support-Auslastung

== Analyse - Wieso?
//TODO
Hier Bild mit TeamViewer, Maschine, Beschreibung vom Prozess:

Kunde ruft an, beschreibt das Problem, startet den Teamviewer, 5 Minuten weg

Kunde diktiert TeamViewer Passwort falsch, K wie Conrad, nochmal 5 Minuten weg

Support muss sich in die Umgebung reinfuchsen und das problem finden, 15 Mintuen weg.
25 Minuten wegen einem kleinen Fehler, welcher verhindert werden könnte. 
Vielleicht 10 Ncad Benutzer, welche dann alle individuell beim Support anrufen, 250 Minuten für ein preventable Fehler.

Erklären, dass NCAD oft Lokal läuft und Kunden teilweise 10 NCAD Benutzer hat. Weise ebenfalls drauf hin, dass diese Leute die es mal gefixed haben
eventuel im Urlaub sind. 

Support optional, manchmal schaffen es die Kunden auch selbst!! Trotzdem schlecht für die Kunden falls der "Fixer" es nicht dokummentiert hat

#image("images/msgwin.png")

== Analyse - Kosten

= Durchführung
== Durchführung - Anforderungen
#align(center,
[
#table(
  columns: (6cm, 10cm),
  stroke: (x: 0.6pt, y: 0.6pt),
  inset: 10pt,

  [#image("images/ncad.png", width: 100%)],
  [
    - Maximal 70 Stunden
    - Soll/Ist-Vergleich mit Zielsetzung muss erkennbar sein
    - Wirtschaftlichkeit muss berücksichtigt werden
    - Reales Projekt
  ],

  [#image("images/MsgWin.png", width: 100%)],
  [
    - Im Unternehmen etablierte Technologien
    - Wirtschaftlichkeit/Nutzen
    - Programming style guide
    - eMantix
  ],
)
])


== Simple Animation

We can use `#pause` to #pause display something later.

#pause

Just like this.

#meanwhile

Meanwhile, #pause we can also use `#meanwhile` to #pause display other content synchronously.

#speaker-note[
  + This is a speaker note.
  + You won't see it unless you use `config-common(show-notes-on-second-screen: right)`
]


== Complex Animation

At subslide #touying-fn-wrapper((self: none) => str(self.subslide)), we can

use #uncover("2-")[`#uncover` function] for reserving space,

use #only("2-")[`#only` function] for not reserving space,

#alternatives[call `#only` multiple times \u{2717}][use `#alternatives` function #sym.checkmark] for choosing one of the alternatives.


== Callback Style Animation

#slide(
  repeat: 3,
  self => [
    #let (uncover, only, alternatives) = utils.methods(self)

    At subslide #self.subslide, we can

    use #uncover("2-")[`#uncover` function] for reserving space,

    use #only("2-")[`#only` function] for not reserving space,

    #alternatives[call `#only` multiple times \u{2717}][use `#alternatives` function #sym.checkmark] for choosing one of the alternatives.
  ],
)


== Math Equation Animation

Equation with `pause`:

$
  f(x) &= pause x^2 + 2x + 1 \
  &= pause (x + 1)^2 \
$

#meanwhile

Here, #pause we have the expression of $f(x)$.

#pause

By factorizing, we can obtain this result.


== CeTZ Animation

CeTZ Animation in Touying:

#cetz-canvas({
  import cetz.draw: *

  rect((0, 0), (5, 5))

  (pause,)

  rect((0, 0), (1, 1))
  rect((1, 1), (2, 2))
  rect((2, 2), (3, 3))

  (pause,)

  line((0, 0), (2.5, 2.5), name: "line")
})


== Fletcher Animation

Fletcher Animation in Touying:

#fletcher-diagram(
  node-stroke: .1em,
  node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
  spacing: 4em,
  edge((-1, 0), "r", "-|>", `open(path)`, label-pos: 0, label-side: center),
  node((0, 0), `reading`, radius: 2em),
  edge((0, 0), (0, 0), `read()`, "--|>", bend: 130deg),
  pause,
  edge(`read()`, "-|>"),
  node((1, 0), `eof`, radius: 2em),
  pause,
  edge(`close()`, "-|>"),
  node((2, 0), `closed`, radius: 2em, extrude: (-2.5, 0)),
  edge((0, 0), (2, 0), `close()`, "-|>", bend: -40deg),
)


= Theorems

== Prime numbers

#definition[
  A natural number is called a #highlight[_prime number_] if it is greater
  than 1 and cannot be written as the product of two smaller natural numbers.
]
#example[
  The numbers $2$, $3$, and $17$ are prime.
  @cor_largest_prime shows that this list is not exhaustive!
]

#theorem(title: "Euclid")[
  There are infinitely many primes.
]
#pagebreak(weak: true)
#proof[
  Suppose to the contrary that $p_1, p_2, dots, p_n$ is a finite enumeration
  of all primes. Set $P = p_1 p_2 dots p_n$. Since $P + 1$ is not in our list,
  it cannot be prime. Thus, some prime factor $p_j$ divides $P + 1$. Since
  $p_j$ also divides $P$, it must divide the difference $(P + 1) - P = 1$, a
  contradiction.
]

#corollary[
  There is no largest prime number.
] <cor_largest_prime>
#corollary[
  There are infinitely many composite numbers.
]

#theorem[
  There are arbitrarily long stretches of composite numbers.
]

#proof[
  For any $n > 2$, consider $
    n! + 2, quad n! + 3, quad ..., quad n! + n
  $
]


= Others

== Multiple columns

#cols[
  First column.
][
  Second column.
]

== Multiple columns with equal height blocks

#cols(columns: (1fr, 1fr), gutter: 1em)[
  #emph-block[
    First column with equal height: #lorem(10)
    #lazy-v(1fr)
  ]
][
  #emph-block[
    Second column with equal height: : #lorem(15)
    #lazy-v(1fr)
  ]
]


== Multiple Pages

#lorem(200)


#show: appendix

= Appendix

== Appendix

Please pay attention to the current slide number.
