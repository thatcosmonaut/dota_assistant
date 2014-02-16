class @TeamList

  constructor: (@container) ->

  #data is a hash containing id and name
  addHero: (data) ->
    filled = false
    $(@container + " .character").each (pos, box) ->
      unless filled
        div = $(box)
        div.data 'id', data.id
        unless div.data("filled") || div.hasClass('dead')
          div.find(".name").text(data.name)
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

  # Returns the JSON data portion for this list to be sent to the server for updates.
  getRequestData: ->
    $.map $("#{@container} .character"), (pos, box) ->
      $(box).data 'id'
