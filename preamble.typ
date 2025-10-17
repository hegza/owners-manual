#let date-modified = datetime.today().display()

#let preamble(title, subtitle, author, version: none, date-created, doc) = [
  // Set the document's metadata
  #set document(title: title, author: author)

  #set page(paper: "a4", footer: context [
    #title --- #subtitle --- #version
    #h(1fr)
    #counter(page).display(
      "1/1",
      both: true,
    )
  ])

  // Set title block
  #{
    set par(first-line-indent: 0em)
    v(26pt)
    [
      #set par(justify: false)

      #align(center, [
        #text(20pt)[#title]\
        #text(15pt)[#subtitle]
      ])
    ]
  }

  // Styles
  #show link: it => underline(text(fill: blue)[#it])

  #doc

  #{
    let dc = smallcaps[Date created:]
    let dm = smallcaps[Date modified:]
    align(right)[
      #dc #date-created \
      #dm #date-modified \
      #if version != none [ #version by ]
      #author \
    ]
  }
]
