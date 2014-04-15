class @RecommendationList

  #hero_div is selector for recommended hero box, hero list is list that heroes will be added to when clicked on
  constructor: (@container) ->
    @boxes = []
    for i in [0..4]
      @boxes.push new BuildBox(@container.find('.character').eq(i))

  populate: (data) ->
    @clear()
    if data
      for recommendation, i in data
        @boxes[i].show(recommendation)

  clear: ->
    for i in [0..4]
      @boxes[i].clear()

  removeHero: (index) ->
    @boxes[index].clear()
