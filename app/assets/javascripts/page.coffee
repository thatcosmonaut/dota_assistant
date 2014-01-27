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

  $('.strategy-selector').change (event) ->
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

  $('.about').click (event) ->
    $('.modal-about').show()
    return false

  $('.close').click (event) ->
    $('.modal-about').hide()

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
    ban_recommend_list.populate(data.ban_recommendations)

    if data.needed_roles? && data.filled_roles?
      roles.populate_needed(data.needed_roles)
      roles.populate_filled(data.filled_roles)
    else
      roles.empty()
