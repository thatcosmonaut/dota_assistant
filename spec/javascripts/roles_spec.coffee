#= require spec_helper
#= require jquery
#= require application


describe 'Roles', ->

  describe 'populateNeeded', ->

    context 'ganker and jungler', ->

      it 'populates the first role box', ->
        $('body').html JST['templates/roles']()
        @roles = new Roles '.roles'
        @roles.populateNeeded ['ganker','jungler']
        expect($('.needed-roles.first').text()).to.equal 'ganker'
