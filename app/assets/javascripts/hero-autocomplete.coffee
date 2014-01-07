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
        for box in $("." + box_prefix + ".hero-box")
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
              $($('.recommendation.hero-box').get(i)).empty()
              $($('.recommendation.hero-box').get(i)).prepend('<div class="name">' + recommendation.name + '</div>')
              $($('.recommendation.hero-box').get(i)).prepend('<label class="hero_big ' + recommendation.name.toLowerCase().replace(/['\s]/g, '-') + '"></label>')
              $($('.recommendation.hero-box').get(i)).data("hero-id", recommendation.id)

            for worst, i in data.worst
              $($('.hero-box.avoid').get(i)).empty()
              $($('.hero-box.avoid').get(i)).prepend('<div class="name">' + worst.name + '</div>')
              $($('.hero-box.avoid').get(i)).prepend('<label class="hero_big ' + worst.name.toLowerCase().replace(/['\s]/g, '-') + '"></label>')

            unless (typeof data.ban_recommendations == 'undefined')
              for ban_recommendation, i in data.ban_recommendations
                $($('.hero-box.ban').get(i)).empty()
                $($('.hero-box.ban').get(i)).prepend('<div class="name">' + ban_recommendation.name + '</div>')
                $($('.hero-box.ban').get(i)).prepend('<label class="hero_big ' + ban_recommendation.name.toLowerCase().replace(/['\s]/g, '-') + '"></label>')
                $($('.hero-box.ban').get(i)).data("hero-id", ban_recommendation.id)
        })
        false),
      focus: (event, ui) ->
        false
    })
