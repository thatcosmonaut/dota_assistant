class @TeamList

  constructor: (@container, max_size) ->
    @boxes = []
    for i in [0...max_size]
      @boxes.push new HeroBox(@container.find('.character').eq(i))

  addHero: (hero_data, pos = @findEmptyBoxPosition()) ->
    unless pos == -1
      @boxes[pos].show hero_data

  findEmptyBoxPosition: ->
    for box, i in @boxes
      if box.isEmpty()
        return i
    return -1

  removeHero: (index) ->
    @boxes[index].clear()

  findPositionOfBoxDiv: (div) ->
    @container.find('.character').index(div)

  # Returns the JSON data portion for this list to be sent to the server for updates.
  getRequestData: ->
    $.map @boxes, (box, index) ->
      box.heroId()
