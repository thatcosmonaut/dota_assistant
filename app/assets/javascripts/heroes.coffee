$(document).ready ->
  $('.character input').each ->
    $(this).val("")

  $('.strategy-selector').bind "click", (event) ->
    submit_form()

  $('.character.recommendation').bind "click", (event) ->
    for box in $(".friendly.character")
      unless $(box).data("filled")
        $(box).children(".name").text($(this).children(".name").text())
        $(box).children("input").val($(this).data("hero-id"))
        $(box).children('label').removeClass().addClass('hero_big').addClass($(this).children(".name").text().toLowerCase().replace(/['\s]/g, '-'))
        $(box).data("filled", true)
        break

    submit_form()

  $('.friendly.character').bind "click", (event) ->
    remove_hero(this)

  $('.enemy.character').bind "click", (event) ->
    remove_hero(this)

  $('.banned.character').bind "click", (event) ->
    remove_hero(this)

  submit_form = ->
    $.ajax({
      url: '/pick_assistant',
      data: $('#hero-form').serialize(),
      dataType: 'json',
      type: 'POST',
      success: (data) ->
        update_recommendations(data)
    })

  update_recommendations = (data) ->
    for recommendation, i in data.recommendations
      $($('.recommendation.character').get(i)).children('.name').text(recommendation.name)
      $($('.recommendation.character').get(i)).children('label').removeClass().addClass('hero_big').addClass(recommendation.name.toLowerCase().replace(/['\s]/g, '-'))
      $($('.recommendation.character').get(i)).data("hero-id", recommendation.id)

    for worst, i in data.worst
      $($('.character.avoid').get(i)).children('.name').text(worst.name)
      $($('.character.avoid').get(i)).children('label').removeClass().addClass('hero_big').addClass(worst.name.toLowerCase().replace(/['\s]/g, '-'))

    unless (typeof data.ban_recommendations == 'undefined')
      for ban_recommendation, i in data.ban_recommendations
        $($('.character.ban').get(i)).children('.name').text(ban_recommendation.name)
        $($('.character.ban').get(i)).children('label').removeClass().addClass('hero_big').addClass(ban_recommendation.name.toLowerCase().replace(/['\s]/g, '-'))
        $($('.character.ban').get(i)).data("hero-id", ban_recommendation.id)

    unless data.needed_role == null
      $('.notes .needed p').text('Your team needs: ' + data.needed_role)
    else
      $('.notes .needed p').text('')

    unless data.filled_roles == null
      $('.notes .filled p').text('Your team has: ' + data.filled_roles)
    else
      $('.notes .filled p').text('')

  $('.character.ban').bind "click", (event) ->
    for box in $('.character.banned')
      unless $(box).data("filled")
        $(box).children(".name").text($(this).children(".name").text())
        $(box).children("input").val($(this).data("hero-id"))
        $(box).children('label').removeClass().addClass('hero_big').addClass($(this).children(".name").text().toLowerCase().replace(/['\s]/g, '-'))
        $(box).data("filled", true)
        break

    submit_form()

  remove_hero = (div) ->
    if $(div).data("filled")
      $(div).children(".name").text("")
      $(div).children("input").val("")
      $(div).children("label").removeClass().addClass('hero_big')
      $(div).data("filled", false)

      submit_form()
