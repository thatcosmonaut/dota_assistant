class @Page
  constructor: ->
    friendly_container = $("#friendly-autocomplete")
    enemy_container = $('#enemy-autocomplete')
    ban_container = $('#ban-autocomplete')

    new HeroAutoComplete(friendly_container, @getRequestData)
    new HeroAutoComplete(enemy_container, @getRequestData)
    new HeroAutoComplete(ban_container, @getRequestData)

    @your_team_list = new TeamList $(".your-team .characters"), 4
    @enemy_list = new TeamList $(".enemy-team .characters"), 5
    @ban_list = new TeamList $(".characters.bans"), 10

    @recommend_list = new RecommendationList $(".recommendations .characters.recommend-these")
    @avoid_list = new RecommendationList $(".recommendations .characters.avoid-these")
    @ban_recommend_list = new RecommendationList $(".characters.ban-these")

    @roles = new Roles(".roles")

    friendly_container.on "hero-selected", (event, item) =>
      @your_team_list.addHero(item)
      @submitForm()

    enemy_container.on "hero-selected", (event, item) =>
      @enemy_list.addHero(item)
      @submitForm()

    ban_container.on "hero-selected", (event, item) =>
      @ban_list.addHero(item)
      @submitForm()

    $('.character input').val("")

    $('.strategy-selector').change (event) =>
      @submitForm()

    $('.character.recommendation').click (event) =>
      elt = event.target
      getAndSubmitHero(@your_team_list, $(elt))

    $('.character.ban').click (event) =>
      elt = event.target
      getAndSubmitHero(@ban_list, $(elt))

    $('.friendly.character').click (event) =>
      @your_team_list.removeHero(this)
      @submitForm()

    $('.enemy.character').click (event) =>
      @enemy_list.removeHero(this)
      @submitForm()

    $('.banned.character').click (event) =>
      @ban_list.removeHero(this)
      @submitForm()

    $('.about').click (event) ->
      $('.modal-about').show()
      return false

    $('.close').click (event) ->
      $('.modal-about').hide()

  getAndSubmitHero: (list, parent) ->
    list.addHero({id: parent.data("hero-id"), name: parent.find(".name").text()})
    submit_form()

  getRequestData: =>
    result =
      "friendlies[]": @your_team_list.getRequestData()
      "enemies[]": @enemy_list.getRequestData()
      "bans[]": @ban_list.getRequestData()
    result

  submitForm: =>
    $.ajax
      url: '/pick_assistant',
      data: @getRequestData(),
      dataType: 'json',
      type: 'POST',
      success: (data) =>
        @updateRecommendations(data)

  updateRecommendations: (data) ->
    console.log data
    @recommend_list.populate(data.recommendations)
    @avoid_list.populate(data.worst)
    @ban_recommend_list.populate(data.ban_recommendations)

    if data.needed_roles? && data.filled_roles?
      @roles.populate_needed(data.needed_roles)
      @roles.populate_filled(data.filled_roles)
    else
      @roles.empty()

$ ->
  new Page
