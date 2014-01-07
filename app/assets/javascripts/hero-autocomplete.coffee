class @HeroAutoComplete

  constructor: (@container, remaining_heroes, box_prefix) ->
    @addAutoComplete(@container, remaining_heroes, box_prefix)

  addAutoComplete: (div, box_prefix) ->
    $(div).autocomplete({
      minLength: 2,
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
        $.ajax({
          url: '/pick_assistant',
          data: $('#hero-form').serialize(),
          dataType: 'json',
          type: 'POST',
          success: (data) ->
            for recommendation, i in data.recommendations
              $($('.recommendation.character').get(i)).children('.name').text(recommendation.name)
              $($('.recommendation.character').get(i)).children('label').removeClass().addClass('hero_big').addClass(recommendation.name.toLowerCase().replace(/['\s]/g, '-'))
              $($('.recommendation.character').get(i)).data("hero-id", recommendation.id)

            for worst, i in data.worst
              $($('.character.avoid').get(i)).children('.name').text(worst.name)
              $($('.character.avoid').get(i)).children('label').removeClass().addClass('hero_big').addClass(worst.name.toLowerCase().replace(/['\s]/g, '-'))

            unless (typeof data.ban_recommendations == 'undefined')
              for ban_recommendation, i in data.ban_recommendations
                $($('.character.ban').get(i)).children('.name').text(ban_recommendation.name)
                $($('.character.ban').get(i)).children('label').removeClass().addClass('hero_big').addClass(ban_recommendation.name.toLowerCase().replace(/['\s]/g, '-'))
                $($('.character.ban').get(i)).data("hero-id", ban_recommendation.id)

            unless data.needed_role == null
              $('.notes p').text('Your team needs: ' + data.needed_role)
            else
              $('.notes p').text('')
        })
        false),
      focus: (event, ui) ->
        false
    })
