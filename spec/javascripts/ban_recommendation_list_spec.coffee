#= require spec_helper
#= require jquery
#= require application

describe 'BanRecommendationList', ->
  beforeEach ->
    $('body').html JST['templates/ban_recommendation_list']()
    @ban_recommendation_list = new BanRecommendationList $('.ban-these')

  describe 'populate', ->

    context 'input is empty', ->

      beforeEach ->
        @ban_recommendation_list.populate()

      it 'does not fill any boxes', ->
        for i in [0..4]
          expect(@ban_recommendation_list.boxes[i]).to.be.an.empty_hero_box

    context 'input contains heroes', ->

      beforeEach ->
        @ban_recommendation_list.populate [ sven, axe, earthshaker, tiny, kunkka ]

      it 'fills first slot', ->
        expect(@ban_recommendation_list.boxes[0]).to.be.a.hero_box_populated_with_hero sven

      it 'fills second slot', ->
        expect(@ban_recommendation_list.boxes[1]).to.be.a.hero_box_populated_with_hero axe

      it 'fills third slot', ->
        expect(@ban_recommendation_list.boxes[2]).to.be.a.hero_box_populated_with_hero earthshaker

      it 'fills fourth slot', ->
        expect(@ban_recommendation_list.boxes[3]).to.be.a.hero_box_populated_with_hero tiny

      it 'fills fifth slot', ->
        expect(@ban_recommendation_list.boxes[4]).to.be.a.hero_box_populated_with_hero kunkka

  describe 'clear', ->

    beforeEach ->
      @ban_recommendation_list.populate [ sven, axe, earthshaker, tiny, kunkka ]
      @ban_recommendation_list.clear()

    it 'empties all slots', ->
      for i in [0..4]
        expect(@ban_recommendation_list.boxes[i]).to.be.an.empty_recommendation_box

  describe 'removeHero', ->

    beforeEach ->
      @ban_recommendation_list.populate [ sven, axe, earthshaker ]
      @ban_recommendation_list.removeHero 2

    it 'empties the given slot', ->
      expect(@ban_recommendation_list.boxes[2]).to.be.an.empty_recommendation_box
