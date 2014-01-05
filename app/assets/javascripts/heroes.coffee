$(document).ready ->
  $('.strategy-selector').bind "click", (event) ->
    $("#hero-form").ajaxSubmit({url: '/pick_assistant', type: 'POST'})

  $('.hero-box input').each ->
    $(this).val("")

  $(".submit").bind "click", (event) ->
    $("#light_box").show()
