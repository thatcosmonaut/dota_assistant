class @HeroAutoComplete

  constructor: (@container, remaining_heroes, box_prefix) ->
    @addAutoComplete(@container, remaining_heroes, box_prefix)
    @removeOnClick("." + box_prefix)

  addAutoComplete: (div, data, box_prefix) ->
    $(div).autocomplete({
      source: data,
      select: ((event, ui) ->
        for box in $("." + box_prefix + ".hero-box")
          unless $(box).data("filled")
            $(box).children(".name").text(ui.item.label)
            $(box).children("input").val(ui.item.value)
            $(box).data("filled", true)
            break

        this.form.submit()
        false),
      focus: (event, ui) ->
        false
    })

  removeOnClick: (div) ->
    $(div).click ->
      if $(div).data("filled")
        $(this).children(".name").text("")
        $(this).children("input").val("")
        $(this).data("filled", false)
