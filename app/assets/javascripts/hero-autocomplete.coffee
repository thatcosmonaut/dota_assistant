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
            $(box).prepend('<label class="hero_big ' + ui.item.label.toLowerCase().replace(/['\s]/g, '-') + '"></label>')
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
              $($('.recommendation.character').get(i)).empty()
              $($('.recommendation.character').get(i)).prepend('<div class="name">' + recommendation.name + '</div>')
              $($('.recommendation.character').get(i)).prepend('<label class="hero_big ' + recommendation.name.toLowerCase().replace(/['\s]/g, '-') + '"></label>')
              $($('.recommendation.character').get(i)).data("hero-id", recommendation.id)

            for worst, i in data.worst
              $($('.character.avoid').get(i)).empty()
              $($('.character.avoid').get(i)).prepend('<div class="name">' + worst.name + '</div>')
              $($('.character.avoid').get(i)).prepend('<label class="hero_big ' + worst.name.toLowerCase().replace(/['\s]/g, '-') + '"></label>')

            unless (typeof data.ban_recommendations == 'undefined')
              for ban_recommendation, i in data.ban_recommendations
                $($('.character.ban').get(i)).empty()
                $($('.character.ban').get(i)).prepend('<div class="name">' + ban_recommendation.name + '</div>')
                $($('.character.ban').get(i)).prepend('<label class="hero_big ' + ban_recommendation.name.toLowerCase().replace(/['\s]/g, '-') + '"></label>')
                $($('.character.ban').get(i)).data("hero-id", ban_recommendation.id)

            $('.notes p').text('Your team needs: ' + data.needed_role)
        })
        false),
      focus: (event, ui) ->
        false
    })
