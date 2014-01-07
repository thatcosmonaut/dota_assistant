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
        $(box).prepend('<label class="hero_big ' + $(this).children(".name").text().toLowerCase().replace(/['\s]/g, '-') + '"></label>')
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
      $($('.recommendation.character').get(i)).empty()
      $($('.recommendation.character').get(i)).prepend('<div class="name">' + recommendation.name + '</div>')
      $($('.recommendation.character').get(i)).prepend('<label class="removeable ' + recommendation.name.toLowerCase().replace(/['\s]/g, '-') + '"></label>')
      $($('.recommendation.character').get(i)).data("hero-id", recommendation.id)

    for worst, i in data.worst
      $($('.character.avoid').get(i)).empty()
      $($('.character.avoid').get(i)).prepend('<div class="name">' + worst.name + '</div>')
      $($('.character.avoid').get(i)).prepend('<label class="' + worst.name.toLowerCase().replace(/['\s]/g, '-') + '"></label>')

    unless (typeof data.ban_recommendations == 'undefined')
      for ban_recommendation, i in data.ban_recommendations
        $($('.character.ban').get(i)).empty()
        $($('.character.ban').get(i)).prepend('<div class="name">' + ban_recommendation.name + '</div>')
        $($('.character.ban').get(i)).prepend('<label class="addable ' + ban_recommendation.name.toLowerCase().replace(/['\s]/g, '-') + '"></label>')
        $($('.character.ban').get(i)).data("hero-id", ban_recommendation.id)

    $('.recommended-role').text('Your team needs: ' + data.needed_role)

  $('.character.ban').bind "click", (event) ->
    for box in $('.character.banned')
      unless $(box).data("filled")
        $(box).children(".name").text($(this).children(".name").text())
        $(box).children("input").val($(this).data("hero-id"))
        $(box).prepend('<label class="hero_big ' + $(this).children(".name").text().toLowerCase().replace(/['\s]/g, '-') + '"></label>')
        $(box).data("filled", true)
        break

    submit_form()

  remove_hero = (div) ->
    if $(div).data("filled")
      $(div).children(".name").text("")
      $(div).children("input").val("")
      $(div).children("label").remove()
      $(div).data("filled", false)

      submit_form()
