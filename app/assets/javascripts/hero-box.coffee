class @HeroBox

  constructor: (@container) ->
    # data for the currently displayed hero
    @hero_data = null

  show: (@hero_data) ->
    $("#{@container} label").addClass(@heroCssName())
    $("#{@container} .name").text(hero_data.name)
    $(@container).data('hero-id', hero_data.id)

  heroId: ->
    @hero_data?.id ? null

  clear: ->
    $("#{@container} label").removeClass(@heroCssName())
    $("#{@container} .name").text('')
    $(@container).removeData('hero-id')

  heroCssName: ->
    @hero_data.name.toLowerCase().replace(' ', '-').replace("'", '')
