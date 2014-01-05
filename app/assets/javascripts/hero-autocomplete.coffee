class @HeroAutoComplete

  constructor: (@container, remaining_heroes, box_prefix) ->
    @addAutoComplete(@container, remaining_heroes, box_prefix)

  addAutoComplete: (div, data, box_prefix) ->
    $(div).autocomplete({
      source: data,
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
