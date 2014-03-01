#= require spec_helper
#= require jquery
#= require application


chai.Assertion.addProperty 'empty_hero_box', ->
  new chai.Assertion(@_obj.data('filled')).to.be.falsy
  new chai.Assertion(@_obj.data('id')).to.be.falsy
  new chai.Assertion(@_obj.find('.name').text()).to.equal ''

chai.Assertion.addMethod 'populated_with_hero', ({name, id}) ->
  new chai.Assertion(@_obj.data('filled')).to.be.truthy
  new chai.Assertion(@_obj.data('id')).to.equal id
  new chai.Assertion(@_obj.find('.name').text()).to.equal name


describe 'TeamList', ->

  beforeEach ->
    $('body').html JST['templates/team_list']()
    @team_list = new TeamList '.your-team'


  describe 'addHero', ->

    context 'empty team list', ->

      beforeEach ->
        @team_list.addHero(label: 'Axe', value: 57)

      it 'fills first slot with the given character', ->
        expect($('.your-team .first.character')).to.be.populated_with_hero name: 'Axe', id: 57

      it 'does not fill second slot', ->
        expect($('.your-team .second.character')).to.be.an.empty_hero_box

      it 'does not fill third slot', ->
        expect($('.your-team .third.character')).to.be.an.empty_hero_box

      it 'does not fill fourth slot', ->
        expect($('.your-team .fourth.character')).to.be.an.empty_hero_box


    context 'two slots already filled', ->

      beforeEach ->
        @team_list.addHero(label: 'Sven', value: 2)
        @team_list.addHero(label: 'Earthshaker', value: 1)
        @team_list.addHero(label: 'Axe', value: 57)

      it 'does not touch the first slot', ->
        expect($('.your-team .first.character')).to.be.populated_with_hero name: 'Sven', id: 2

      it 'does not touch the second slot', ->
        expect($('.your-team .second.character')).to.be.populated_with_hero name: 'Earthshaker', id: 1

      it 'adds the given hero to the third slot', ->
        expect($('.your-team .third.character')).to.be.populated_with_hero name: 'Axe', id: 57

      it 'does not touch the fourth slot', ->
        expect($('.your-team .fourth.character')).to.be.an.empty_hero_box

  describe 'removeHero', ->

    context 'list of three heroes', ->

      beforeEach ->
        @team_list.addHero(label: 'Sven', value: 2)
        @team_list.addHero(label: 'Earthshaker', value: 1)
        @team_list.addHero(label: 'Axe', value: 57)
        @team_list.removeHero('.third.character')

      it 'does not touch the first slot', ->
        expect($('.your-team .first.character')).to.be.populated_with_hero name: 'Sven', id: 2

      it 'does not touch the second slot', ->
        expect($('.your-team .second.character')).to.be.populated_with_hero name: 'Earthshaker', id: 1

      it 'empties the third slot', ->
        expect($('.your-team .third.character')).to.be.an.empty_hero_box

      it 'does not touch the fourth slot', ->
        expect($('.your-team .fourth.character')).to.be.an.empty_hero_box

    context 'empty list', ->

      beforeEach ->
        @team_list.removeHero('.first.character')

      it 'does nothing to the first slot', ->
        expect($('.your-team .first.character')).to.be.an.empty_hero_box

      it 'does nothing to the second slot', ->
        expect($('.your-team .second.character')).to.be.an.empty_hero_box

      it 'does nothing to the third slot', ->
        expect($('.your-team .third.character')).to.be.an.empty_hero_box

      it 'does nothing to the fourth slot', ->
        expect($('.your-team .fourth.character')).to.be.an.empty_hero_box

  describe 'getRequestData', ->

    context 'list of three heroes', ->

      beforeEach ->
        @team_list.addHero(label: 'Sven', value: 2)
        @team_list.addHero(label: 'Earthshaker', value: 1)
        @team_list.addHero(label: 'Axe', value: 57)

      it 'returns a list containing the id of each hero', ->
        expect(@team_list.getRequestData()).to.have.members [2,1,57]

    context 'empty list', ->

      it 'returns an empty list', ->
        expect(@team_list.getRequestData()).to.be.empty

    context 'hero is added to box and then replaced', ->

      beforeEach ->
        @team_list.addHero(label: 'Sven', value: 2)
        @team_list.removeHero('.your-team .first.character')
        @team_list.addHero(label: 'Axe', value: 57)

      it 'does not include id of removed hero', ->
        expect(@team_list.getRequestData()).to.not.include.members [2]

      it 'includes id of new hero', ->
        expect(@team_list.getRequestData()).to.include.members [57]
