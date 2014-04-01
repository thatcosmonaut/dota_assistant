#= require jquery
#= require application
#= require spec_helper

describe 'Page', ->
  describe 'getRequestData', ->

    context 'lists are populated', ->

      beforeEach ->
        $('body').html JST['templates/page']()
        @page = new Page
        your_team = new TeamList $('.your-team .characters')
        enemy_team = new TeamList $('.enemy-team .characters')
        ban_list = new TeamList $('.characters.bans')

        @page.your_team_list.addHero axe
        @page.your_team_list.addHero earthshaker
        @page.your_team_list.addHero sven

        @page.enemy_list.addHero hero_name: 'Lycanthrope', id: 67
        @page.enemy_list.addHero hero_name: 'Dark Seer', id: 99
        @page.enemy_list.addHero hero_name: 'Gyrocopter', id: 34

        @page.ban_list.addHero hero_name: 'Centaur Warrunner', id: 14
        @page.ban_list.addHero hero_name: 'Phantom Assassin', id: 77
        @page.ban_list.addHero hero_name: 'Tusk', id: 17

      it 'returns hash with correct keys', ->
        expect(@page.getRequestData()).to.have.keys ['friendlies[]', 'enemies[]', 'bans[]', 'composition']

      it 'returns correct friendly ids', ->
        expect(@page.getRequestData()['friendlies[]']).to.have.members [57,1,2]

      it 'returns correct enemy ids', ->
        expect(@page.getRequestData()['enemies[]']).to.have.members [67, 99, 34]

      it 'returns correct ban ids', ->
        expect(@page.getRequestData()['bans[]']).to.have.members [14, 77, 17]
