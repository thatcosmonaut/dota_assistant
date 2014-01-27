class @TeamList

  constructor: (@container) ->

  #data is a hash containing id and name
  addHero: (data) ->
    filled = false
    $(@container + " .character").each (pos, box) ->
      unless filled
        div = $(box)
        unless div.data("filled") || div.hasClass('dead')
          div.find(".name").text(data.name)
          div.find("input").val(data.id)
          div.find('label').removeClass().addClass('hero_big').addClass(data.name.toLowerCase().replace(/['\s]/g, '-'))
          div.data("filled", true)
          filled = true

  #perhaps should change div to something else?
  removeHero: (div) ->
    if $(div).data("filled")
      $(div).find(".name").text("")
      $(div).find("input").val("")
      $(div).find("label").removeClass().addClass('hero_big')
      $(div).data("filled", false)
