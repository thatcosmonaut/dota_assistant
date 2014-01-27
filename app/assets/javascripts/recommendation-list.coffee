class @RecommendationList

  #hero_div is selector for recommended hero box, hero list is list that heroes will be added to when clicked on
  constructor: (@container) ->

  heroClicked: (div) ->
    parent = $(div)
    @team_list.addHero({id: parent.data("hero-id"), name: parent.find(".name").text()})

  #data is a list of hashes containing id and name
  populate: (data) ->
    data = [{id: null, name: ""},{id: null, name: ""},{id: null, name: ""},{id: null, name: ""},{id: null, name: ""}] if !data?
    for recommendation, i in data
      div = $(@container + " .character").eq(i)
      div.find('.name').text(recommendation.name)
      div.find('label').removeClass().addClass('hero_big').addClass(recommendation.name.toLowerCase().replace(/['\s]/g, '-'))
      div.data("hero-id", recommendation.id)
