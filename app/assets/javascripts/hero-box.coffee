class @HeroBox

  constructor: (@container) ->
    # data for the currently displayed hero
    @hero_data = null

  show: (@hero_data) ->
    @container.find('label').addClass(@heroCssName())
    @container.find('.name').text(hero_data.name)
    @container.data('hero-id', hero_data.id)

  heroId: ->
    @hero_data?.id ? null

  heroName: ->
    @hero_data?.name ? ''

  clear: ->
    @container.find('label').removeClass(@heroCssName())
    @container.find('.name').text('')
    @container.removeData('hero-id')
    @hero_data = null

  heroCssName: ->
    if @hero_data
      @hero_data.name.toLowerCase().replace(/\ /g, '-').replace(/\'/g, '')
    else
      ''

  isEmpty: ->
    !@hero_data?
