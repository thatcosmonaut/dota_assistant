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
    if $(this).data("filled")
      $(this).children(".name").text("")
      $(this).children("input").val("")
      $(this).children("label").remove()
      $(this).data("filled", false)
      $("#hero-form").ajaxSubmit({url: '/pick_assistant', type: 'POST'})

  $(".submit").bind "click", (event) ->
    $("#light_box").show()
