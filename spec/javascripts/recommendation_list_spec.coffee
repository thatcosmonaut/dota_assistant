#= require spec_helper
#= require jquery
#= require application

describe 'RecommendationList', ->
  describe 'populate', ->

    beforeEach ->
      $('body').html JST['templates/recommendation_list']()
      @recommendation_list = new RecommendationList $('.recommend-these')

    context 'input is empty', ->

      beforeEach ->
        @recommendation_list.populate()

      it 'does not fill any boxes', ->
        for i in [0..4]
          expect(@recommendation_list.boxes[i]).to.be.an.empty_hero_box

    context 'input contains heroes', ->

      beforeEach ->
        @recommendation_list.populate [ sven, axe, earthshaker, tiny, kunkka ]

      it 'fills first slot', ->
        expect(@recommendation_list.boxes[0]).to.be.a.hero_box_populated_with_hero sven

      it 'fills second slot', ->
        expect(@recommendation_list.boxes[1]).to.be.a.hero_box_populated_with_hero axe

      it 'fills third slot', ->
        expect(@recommendation_list.boxes[2]).to.be.a.hero_box_populated_with_hero earthshaker

      it 'fills fourth slot', ->
        expect(@recommendation_list.boxes[3]).to.be.a.hero_box_populated_with_hero tiny

      it 'fills fifth slot', ->
        expect(@recommendation_list.boxes[4]).to.be.a.hero_box_populated_with_hero kunkka

  describe 'clear', ->

    beforeEach ->
      @recommendation_list.populate [ sven, axe, earthshaker, tiny, kunkka ]

      @recommendation_list.clear()

    it 'empties all slots', ->
      for i in [0..4]
        expect(@recommendation_list.boxes[i]).to.be.an.empty_recommendation_box
