class @HeroAutoComplete

  constructor: (@container, remaining_heroes, box_prefix) ->
    @addAutoComplete(@container, remaining_heroes, box_prefix)

  addAutoComplete: (div, box_prefix) ->
    $(div).autocomplete({
      source: (request, response) ->
        $.ajax({
          url: '/remaining_heroes',
          data: $('#hero-form').serialize(),
          dataType: 'json',
          type: 'POST',
          success: (data) ->
            matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i")
            response($.grep(data, (value) ->
              matcher.test(value.label)
            ))
        })
      ,
      select: ((event, ui) ->
        for box in $("." + box_prefix + ".hero-box")
          unless $(box).data("filled")
            $(box).children(".name").text(ui.item.label)
            $(box).children("input").val(ui.item.value)
            $(box).prepend('<label class="hero_big ' + ui.item.label.toLowerCase().replace(/['\s]/g, '-') + '"></label>')
            $(box).data("filled", true)
            break

        $(this).val('')
        $("#hero-form").ajaxSubmit({url: '/pick_assistant', type: 'POST'})
        false),
      focus: (event, ui) ->
        false
    })
