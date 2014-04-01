class @Page
  constructor: ->
    friendly_container = $("#friendly-autocomplete")
    enemy_container = $('#enemy-autocomplete')
    ban_container = $('#ban-autocomplete')

    new FriendlyHeroAutoComplete(friendly_container, @getRequestData)
    new HeroAutoComplete(enemy_container, @getRequestData)
    new HeroAutoComplete(ban_container, @getRequestData)

    @your_team_list = new FriendlyTeamList $(".your-team .characters"), 4
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
      box = @recommend_list.boxes[$(event.currentTarget).index()]
      @your_team_list.addHero( { name: box.name(), id: box.heroId(), hero_name: box.heroName() } )
      @submitForm()

    $('.character.ban').click (event) =>
      box = @ban_recommend_list.boxes[$(event.currentTarget).index()]
      @ban_list.addHero( { id: box.heroId(), name: box.heroName() } )
      @submitForm()

    $('.friendly.character').click (event) =>
      @your_team_list.removeHero($(event.currentTarget).index())
      @submitForm()

    $('.enemy.character').click (event) =>
      @enemy_list.removeHero($(event.currentTarget).index())
      @submitForm()

    $('.banned.character').click (event) =>
      @ban_list.removeHero($(event.currentTarget).index())
      @submitForm()

    $('.about').click (event) ->
      $('.modal-about').show()
      return false

    $('.close-about').click (event) ->
      $('.modal-about').hide()

    $('.updates').click (event) ->
      $('.modal-updates').show()
      return false

    $('.close-updates').click (event) ->
      $('.modal-updates').hide()

  getRequestData: =>
    result =
      "friendlies[]": @your_team_list.getRequestData()
      "enemies[]": @enemy_list.getRequestData()
      "bans[]": @ban_list.getRequestData()
      "composition": $('#composition').val()
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
    @recommend_list.populate(data.recommendations)
    @avoid_list.populate(data.worst)
    @ban_recommend_list.populate(data.ban_recommendations)

    if data.needed_roles? && data.filled_roles?
      @roles.populateNeeded(data.needed_roles)
      @roles.populateFilled(data.filled_roles)
    else
      @roles.empty()

$ ->
  new Page
