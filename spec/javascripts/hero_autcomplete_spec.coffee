#= require spec_helper
#= require jquery
#= require application

describe 'HeroAutoComplete', ->

  describe 'convert_ui_data', ->

    beforeEach ->
      @autocomplete = new HeroAutoComplete null, null
      server_data = {label: 'Earthshaker', value: 1}
      @hero_data = { name: 'Earthshaker', id: 1 }
      @result = @autocomplete.convert_ui_data server_data

    it 'assigns all elements', ->
      expect(@result).to.eql @hero_data
