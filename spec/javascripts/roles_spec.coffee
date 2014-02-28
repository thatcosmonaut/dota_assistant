#= require jquery
#= require application
#= require roles


describe 'Roles', ->

  describe 'populateNeeded', ->

    context 'ganker and jungler', ->

      it 'populates the first role box', ->
        $('body').html JST['roles']()
        @roles = new Roles '.roles'
        @roles.populateNeeded(['ganker','jungler'])
        expect($('.needed-roles.first').text()).to.equal 'ganker'
