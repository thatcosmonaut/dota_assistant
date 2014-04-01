class @FriendlyHeroAutoComplete

  constructor: (@container, @data_getter) ->
    $(@container).autocomplete
      minLength: 2
      autoFocus: true
      source: @load_data
      select: @option_picked
      focus: @input_focused

  convert_ui_data: (hero) ->
    name: hero.label.match(/\((.*?)\)/, '')[1]
    hero_name: hero.label.replace(/\ \(.*?\)/, '')
    id: hero.value

  load_data: (request, response) =>
    $.ajax
      url: '/remaining_builds'
      data: @data_getter()
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
