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

class @RecommendationList

  #hero_div is selector for recommended hero box, hero list is list that heroes will be added to when clicked on
  constructor: (@container) ->

  heroClicked: (div) ->
    parent = $(div)
    @team_list.addHero({id: parent.data("hero-id"), name: parent.find(".name").text()})

  #data is a list of hashes containing id and name
  populate: (data) ->
    for recommendation, i in data
      div = $(@container + " .character").eq(i)
      div.find('.name').text(recommendation.name)
      div.find('label').removeClass().addClass('hero_big').addClass(recommendation.name.toLowerCase().replace(/['\s]/g, '-'))
      div.data("hero-id", recommendation.id)

class @AvoidList

  #hero_div is selector for avoid hero box
  constructor: (@container) ->

  #data is a list of hashes containing id and name
  populate: (data) ->
    for worst, i in data
      div = $(@container + " .character").eq(i)
      div.find('.name').text(worst.name)
      div.find('label').removeClass().addClass('hero_big').addClass(worst.name.toLowerCase().replace(/['\s]/g, '-'))

class @Roles

  constructor: (@container) ->

  populate_needed: (data) ->
    $(@container).find('.needed-role').eq(0).text(data[0])
    $(@container).find('.needed-role').eq(1).text(data[1])

  populate_filled: (data) ->
    $(@container).find('.filled-role').eq(0).text(data[0])
    $(@container).find('.filled-role').eq(1).text(data[1])

  empty: ->
    $(@container).find('.filled-role').text('Filled')
    $(@container).find('.needed-role').text('Needed')

$ ->
  new HeroAutoComplete($("#friendly-autocomplete"), "friendly")
  new HeroAutoComplete($("#enemy-autocomplete"), "enemy")
  new HeroAutoComplete($("#ban-autocomplete"), "banned")

  your_team_list = new TeamList(".your-team .characters.cf")
  enemy_team_list = new TeamList(".enemy-team .characters.cf")
  ban_list = new TeamList(".characters.bans.cf")

  recommend_list = new RecommendationList(".recommendations .characters.cf.recommend-these")
  avoid_list = new AvoidList(".recommendations .characters.cf.avoid-these")
  ban_recommend_list = new RecommendationList(".characters.cf.ban-these")

  roles = new Roles(".roles")

  $('.character input').val("")

  $('.strategy-selector').click (event) ->
    submit_form()

  $('.character.recommendation').click (event) ->
    parent = $(this)
    your_team_list.addHero({id: parent.data("hero-id"), name: parent.find(".name").text()})
    submit_form()

  $('.character.ban').click (event) ->
    parent = $(this)
    ban_list.addHero({id: parent.data("hero-id"), name: parent.find(".name").text()})
    submit_form()

  $('.friendly.character').click (event) ->
    your_team_list.removeHero(this)
    submit_form()

  $('.enemy.character').click (event) ->
    enemy_team_list.removeHero(this)
    submit_form()

  $('.banned.character').click (event) ->
    ban_list.removeHero(this)
    submit_form()

  window.submit_form = ->
    $.ajax({
      url: '/pick_assistant',
      data: $('#hero-form').serialize(),
      dataType: 'json',
      type: 'POST',
      success: (data) ->
        update_recommendations(data)
    })

  update_recommendations = (data) ->
    recommend_list.populate(data.recommendations)
    avoid_list.populate(data.worst)

    if data.ban_recommendations?
      ban_recommend_list.populate(data.ban_recommendations)

    if data.needed_roles? && data.filled_roles?
      roles.populate_needed(data.needed_roles)
      roles.populate_filled(data.filled_roles)
    else
      roles.empty()
