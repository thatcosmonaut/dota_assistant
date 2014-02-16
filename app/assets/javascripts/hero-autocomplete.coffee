class @HeroAutoComplete

  constructor: (@container, @data_getter) ->
    $(@container).autocomplete({
      minLength: 2,
      autoFocus: true,
      source: (request, response) =>
        $.ajax({
          url: '/remaining_heroes',
          contentType: "application/json;charset=utf-8",
          data: JSON.stringify(@data_getter()),
          dataType: 'json',
          type: 'POST',
          success: (data) =>
            matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i")
            response($.grep(data, (value) ->
              matcher.test(value.label)
            ))
        })
      ,
      select: ((event, ui) =>
        @container.trigger("hero-selected", ui.item)
        false),

      focus: (event, ui) ->
        false
    })
