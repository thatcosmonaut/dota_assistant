class @BuildBox

  constructor: (@container) ->
    # data for the currently displayed hero
    @build_data = null

  show: (@build_data) ->
    @container.find('label').addClass(@heroCssName())
    @container.find('.name').text(build_data.hero_name)
    @container.find('.build').show()
    @container.find('.build').text(build_data.name)
    @container.data('hero-id', build_data.id)

  name: ->
    @build_data?.name ? ''

  heroId: ->
    @build_data?.id ? null

  heroName: ->
    @build_data?.hero_name ? ''

  clear: ->
    @container.find('label').removeClass(@heroCssName())
    @container.find('.name').text('')
    @container.removeData('hero-id')
    @container.find('.build').hide()
    @build_data = null

  heroCssName: ->
    if @build_data
      @build_data.hero_name.toLowerCase().replace(/\ /g, '-').replace(/\'/g, '')
    else
      ''

  isEmpty: ->
    !@build_data?
