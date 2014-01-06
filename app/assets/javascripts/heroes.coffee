$(document).ready ->
  $('.hero-box input').each ->
    $(this).val("")

  $('.strategy-selector').bind "click", (event) ->
    submit_form()

  $('.hero-box.recommendation').bind "click", (event) ->
    for box in $(".friendly.hero-box")
      unless $(box).data("filled")
        $(box).children(".name").text($(this).children(".name").text())
        $(box).children("input").val($(this).data("hero-id"))
        $(box).prepend('<label class="hero_big ' + $(this).children(".name").text().toLowerCase().replace(/['\s]/g, '-') + '"></label>')
        $(box).data("filled", true)
        break

    submit_form()

  $('.friendly.hero-box').bind "click", (event) ->
    remove_hero(this)

  $('.enemy.hero-box').bind "click", (event) ->
    remove_hero(this)

  $('.banned.hero-box').bind "click", (event) ->
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
      $($('.recommendation.hero-box').get(i)).empty()
      $($('.recommendation.hero-box').get(i)).prepend('<div class="name">' + recommendation.name + '</div>')
      $($('.recommendation.hero-box').get(i)).prepend('<label class="hero_big ' + recommendation.name.toLowerCase().replace(/['\s]/g, '-') + '"></label>')
      $($('.recommendation.hero-box').get(i)).data("hero-id", recommendation.id)

    for worst, i in data.worst
      $($('.hero-box.avoid').get(i)).empty()
      $($('.hero-box.avoid').get(i)).prepend('<div class="name">' + worst.name + '</div>')
      $($('.hero-box.avoid').get(i)).prepend('<label class="hero_big ' + worst.name.toLowerCase().replace(/['\s]/g, '-') + '"></label>')

  remove_hero = (div) ->
    if $(div).data("filled")
      $(div).children(".name").text("")
      $(div).children("input").val("")
      $(div).children("label").remove()
      $(div).data("filled", false)

      submit_form()
