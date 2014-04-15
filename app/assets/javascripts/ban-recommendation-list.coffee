class @BanRecommendationList

  constructor: (@container) ->
    @boxes = []
    for i in [0..4]
      @boxes.push new HeroBox(@container.find('.character').eq(i))

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
