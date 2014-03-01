#= require spec_helper
#= require jquery
#= require application


chai.Assertion.addMethod 'have_text', (text) ->
  new chai.Assertion(@_obj.text()).to.equal text

describe 'Roles', ->

  beforeEach ->
    $('body').html JST['templates/roles']()
    @roles = new Roles '.roles'

  describe 'populateNeeded', ->

    beforeEach ->
      @roles.populateNeeded ['ganker','jungler']

    it 'populates the first needed role box', ->
      expect($ '.needed-role.first').to.have_text 'ganker'

    it 'populates the second needed role box', ->
      expect($ '.needed-role.second').to.have_text 'jungler'

  describe 'populateFilled', ->

    beforeEach ->
      @roles.populateFilled ['support', 'carry']

    it 'populates the first filled role box', ->
      expect($ '.filled-role.first').to.have_text 'support'

    it 'populates the second filled role box', ->
      expect($ '.filled-role.second').to.have_text 'carry'

  describe 'empty', ->

    beforeEach ->
      @roles.empty

    it 'empties the first needed role box', ->
      expect($ '.needed-role.first').to.have_text ''

    it 'empties the second needed role box', ->
      expect($ '.needed-role.second').to.have_text ''

    it 'empties the first filled role box', ->
      expect($ '.filled-role.first').to.have_text ''

    it 'empties the second filled role box', ->
      expect($ '.filled-role.second').to.have_text ''
