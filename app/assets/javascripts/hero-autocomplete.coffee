class @HeroAutoComplete extends @Submittable

  constructor: (@container, remaining_heroes, box_prefix) ->
    @addAutoComplete(@container, remaining_heroes, box_prefix)

  addAutoComplete: (div, box_prefix) ->
    $(div).autocomplete({
      minLength: 2,
      autoFocus: true,
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
        for box in $("." + box_prefix + ".character")
          unless $(box).data("filled")
            $(box).children(".name").text(ui.item.label)
            $(box).children("input").val(ui.item.value)
            $(box).children('label').removeClass().addClass('hero_big').addClass(ui.item.label.toLowerCase().replace(/['\s]/g, '-'))
            $(box).data("filled", true)
            break

        $(this).val('')
        submit_form()

        false),
      focus: (event, ui) ->
        false
    })
