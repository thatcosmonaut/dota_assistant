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

        enemy_team.addHero(label: 'Lycanthrope', value: 67)
        enemy_team.addHero(label: 'Dark Seer', value: 99)
        enemy_team.addHero(label: 'Gyrocopter', value: 34)

        ban_list.addHero(label: 'Centaur Warrunner', value: 14)
        ban_list.addHero(label: 'Phantom Assassin', value: 77)
        ban_list.addHero(label: 'Tusk', value: 17)

      it 'returns hash with correct keys', ->
        expect(@page.getRequestData()).to.have.keys ['friendlies[]', 'enemies[]', 'bans[]']

      it 'returns correct friendly ids', ->
        expect(@page.getRequestData()['friendlies[]']).to.have.members [57,1,2]

      it 'returns correct enemy ids', ->
        expect(@page.getRequestData()['enemies[]']).to.have.members [67, 99, 34]

      it 'returns correct ban ids', ->
        expect(@page.getRequestData()['bans[]']).to.have.members [14, 77, 17]
