$(document).ready ->
  $('.hero-box input').each ->
    $(this).val("")

  $('.strategy-selector').bind "click", (event) ->
    $("#hero-form").ajaxSubmit({url: '/pick_assistant', type: 'POST'})

  $('.hero-box.recommendation').bind "click", (event) ->
    for box in $(".friendly.hero-box")
      unless $(box).data("filled")
        $(box).children(".name").text($(this).children(".name").text())
        $(box).children("input").val($(this).data("hero-id"))
        $(box).prepend('<label class="hero_big ' + $(this).children(".name").text().toLowerCase().replace(/['\s]/g, '-') + '"></label>')
        $(box).data("filled", true)
        $("#hero-form").ajaxSubmit({url: '/pick_assistant', type: 'POST'})
        break

  $('.friendly.hero-box').bind "click", (event) ->
    remove_hero(this)

  $('.enemy.hero-box').bind "click", (event) ->
    remove_hero(this)

  $('.banned.hero-box').bind "click", (event) ->
    remove_hero(this)

  add_hero = (div) ->
    for box in $(div)
      unless $(box).data("filled")
        $(box).children(".name").text($(this).children(".name").text())
        $(box).children("input").val($(this).data("hero-id"))
        $(box).prepend('<label class="hero_big ' + $(this).children(".name").text().toLowerCase().replace(/['\s]/g, '-') + '"></label>')
        $(box).data("filled", true)
        $("#hero-form").ajaxSubmit({url: '/pick_assistant', type: 'POST'})
        break

  remove_hero = (div) ->
    if $(div).data("filled")
      $(div).children(".name").text("")
      $(div).children("input").val("")
      $(div).children("label").remove()
      $(div).data("filled", false)
      $("#hero-form").ajaxSubmit({url: '/pick_assistant', type: 'POST'})

  $(".submit").bind "click", (event) ->
    $("#light_box").show()
