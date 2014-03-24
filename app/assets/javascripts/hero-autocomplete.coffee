class @HeroAutoComplete

  constructor: (@container, @data_getter) ->
    $(@container).autocomplete
      minLength: 2
      autoFocus: true
      source: @load_data
      select: @option_picked
      focus: @input_focused

  convert_ui_data: (hero) ->
    name: hero.label
    id: hero.value

  load_data: (request, response) =>
    $.ajax
      url: '/remaining_heroes'
      contentType: "application/json;charset=utf-8"
      data: JSON.stringify(@data_getter())
      dataType: 'json'
      type: 'POST'
      success: (data) =>
        matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i")
        response($.grep(data, (value) ->
          matcher.test(value.label)
        ))

  option_picked: (event, ui) =>
    @container.trigger "hero-selected",
                       @convert_ui_data(ui.item)
    $(@container).val('')
    false

  input_focused: (event, ui) ->
    false
