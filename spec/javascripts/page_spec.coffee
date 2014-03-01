#= require jquery
#= require application
#= require spec_helper

describe 'Page', ->
  describe 'getRequestData', ->

    context 'lists are populated', ->

      beforeEach ->
        $('body').html JST['templates/page']()
        @page = new Page
        your_team = new TeamList '.your-team .characters'
        enemy_team = new TeamList '.enemy-team .characters'
        ban_list = new TeamList '.characters.bans'

        your_team.addHero(label: 'Axe', value: 57)
        your_team.addHero(label: 'Earthshaker', value: 1)
        your_team.addHero(label: 'Sven', value: 2)

      it 'returns hash with correct keys', ->
        expect(@page.getRequestData()).to.have.keys ['friendlies[]', 'enemies[]', 'bans[]']
