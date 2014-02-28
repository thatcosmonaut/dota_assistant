#= require jquery
#= require application
#= require team_list

describe 'TeamList', ->
  describe 'addHero', ->
    context 'empty team list', ->

      beforeEach ->
        $('body').html JST['team_list']()
        team_list = new TeamList '.your-team'
        team_list.addHero(label: 'Axe', value: 57)

      it 'adds the given hero to the first slot', ->
        expect($('.your-team .characters:first label').hasClass('axe')).to.be.true

      it 'does not add the hero to the second slot', ->
        expect($('.your-team .characters .second.character label').hasClass('axe')).to.be.false

      it 'does not add the hero to the third slot', ->
        expect($('.your-team .characters .third.character label').hasClass('axe')).to.be.false

      it 'does not add the hero to the fourth slot', ->
        expect($('.your-team .characters .fourth.character label').hasClass('axe')).to.be.false

    context 'two slots already filled', ->

      beforeEach ->
        $('#konacha').html JST['team_list']()
        team_list = new TeamList '.your-team'
        team_list.addHero(label: 'Sven', value: 2)
        team_list.addHero(label: 'Earthshaker', value: 1)
        team_list.addHero(label: 'Axe', value: 57)

      it 'adds the given hero to the third slot', ->
        expect($('.your-team .characters .third.character label').hasClass('axe')).to.be.true

      it 'does not touch the first slot', ->
        expect($('.your-team .characters .first.character label').hasClass('sven')).to.be.true

      it 'does not touch the second slot', ->
        expect($('.your-team .characters .second.character label').hasClass('earthshaker')).to.be.true

      it 'does not touch the fourth slot', ->
        expect($('.your-team .characters .fourth.character label').hasClass('axe')).to.be.false
