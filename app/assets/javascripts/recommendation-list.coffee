class @RecommendationList

  #hero_div is selector for recommended hero box, hero list is list that heroes will be added to when clicked on
  constructor: (@container) ->
    @boxes = []
    for i in [0..4]
      @boxes.push new HeroBox(@container.find('.character').eq(i))

  populate: (data) ->
    if data
      for recommendation, i in data
        @boxes[i].show(recommendation)
    else
      @clear()

  clear: ->
    for i in [0..4]
      @boxes[i].clear()
