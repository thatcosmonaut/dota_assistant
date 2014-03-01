#= require spec_helper
#= require jquery
#= require application


describe 'Roles', ->

  beforeEach ->
    $('body').html JST['templates/roles']()
    @roles = new Roles '.roles'

  describe 'populateNeeded', ->

    beforeEach ->
      @roles.populateNeeded ['ganker','jungler']

    it 'populates the first needed role box', ->
      expect($('.needed-role.first').text()).to.equal 'ganker'

    it 'populates the second needed role box', ->
      expect($('.needed-role.second').text()).to.equal 'jungler'

  describe 'populateFilled', ->

    beforeEach ->
      @roles.populateFilled ['support', 'carry']

    it 'populates the first filled role box', ->
      expect($('.filled-role.first').text()).to.equal 'support'

    it 'populates the second filled role box', ->
      expect($('.filled-role.second').text()).to.equal 'carry'

  describe 'empty', ->

    beforeEach ->
      @roles.empty

    it 'empties the first needed role box', ->
      expect($('.needed-role.first').text()).to.equal ''

    it 'empties the second needed role box', ->
      expect($('.needed-role.second').text()).to.equal ''

    it 'empties the first filled role box', ->
      expect($('.filled-role.first').text()).to.equal ''

    it 'empties the second filled role box', ->
      expect($('.filled-role.second').text()).to.equal ''
