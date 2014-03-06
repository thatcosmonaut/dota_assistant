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
    @team_list = new TeamList $('.your-team'), 4


  describe 'addHero', ->

    context 'empty team list', ->

      beforeEach ->
        @team_list.addHero(axe)

      it 'fills first slot with the given character', ->
        expect(@team_list.boxes[0]).to.be.hero_box_populated_with_hero axe

      it 'does not fill the remaining slots', ->
        for i in [1...4]
          expect(@team_list.boxes[i]).to.be.an.empty_hero_box

    context 'two slots already filled', ->

      beforeEach ->
        @team_list.addHero sven
        @team_list.addHero earthshaker
        @team_list.addHero axe

      it 'does not touch the first slot', ->
        expect(@team_list.boxes[0]).to.be.hero_box_populated_with_hero sven

      it 'does not touch the second slot', ->
        expect(@team_list.boxes[1]).to.be.hero_box_populated_with_hero earthshaker

      it 'adds the given hero to the third slot', ->
        expect(@team_list.boxes[2]).to.be.hero_box_populated_with_hero axe

      it 'does not touch the fourth slot', ->
        expect(@team_list.boxes[3]).to.be.an.empty_hero_box

  describe 'removeHero', ->

    context 'list of three heroes', ->

      beforeEach ->
        @team_list.addHero sven
        @team_list.addHero earthshaker
        @team_list.addHero axe
        @team_list.removeHero 2

      it 'does not touch the first slot', ->
        expect(@team_list.boxes[0]).to.be.hero_box_populated_with_hero name: 'Sven', id: 2

      it 'does not touch the second slot', ->
        expect(@team_list.boxes[1]).to.be.hero_box_populated_with_hero name: 'Earthshaker', id: 1

      it 'empties the third slot', ->
        expect(@team_list.boxes[2]).to.be.an.empty_hero_box

      it 'does not touch the fourth slot', ->
        expect(@team_list.boxes[3]).to.be.an.empty_hero_box

    context 'empty list', ->

      beforeEach ->
        @team_list.removeHero 0

      it 'does nothing to the boxes', ->
        for i in [0...4]
          expect(@team_list.boxes[i]).to.be.an.empty_hero_box

  describe 'getRequestData', ->

    context 'list of three heroes', ->

      beforeEach ->
        @team_list.addHero sven
        @team_list.addHero earthshaker
        @team_list.addHero axe

      it 'returns a list containing the id of each hero', ->
        expect(@team_list.getRequestData()).to.have.members [2,1,57]

    context 'empty list', ->

      it 'returns an empty list', ->
        expect(@team_list.getRequestData()).to.be.empty

    context 'hero is added to box and then replaced', ->

      beforeEach ->
        @team_list.addHero sven
        @team_list.removeHero 0
        @team_list.addHero axe

      it 'does not include id of removed hero', ->
        expect(@team_list.getRequestData()).to.not.include.members [sven.id]

      it 'includes id of new hero', ->
        expect(@team_list.getRequestData()).to.include.members [axe.id]

  describe 'findEmptyBoxPosition', ->

    context 'every box is empty', ->
      it 'returns position 0', ->
        expect(@team_list.findEmptyBoxPosition()).to.equal 0

    context 'first two are filled', ->

      beforeEach ->
        @team_list.addHero sven
        @team_list.addHero earthshaker

      it 'returns position 2', ->
        expect(@team_list.findEmptyBoxPosition()).to.equal 2

    context 'first and third are filled', ->

      beforeEach ->
        @team_list.addHero sven
        @team_list.addHero kunkka, 2

      it 'returns position 1', ->
        expect(@team_list.findEmptyBoxPosition()).to.equal 1

    context 'all boxes are full', ->

      beforeEach ->
        @team_list.addHero sven
        @team_list.addHero earthshaker
        @team_list.addHero tiny
        @team_list.addHero kunkka

      it 'returns -1', ->
        expect(@team_list.findEmptyBoxPosition()).to.equal -1

  describe 'findPositionOfBoxDiv', ->

    it 'returns the position of the given div', ->
      for i in [0...4]
        expect(@team_list.findPositionOfBoxDiv($('.character').eq(i))).to.equal i
