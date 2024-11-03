
#let current_act = state("act")
#let current_scene = state("scene")

#let act(title, body) = [
  #align(center)[ = #emph(title) ] 
  #v(1em)
  #current_act.update(title)
  #metadata("Begin of act " + title)<act>
  #body
  #metadata("End of act " + title)<act>
]

#let scene(title, body) = [
  #align(center)[ == #emph(title)]
  #v(0.5em)
  #current_scene.update(title)
  #metadata("Begin of scene " + title)<scene>
  #body
  #metadata("End of scene " + title)<scene>
]

#let regie-table(dict) = [
  #align(center)[
    #for (k, v) in dict [
      #emph(k): #v\    
    ]
  ]
]

#let scene-description(body) = {
  block(inset: (left: 1.5cm, top: 0.5cm, bottom: 0.5cm, right: 1.5cm))[
    #body
  ]
}

#let regie(body) = [
  #set text(style: "italic")
  #body
]

#let inline-regie(body) = [
  #regie[(#body)]
]

#let dramaTemplate(
  title, 
  numbering,
  paper,
  doc) = {
  
  let getAct() = {
    let result-act = query(<act>)
        .filter(act => here().page() == act.location().page())
    if result-act.len() == 0 {
      let state = current_act.get()
      if (state == none) { return title } else { return state }
    } else {
      return current_act.at(result-act.first().location())
    }
  }

  let getScene() = {
    let result-scene = query(<scene>)
        .filter(act => here().page() == act.location().page())
    if result-scene.len() == 0 {
      let state = current_scene.get()
      return state
    } else {
      return current_scene.at(result-scene.first().location())
    }
  }

  let getTitle() = {
    let scene = getScene()
    let act = getAct()
    if (scene == none) [
      #act
    ] else [
      #act - #scene
    ]
  }

  let getHeader() = [
    #let header-title = context getTitle()
    #align(center, text(size: 10pt, style: "italic")[#header-title])
    #v(4pt, weak: true)
    #line(length: 100%, stroke: 0.5pt)
  ]

  current_act.update(title)
  set page(paper: paper, header: getHeader())
  set par(linebreaks: "optimized", justify: true)
  set text(font: "Palatino", size: 12pt)
  set page(numbering: numbering)
  show heading: set text(weight: 300)
  counter(page).update(1)
  doc
}

#let setupDrama(title: "Default Title", characters: (:), numbering: "— 1 —", paper: "a5") = {

  let characterColumn(v) = {
    if type(v) == "dictionary" {
      v.at("full")
    } else {
      v.map(x => x.at("full")).join("\n")
    }
  }
  let characterTable(characters) = [
    #align(center)[
      #grid(
      columns: 2,
      column-gutter: 10pt,
      row-gutter: 15pt,
      ..for c in characters {
        let key = c.at("description")
        let value = c.at("characters") 
        (grid.cell(align: left, emph(key)),
        grid.cell(align: left, characterColumn(value)))
      }
      )
    ]
  ]

  let getSpacing(value: "") = {
    if value == "" {
      h(0pt)
    } else {
      h(2.5pt)
    }
  }

  let speak(body, character: "", instructio: "") = {
    let spacing = getSpacing(value: instructio)
    par(hanging-indent: 10pt, 
      text(tracking: 1pt, upper(character)) + 
        h(5pt) + 
        text(style: "italic", instructio) + 
        spacing +
        body
    )
  }

 
  let function-dict = (:)
  let character-dict = (:)
  let character-print-dict = (:)



  let character-name(character) = {
    if "short" in character.keys() {
      character.at("short")
    } else {
      character.at("full")
    }
  }

  let clean-character(character) = {
    lower(character-name(character)).split().join("-")
  }

  for v in characters {
    let value = v.at("characters")
    let key = v.at("description")
    if type(value) == "dictionary" {
      assert("full" in value.keys())
      let character-key = clean-character(value)
      let character-name = character-name(value)
      function-dict.insert(character-key, speak.with(character: character-name))
      character-dict.insert(character-key, character-name)
      character-print-dict.insert(character-key, text(style: "normal", tracking: 1pt)[#upper(character-name)])
    } else {
      for character in value {
        assert("full" in character.keys())
        let character-key = clean-character(character)
        let character-name = character-name(character)
        function-dict.insert(character-key, speak.with(character: character-name))
        character-dict.insert(character-key, character-name)
        character-print-dict.insert(character-key, text(style: "normal", tracking: 1pt)[#upper(character-name)])
      }
    }
  }
  
  (
    character-table: characterTable.with(characters),
    character-speaks: function-dict,
    character-dict: character-dict,
    character-print-dict : character-print-dict,
    template: dramaTemplate.with(title, numbering, paper)
  )
}