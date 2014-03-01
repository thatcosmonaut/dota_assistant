#= require spec_helper
#= require jquery
#= require application


chai.Assertion.addProperty 'empty_recommendation_box', ->
  new chai.Assertion(@_obj.data('hero-id')).to.be.falsy
  new chai.Assertion(@_obj.find('.name').text()).to.equal ''

chai.Assertion.addMethod 'recommendation_box_populated_with_hero', ({name, id}) ->
  new chai.Assertion(@_obj.data('hero-id')).to.equal id
  new chai.Assertion(@_obj.find('.name').text()).to.equal name

describe 'RecommendationList', ->
  describe 'populate', ->

    beforeEach ->
      $('body').html JST['templates/recommendation_list']()
      @recommendation_list = new RecommendationList '.recommend-these'

    context 'input is empty', ->

      it 'does not fill the first slot', ->
        expect($('.recommend-these .first.character')).to.be.an.empty_recommendation_box

      it 'does not fill the second slot', ->
        expect($('.recommend-these .second.character')).to.be.an.empty_recommendation_box

      it 'does not fill the third slot', ->
        expect($('.recommend-these .third.character')).to.be.an.empty_recommendation_box

      it 'does not fill the fourth slot', ->
        expect($('.recommend-these .fourth.character')).to.be.an.empty_recommendation_box

      it 'does not fill the fifth slot', ->
        expect($('.recommend-these .fifth.character')).to.be.an.empty_recommendation_box

    context 'input contains heroes', ->

      beforeEach ->
        @recommendation_list.populate [
          {name: 'Sven', id: 2},
          {name: 'Axe', id: 57},
          {name: 'Earthshaker', id: 1},
          {name: 'Tiny', id: 3},
          {name: 'Kunkka', id: 4}
        ]

      it 'fills first slot', ->
        expect($('.recommend-these .first.character')).to.be.a.recommendation_box_populated_with_hero name: 'Sven', id: 2

      it 'fills second slot', ->
        expect($('.recommend-these .second.character')).to.be.a.recommendation_box_populated_with_hero name: 'Axe', id: 57

      it 'fills third slot', ->
        expect($('.recommend-these .third.character')).to.be.a.recommendation_box_populated_with_hero name: 'Earthshaker', id: 1

      it 'fills fourth slot', ->
        expect($('.recommend-these .fourth.character')).to.be.a.recommendation_box_populated_with_hero name: 'Tiny', id: 3

      it 'fills fifth slot', ->
        expect($('.recommend-these .fifth.character')).to.be.a.recommendation_box_populated_with_hero name: 'Kunkka', id: 4

  describe 'clear', ->

    beforeEach ->
      @recommendation_list.populate [
        {name: 'Sven', id: 2},
        {name: 'Axe', id: 57},
        {name: 'Earthshaker', id: 1},
        {name: 'Tiny', id: 3},
        {name: 'Kunkka', id: 4}
      ]

      @recommendation_list.clear()

    it 'empties the first slot', ->
      expect($ '.recommend-these .first.character').to.be.an.empty_recommendation_box

    it 'empties the second slot', ->
      expect($ '.recommend-these .second.character').to.be.an.empty_recommendation_box

    it 'empties the third slot', ->
      expect($ '.recommend-these .third.character').to.be.an.empty_recommendation_box

    it 'empties the fourth slot', ->
      expect($ '.recommend-these .fourth.character').to.be.an.empty_recommendation_box

    it 'empties the fifth slot', ->
      expect($ '.recommend-these .fifth.character').to.be.an.empty_recommendation_box
