class @AvoidList

  #hero_div is selector for avoid hero box
  constructor: (@container) ->

  #data is a list of hashes containing id and name
  populate: (data) ->
    data = [{id: null, name: ""},{id: null, name: ""},{id: null, name: ""},{id: null, name: ""},{id: null, name: ""}] if !data?
    for worst, i in data
      div = $(@container + " .character").eq(i)
      div.find('.name').text(worst.name)
      div.find('label').removeClass().addClass('hero_big').addClass(worst.name.toLowerCase().replace(/['\s]/g, '-'))
