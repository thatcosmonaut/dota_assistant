class @Roles

  constructor: (@container) ->

  populateNeeded: (data) ->
    $(@container).find('.needed-role').eq(0).text(data[0])
    $(@container).find('.needed-role').eq(1).text(data[1])

  populateFilled: (data) ->
    $(@container).find('.filled-role').eq(0).text(data[0])
    $(@container).find('.filled-role').eq(1).text(data[1])

  empty: ->
    $(@container).find('.filled-role').text('Filled')
    $(@container).find('.needed-role').text('Needed')
